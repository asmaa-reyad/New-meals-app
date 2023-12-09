
import 'dart:typed_data';
import 'package:meals_app/screens/HomeScreen.dart';
import 'package:meals_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/material/dropdown.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  
  Uint8List? _image;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
    }
    
  }

  String? addressValue = 'cairo';
  String? genderValue = 'male';

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phonenumberController.dispose();
    _addressController.dispose();
    _genderController.dispose();

    super.dispose();
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // brightness: Brightness.light
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: Form(
          
          child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff723CDE),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome,Create new account",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage:
                                  MemoryImage(_image ?? Uint8List(0)))
                          : const CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPgEmtQwrC7r80BUtMhPaF6okDFFu41i5fRQ&usqp=CAU"),
                            ),
                      Positioned(
                        child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(Icons.add_a_photo),
                        ),
                        bottom: -10,
                        left: 80,
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8, bottom: 4),

                  Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'UserName',
                            // borderRadius: BorderRadius.circular(50),
                            hintText: 'enter your User Name',
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a User Name to use ';
                            } else if (value.length < 4) {
                              return "User Name must be at least four characters";
                            }
                            return null;
                          }),

                    SizedBox(
                      height: 8
                      ),
                    TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'enter your Email address',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an Email address';
                          } else if (!value.contains("@") ||
                              !value.contains(".")) {
                            return "Please enter a valid Email address";
                          }
                          return null;
                        }),

                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'enter your Password',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a Password';
                        } else if (value.length < 8) {
                          return "Password must be at least eight characters or greater";
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          hintText: 'Confirm your Password',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please re-enter Password';
                          } else if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        }),

                    
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                        controller: _phonenumberController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                          hintText: 'enter your Phone Number',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Phone Number';
                          } else if (!RegExp(
                                  r'^(\+201|01|00201)[0-2,5]{1}[0-9]{8}')
                              .hasMatch(value!)) {
                            return "Please enter a valid Phone Number";
                          }
                          return null;
                        }),

                    
                    SizedBox(
                      height: 8,
                    ),
                    DropdownButton(
                        value: addressValue,
                        onChanged: (newValue) {
                          setState(() {
                            addressValue = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                              value: 'cairo', child: Text('cairo')),
                          DropdownMenuItem(
                              value: 'new cairo', child: Text('new cairo')),
                          DropdownMenuItem(
                              value: 'helwan', child: Text('helwan')),
                          DropdownMenuItem(value: 'giza', child: Text('giza')),
                        ]),

                    
                    SizedBox(
                      height: 8,
                    ),
                    DropdownButton(
                        value: genderValue,
                        onChanged: (newValue) {
                          setState(() {
                            genderValue = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(value: 'male', child: Text('male')),
                          DropdownMenuItem(
                              value: 'female', child: Text('female')),
                        ]),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff723CDE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          textStyle: TextStyle(
                           fontWeight: FontWeight.w600,
                           fontSize: 18                          ),
                        ),
                        child: const Text('SIGN UP'),
                        onPressed: _registerUser
    
                        ),
                    ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      
      ),

    );
    
  }
}
