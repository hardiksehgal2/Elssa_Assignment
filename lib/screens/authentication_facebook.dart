import 'package:elssa/firebaseservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_screen.dart';

class FacebookAuthentication extends StatefulWidget {
  const FacebookAuthentication({Key? key}) : super(key: key);

  @override
  State<FacebookAuthentication> createState() => _FacebookAuthenticationState();
}

class _FacebookAuthenticationState extends State<FacebookAuthentication> {
  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Authentication'),
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: _isLoggedIn
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_userObj["name"] ?? "Name not available"),
            Text(_userObj["email"] ?? "Email not available"),
            TextButton(
              onPressed: () {
                FacebookAuth.instance.logOut().then((value) {
                  setState(() {
                    _isLoggedIn = false;
                    _userObj = {};
                  });
                });
              },
              child: "Logout".text.make(),
            ),
          ],
        )
            : Center(
          child: ElevatedButton(
            onPressed: () async {
              signInWithFacebook();
              // FacebookAuth.instance
              //     .login(permissions: ["public_profile", "email"])
              //     .then((value) {
              //   FacebookAuth.instance.getUserData().then((userData) {
              //     if (userData != null && userData.isNotEmpty) {
              //       setState(() {
              //         _isLoggedIn = true;
              //         _userObj = userData;
              //       });
              //       // Navigate to HomeScreen after successful login
              //       if(_isLoggedIn){
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => HomeScreen(),
              //           ),
              //         );
              //       }
              //       else{
              //
              //       }
              //     } else {
              //       // Handle error or show a message that data is not available
              //     }
              //   });
              // });
            },
            child: Text('Login with Facebook'),
          ),
        ),
      ),
    );
  }
}