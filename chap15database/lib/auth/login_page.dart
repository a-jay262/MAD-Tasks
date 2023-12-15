import 'package:chap15database/auth/register_page.dart';
import 'package:chap15database/auth/service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            )
          : SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Groupie",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text("Login now to see what they are talking!",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                          Image.network(
                              "data:image/png;base64,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"),
                          TextFormField(
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },

                            // check tha validation
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val!)
                                  ? null
                                  : "Please enter a valid email";
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            obscureText: true,
                            validator: (val) {
                              if (val!.length < 6) {
                                return "Password must be at least 6 characters";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              String res = await Authmethod()
                                  .signinuser(email, password);
                              if (res == 'success') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              } else {
                                print(res);
                              }
                            },
                            child: Container(
                              child: Text("Log in"),
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                color: Color.fromARGB(255, 142, 4, 170),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text.rich(TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Register here",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()));
                                    }),
                            ],
                          )),
                        ],
                      )),
                ),
              ),
            ),
    );
  }
}
