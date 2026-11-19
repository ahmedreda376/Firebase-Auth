import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Auth/Presentation/widgets/custom_textformField.dart';
import 'package:flutter_application_1/features/Auth/Presentation/widgets/custombuttonauth.dart';


class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  CollectionReference categories = FirebaseFirestore.instance.collection(
    "categories",
  );

  addCategory() async {
    if (formState.currentState!.validate()) {
      try {
        DocumentReference response = await categories.add({"name": name.text});
        Navigator.of(context).pushReplacementNamed("homepage");
      } catch (e) {
        print("Error $e ");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Category")),
      body: Form(
        key: formState,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: CustomTextForm(
                hinttext: "Enter Name",
                mycontroller: name,
                validator: (val) {
                  if (val == "") {
                    return "Can't To be Empty";
                  }
                  return null;
                },
              ),
            ),
            CustomButtonAuth(
              title: "Add",
              onPressed: () {
                addCategory();
              },
            ),
          ],
        ),
      ),
    );
  }
}
