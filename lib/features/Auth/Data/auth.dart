import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class Auth {
  // Login
  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Login Successfully: ${credential.user?.email}");

      Navigator.of(context).pushReplacementNamed('home');
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: e.message,
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
      print("Firebase Error: ${e.code}");
      print("Message: ${e.message}");
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: e.toString(),
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
      print("Error: $e");
    }
  }

  // SignUp

  Future<void> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      print("Account Created: ${credential.user?.email}");

      Navigator.of(context).pushReplacementNamed('login');
    } on FirebaseAuthException catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: e.message,
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
      print("Firebase Error Code: ${e.code}");
      print("Firebase Error Message: ${e.message}");
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: e.toString(),
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
      print("General Error: $e");
    }
  }

  // LogOut
  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamed('login');
  }
}
