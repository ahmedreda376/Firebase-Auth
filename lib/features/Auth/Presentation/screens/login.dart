import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Auth/Data/auth.dart';
import 'package:flutter_application_1/features/Auth/Presentation/widgets/custom_textformField.dart';
import 'package:flutter_application_1/features/Auth/Presentation/widgets/custombuttonauth.dart';
import 'package:flutter_application_1/features/Auth/Presentation/widgets/customlogoauth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
                    "LoginScreen",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(height: 10),
                  const Text(
                    "LoginScreen To Continue Using The App",
                    style: TextStyle(color: Colors.grey),
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
              title: "LoginScreen",
              onPressed: () async {
                if (globalKey.currentState!.validate()) {
                  await Auth().login(email.text, password.text, context);
                }
                return;
              },
            ),
            Container(height: 20),

            MaterialButton(
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.red[700],
              textColor: Colors.white,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("LoginScreen With Google  "),
                  Image.asset("images/4.png", width: 20),
                ],
              ),
            ),
            Container(height: 20),
            // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("signup");
              },
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Don't Have An Account ? "),
                      TextSpan(
                        text: "Register",
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
