import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Navigator.of(context).pushReplacementNamed('home');
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc:
              'Please Open The Link That We Sent To You To Verify Your Email ',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      }

      print("Login Successfully: ${credential.user?.email}");
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

      FirebaseAuth.instance.currentUser!.sendEmailVerification();

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
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  // Signin With Google

  Future signInWithGoogle() async {
    // Web
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    }

    // Android
    await GoogleSignIn.instance.initialize();

    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
