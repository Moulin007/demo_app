import 'package:demo_app/utils/route.dart';
import 'package:demo_app/values/strings.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = "";
  var changeBtn = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.contain),
              const SizedBox(height: 30),
              Text(
                "Welcome $name",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 30.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter you username",
                          labelText: "Username"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter you password",
                          labelText: "Password"),
                    ),
                    const SizedBox(height: 30),

                    InkWell(
                      onTap: () async {
                        setState(() {
                          changeBtn = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeBtn ? 40.0 : 130.0,
                        height: 40.0,
                        // ignore: sort_child_properties_last
                        child: changeBtn
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                Strings.login,
                                style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.circular(changeBtn ? 40.0 : 8.0)),
                      ),
                    )

                    // ElevatedButton(
                    //   // ignore: sort_child_properties_last
                    //   child: const Text(
                    //     "Login",
                    //     style: TextStyle(fontSize: 17.0),
                    //   ),
                    //   style: TextButton.styleFrom(minimumSize: Size(130, 40.0)),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    // )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
