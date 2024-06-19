// import 'package:elssa/google_authentication.dart';
import 'package:elssa/provider/auth_provider.dart';
import 'package:elssa/screens/authentication_facebook.dart';
import 'package:elssa/screens/home_screen.dart';
import 'package:elssa/screens/otpscreen.dart';
import 'package:elssa/screens/register_screen.dart';
import 'package:elssa/screens/verification_two.dart';
import 'package:elssa/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options:const FirebaseOptions(
        apiKey: "AIzaSyDy5eIb1MWbVnvQ2ZQLR3XgE0kFexfidQg",
        authDomain: "elssa-8642c.firebaseapp.com",
        projectId: "elssa-8642c",
        storageBucket: "elssa-8642c.appspot.com",
        messagingSenderId: "1072009581515",
        appId: "1:1072009581515:web:6e2a8ec8e85722ba42dc4e",
      ),

    );
  } catch (e) {
    print('Firebase initialization error: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home:  WelcomeScreen(),
        title: "FlutterPhoneAuth",
      ),
    );
  }
}
