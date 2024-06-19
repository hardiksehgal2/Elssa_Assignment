import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import '../screens/otpscreen.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: double.infinity,
                child: Image.asset("assets/relax.jpg"),
              ),
              const SizedBox(height: 30),
              "Your Home Service Expert".text.xl2.fontFamily('RobotoMono').bold.make().py12(),
              "Continue with Phone Number".text.gray400.fontFamily('RobotoMono').make(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextFormField(
                  controller: phoneController,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (Country value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          );
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: phoneController.text.length == 10
                        ? Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (isLoading)
                const CircularProgressIndicator(),
              if (!isLoading)
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: CustomButton(
                      text: "Login",
                      onPressed: () => sendPhoneNumber(),
                    ),
                  ),
                ),
              const SizedBox(height: 30),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "ALREADY HAVE AN ACCOUNT?".text.gray400.fontWeight(FontWeight.w100).make(),
                  TextButton(
                    onPressed: () {

                    },
                    child: "LOG IN".text.blue600.make(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendPhoneNumber() async {
    setState(() {
      isLoading = true;
    });
    String phoneNumber = "+${selectedCountry.phoneCode}${phoneController.text.trim()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        setState(() {
          isLoading = false;
        });
        // Handle verification automatically completed (e.g., auto-retrieval of SMS code)
        signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException exception) {
        setState(() {
          isLoading = false;
        });
        // Handle verification failure
        print("Verification failed: ${exception.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OTPScreen(verificationId: verificationId)),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          isLoading = false;
        });
        // Handle code auto-retrieval timeout
        print("Code auto-retrieval timed out. Verification ID: $verificationId");
        // Optionally, notify the user or take other actions
      },
    );
  }

  void signInWithCredential(PhoneAuthCredential credential) {
    FirebaseAuth.instance.signInWithCredential(credential).then((userCredential) {
      // Handle sign-in success, navigate to the next screen, etc.
      print("User signed in successfully: ${userCredential.user?.uid}");
    }).catchError((error) {
      // Handle sign-in failure
      print("Sign-in error: $error");
    });
  }
}
