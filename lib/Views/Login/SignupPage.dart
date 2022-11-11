import 'package:flutter/material.dart';

import '../../Widgets/CustomText.dart';
import '../../Widgets/CustomButton.dart';

class SignUpPage extends StatelessWidget {
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passowrdController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Image.asset(
                    'Assets/logoo.png',
                    height: 40,
                  ),
                ),
              ],
            ),
            // Row(),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: CustomText(
                text: 'Sign Up',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 25, 175, 202),
              ),
            ),

            // Padding(padding: EdgeInsets.only(right: 120)),
            // SizedBox(height: 20.0),

            // SizedBox(height: 15.0),

            // SizedBox(height: 15.0),

            // SizedBox(height: 15.0),

            // SizedBox(height: 25.0),
            // SizedBox(height: 25.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: CustomButton(
                  text: 'Sign Up',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  height: 60,
                  onPressed: () {
                    // notify();
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
