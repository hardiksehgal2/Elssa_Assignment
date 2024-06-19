import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;

  const OTPScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  String? otpCode;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              child: Image.asset("assets/relax.jpg"),
            ),
            const SizedBox(height: 30),
            "OTP Verification".text.xl3.fontFamily('RobotoMono').bold.make().py12(),
            "Enter the OTP sent to your number".text.gray400.fontFamily('RobotoMono').make(),
            const SizedBox(height: 30),
            Pinput(
              length: 6,
              showCursor: true,
              defaultPinTheme: const PinTheme(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              focusedPinTheme: const PinTheme(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onCompleted: (value) {
                setState(() {
                  otpCode = value;
                });
              },
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "OTP not received?".text.make(),
                TextButton(
                  onPressed: () {},
                  child: "RESEND OTP".text.blue500.make(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: CustomButton(
                text: "VERIFY & PROCEED",
                onPressed: () {
                  if (otpCode != null && otpCode!.length == 6) {
                    verifyOtp(context, otpCode!);
                  } else {
                    showSnackBar(context, "Enter 6-Digit code");
                  }
                },
              ).px24(),
            ),
          ],
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) async {
    setState(() {
      isLoading = true;
    });

    try {
      // Create PhoneAuthCredential with the verification ID and OTP entered by the user
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: userOtp,
      );

      // Sign in the user with the credential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // If sign in is successful, navigate to HomeScreen
      if (userCredential.user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
        );
      }
    } catch (e) {
      showSnackBar(context, "Failed to verify OTP");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
