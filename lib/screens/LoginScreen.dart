import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Material();
  }
}


// Column(
//                 children: <Widget>[
                //   TextFormField(
                //     decoration: InputDecoration(labelText: "Enter your Email"),
                //     validator: (Value) {
                //       if (Value!.isEmpty ||
                //           !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(Value!)) {
                //         return "Enter correct email";
                //       } else {
                //         return null;
                //       }
                //     },
                //   ),
                //  SizedBox(height: 10),

                //   TextFormField(
                //     decoration: InputDecoration(labelText: "Enter your Name"),
                //     validator: (Value) {
                //       if (Value!.isEmpty ||
                //           !RegExp(r'^[a-z A-Z]+$').hasMatch(Value!)) {
                //         return "Enter correct name";
                //       } else {
                //         return null;
                //       }
                //     },
                //   ),
                //   TextFormField(
                //     decoration: InputDecoration(labelText: "Enter your Phone number"),
                //     validator: (Value) {
                //       if (Value!.isEmpty ||
                //           !RegExp(r'^(\+201|01|00201)[0-2,5]{1}[0-9]{8}').hasMatch(Value!)) {
                //         return "Enter correct phone number";
                //       } else {
                //         return null;
                //       }
                //     },
                //   ),

