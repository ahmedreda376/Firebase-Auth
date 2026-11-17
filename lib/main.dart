import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/features/Auth/Presentation/screens/home_screen.dart';
import 'package:flutter_application_1/features/Auth/Presentation/screens/login.dart';
import 'package:flutter_application_1/features/Auth/Presentation/screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=============== User is Signed Out ===============');
      } else {
        print('=============== User is Signed in ===============');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? LoginScreen() : HomeScreen(),
      routes: {
        "signup": (context) => SignUp(),
        "login": (context) => LoginScreen(),
        "home": (context) => HomeScreen(),
      },
    );
  }
}
