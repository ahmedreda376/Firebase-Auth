// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Auth/Data/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.of(context).pushNamed("addcategory");
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Homepage'),
        actions: [
          IconButton(
            onPressed: () async {
              // await GoogleSignIn.instance.signOut();

              await Auth().logOut(context);

              if (!context.mounted) return;

              Navigator.of(context)
                  .pushNamedAndRemoveUntil("login", (route) => false);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: GridView(
        // 3
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 160,
        ),
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset("images/folder.png", height: 100),
                  Text("Company"),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset("images/folder.png", height: 100),
                  Text("Home"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
