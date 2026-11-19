import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Auth/Data/auth.dart';
import 'package:flutter_application_1/features/Auth/Presentation/widgets/custom_textformField.dart';
import 'package:flutter_application_1/features/Auth/Presentation/widgets/custombuttonauth.dart';
import 'package:flutter_application_1/features/Auth/Presentation/widgets/customlogoauth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 50),
                  const CustomLogoAuth(),
                  Container(height: 20),
                  const Text(
                    "SignUp",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(height: 10),
                  const Text(
                    "SignUp To Continue Using The App",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(height: 20),
                  const Text(
                    "username",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(height: 10),
                  CustomTextForm(
                    validator: (value) {
                      if (value == '') {
                        return 'Field Is Required';
                      } else if (value!.length < 3) {
                        return 'Should Be More Than 3';
                      }
                      return null;
                    },
                    hinttext: "ُEnter Your username",
                    mycontroller: username,
                  ),
                  Container(height: 20),
                  const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(height: 10),
                  CustomTextForm(
                    validator: (value) {
                      if (value == '') {
                        return 'Field Is Required';
                      } else if (value!.length < 3) {
                        return 'Should Be More Than 3';
                      }
                      return null;
                    },
                    hinttext: "ُEnter Your Email",
                    mycontroller: email,
                  ),
                  Container(height: 10),
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(height: 10),
                  CustomTextForm(
                    validator: (value) {
                      if (value == '') {
                        return 'Field Is Required';
                      } else if (value!.length < 3) {
                        return 'Should Be More Than 3';
                      }
                      return null;
                    },
                    hinttext: "ُEnter Your Password",
                    mycontroller: password,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    alignment: Alignment.topRight,
                    child: const Text(
                      "Forgot Password ?",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonAuth(
              title: "SignUp",
              onPressed: () async {
                if (globalKey.currentState!.validate()) {
                  await Auth().signUp(email.text, password.text, context);
                } else {
                  return;
                }
              },
            ),
            Container(height: 20),

            Container(height: 20),
            // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("login");
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Have An Account ? "),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
