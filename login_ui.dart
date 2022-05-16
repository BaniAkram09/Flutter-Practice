// ignore_for_file: prefer_const_constructors, avoid_print, avoid_single_cascade_in_expression_statements
import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:myapp1/controller/authController.dart';
import 'package:myapp1/main.dart';
import 'package:myapp1/service/firestore_service.dart';
import 'package:myapp1/service/auth.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (con) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(0, 60, 10, 0),
                child: Column(
                  children: [
                    Text('Recipe',
                        style: TextStyle(
                            fontFamily: 'GreatVibes',
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(),
                        TextButton(
                          onPressed: () {
                            // Get.to(Signupui());
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                fit: StackFit.loose,
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.green,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 90,
                        backgroundColor: Colors.white,
                      )
                    ],
                  ),
                  Positioned(
                    top: -40,
                    child: Container(
                      height: 220,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0,
                            spreadRadius: 0.0,
                            offset: Offset(10.0, 10.0),
                          ),
                        ],
                      ),
                      child: Container(
                        // color: Colors.amber,
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: TextField(
                                controller: con.emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.mail_rounded,
                                    color: Colors.grey,
                                  ),
                                  hintText: ' Email',
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: TextField(
                                controller: con.passController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.security_rounded,
                                    color: Colors.grey,
                                  ),
                                  hintText: ' Password',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: SizedBox(
                  // color: Colors.red,
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      ElevatedButton(
                        onPressed: () => con.login(),
                        // onPressed: () {},
                        // onPressed: () async {
                        //   dynamic result;
                        //   con.emailController.text;
                        //   con.passController.text;
                        //   if (result == null) {
                        //     print('error signing in');
                        //     const snackBar = SnackBar(
                        //       duration: Duration(seconds: 1),
                        //       content: Text('email or password is empty'),
                        //       behavior: SnackBarBehavior.floating,
                        //     );
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(snackBar);
                        //   } else {
                        //     print('signed in');
                        //     Flushbar(
                        //       message: "Login Successful",
                        //       duration: Duration(seconds: 1),
                        //       flushbarPosition: FlushbarPosition.TOP,
                        //     )..show(context);
                        //     // print(result);
                        //   }
                        // },
                        child: Text(
                          'Add',
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: StadiumBorder(),
                          primary: Colors.green,
                          padding: EdgeInsets.symmetric(
                              horizontal: 90, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
