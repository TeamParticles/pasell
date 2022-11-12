import 'package:flutter/material.dart';

import '../../Widgets/CustomText.dart';

import '../Start/HomeScreenPage.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    child:
    Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
          height: 120,
          width: 280,
          decoration: BoxDecoration(
              color: Color.fromARGB(237, 255, 255, 255),
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: 'Pasell', fontSize: 20, fontWeight: FontWeight.w500),
              SizedBox(height: 20.0),
              Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 15.0),
                  CustomText(
                    text: '......',
                    fontSize: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
