import 'package:flutter/widgets.dart';

import 'package:flutter_application_1/features/Auth/Data/auth.dart';
import 'package:material_ui/material_ui.dart';


class HomeScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(
            onPressed: () async {
              await Auth().logOut(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
