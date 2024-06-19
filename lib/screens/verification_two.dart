// import 'package:flutter/material.dart';
// import 'package:sign_in_button/sign_in_button.dart';
//
// class SecondVerification extends StatefulWidget {
//   @override
//   _SecondVerificationState createState() => _SecondVerificationState();
// }
//
// class _SecondVerificationState extends State<SecondVerification> {
//   String selectedCountry = 'IN'; // Default selected country
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Welcome Back!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: SizedBox(
//                     height: 70,
//                     child: SignInButton(
//                       Buttons.facebook,
//                       text: "APPLY WITH FACEBOOK",
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: SizedBox(
//                     height: 70,
//                     child: SignInButton(
//                       Buttons.google,
//                       text: "APPLY WITH GOOGLE",
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text('OR'),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text('Enter Mobile Number:'),
//                 SizedBox(width: 10),
//                 DropdownButton(
//                   value: selectedCountry,
//                   onChanged: (String? value) {
//                     setState(() {
//                       selectedCountry = value!;
//                     });
//                   },
//                   items: [
//                     DropdownMenuItem(
//                       value: 'USA',
//                       child: Text('(USA) +1'),
//                     ),
//                     // Add more countries as needed
//                   ],
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Enter your phone number',
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.phone,
//                     onChanged: (value) {
//                       // Handle phone number input
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle log in button press
//               },
//               child: Text('LOG IN'),
//             ),
//             SizedBox(height: 10),
//             Text('Forgot Password?'),
//             SizedBox(height: 10),
//             Text('DON\'T HAVE AN ACCOUNT? SIGN UP'),
//           ],
//         ),
//       ),
//     );
//   }
// }
