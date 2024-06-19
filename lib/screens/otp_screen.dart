import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../provider/auth_provider.dart';
import '../utils/utils.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final _isLoading =
        Provider.of<AuthProvider>(context, listen: false).isLoading;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _isLoading == true
            ? const Center(
          child: CircularProgressIndicator(color: Colors.black),
        )
            : Center(
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
              "OTP Verification"
                  .text
                  .xl3
                  .fontFamily('RobotoMono')
                  .bold
                  .make()
                  .py12(),
              "Enter the OTP sent to your number"
                  .text
                  .gray400
                  .fontFamily('RobotoMono')
                  .make(),
              const SizedBox(height: 30),
              Pinput(
                length: 4,
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
                  textStyle: const TextStyle(
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
                  textStyle: const TextStyle(
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: CustomButton(
                  text: "VERIFY & PROCEED",
                  onPressed: () {
                    if (otpCode != null) {
                      verifyOtp(context, otpCode!);
                    } else {
                      showSnackBar(context, "Enter 4-Digit code");
                    }
                  },
                ).px24(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        ap.checkExistingUser().then(
              (value) async {
            if (value == true) {
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                      (value) => ap.setSignIn().then(
                        (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                          (route) => false,
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
