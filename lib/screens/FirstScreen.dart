// import 'package:meals_app/screens/loginScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:meals_app/screens/SignupScreen.dart';

// class FirstScreen extends StatefulWidget {
//   const FirstScreen({Key? key}) : super(key: key);

//   @override
//   State<FirstScreen> createState() => _FirstScreenState();
// }

// class _FirstScreenState extends State<FirstScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return
//     Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [
//           Color.fromARGB(255, 252, 251, 252),
//           // Color(0xff281537),
//         ])),
//         child: Column(children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 200.0),
//             child: Image(image: AssetImage('assets/logo.png')),
//           ),
//           const SizedBox(
//             height: 100,
//           ),
//           const Text(
//             'Welcome to your favorite app',
//             style: TextStyle(fontSize: 30, color: Color(0xff171A1F)),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const LoginScreen()));
//             },
//             child: Container(
//               height: 53,
//               width: 320,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(color: Colors.white),
//                 color: Color(0xff723CDE)
//               ),
//               child: const Center(
//                 child: Text(
//                   'LOG IN',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const SignupScreen()));
//             },
//             child: Container(
//               height: 53,
//               width: 320,
//               decoration: BoxDecoration(
//                 color: Color(0xff723CDE),
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(color: Color(0xff723CDE)),
//               ),
//               child: const Center(
//                 child: Text(
//                   'SIGN UP',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//           const Spacer(),
//           const Text(
//             'Login with Social Media',
//             style: TextStyle(fontSize: 17, color: Colors.white),
//           ), //
//           const SizedBox(
//             height: 12,
//           ),
//           const Image(image: AssetImage('assets/social.png'))
//         ]),
//       ),
//     );
//   }
// }

import 'package:meals_app/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/SignupScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Column(
              children: <Widget>[
                Text(
                  "Hi All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Color(0xff723CDE),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome to Your Favorite App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.fitWidth),
              ),
            ),
            Column(
              children: <Widget>[
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "LOG IN",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    color: const Color(0xff723CDE),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "SIGN UP",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
