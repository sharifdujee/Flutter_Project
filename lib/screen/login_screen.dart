import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screen/registretion_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Screen',
          style: GoogleFonts.dekko(
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(50, 30),
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.elliptical(30, 50),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/img_2.png',
                    //color: Colors.grey[500],
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Form(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            border:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular((10))
                            ),
                            labelText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              child: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(onPressed: () {
                        print(emailController.text);
                        print(passwordController.text);
                      }, child: Text('Login')),
                      TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationPage()));
                          },
                          icon: Icon(Icons.navigate_next),
                          label: Text('Sign Up'))
                    ],
                  )),
                  /* Container(

                    height: MediaQuery.of(context).size.height*0.6,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                    ),


                  ),*/
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
