import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/RegisterScreen.dart';
import 'package:flutter_application_1/pages/layoutScreen.dart';

class loginscreen extends StatefulWidget {
  loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  Widget build(BuildContext context) {
    bool showPassword = true;
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("login",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: emailcontroller,
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);

                      if (value!.isEmpty) {
                        return "email must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password must not be empty";
                      } else if (value.length < 5) {
                        return "password is too short";
                      }
                      return null;
                    },
                    obscureText: showPassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: () {
                              StepState() {
                                showPassword = !showPassword;
                              }
                            },
                            icon: 
                            // ignore: dead_code
                            Icon(showPassword?  Icons.visibility_off : Icons.visibility)
                      
                                ),
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(25)),
                      child: MaterialButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            if (kDebugMode) {
                              print(emailcontroller.text);
                            }
                            if (kDebugMode) {
                              print(passwordcontroller.text);
                            }

                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailcontroller.text.toString(),
                                    password: passwordcontroller.text)
                                .then(
                              (value) {
                                if (kDebugMode) {
                                  print(value.user?.email);
                                }
                                if (kDebugMode) {
                                  print(value.user?.uid);
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                            ).catchError((error) {
                              if (kDebugMode) {
                                print(error.toString());
                              }
                            });
                          }
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerscreen()));
                          },
                          child: const Text("register now"))
                    ],
                  )
                ]),
              ),
            )));
  }
}
