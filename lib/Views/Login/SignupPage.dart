import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../Widgets/CustomText.dart';
import '../../Widgets/CustomButton.dart';

class SignUpPage extends StatelessWidget {
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passowrdController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void notify() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'Registered  Successfully',
          body: 'pa sell',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture:
              'https://images.idgesg.net/images/article/2019/01/android-q-notification-inbox-100785464-large.jpg?auto=webp&quality=85,70'),
    );
  }

  @override
  Widget build(BuildContext context) {
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 15, 11, 11),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            TextButton(
              child:
                  CustomText(text: 'SignIn', fontSize: 18, color: Colors.white),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('signInPage'),
            ),
            SizedBox(width: 5)
          ],
        ),
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: TextFormFrave(
                  hintText: 'Username',
                  fontSize: 18,
                  prefixIcon: Icons.person_outline_rounded,
                  controller: userController,
                  validator:
                      RequiredValidator(errorText: 'Username is required'),
                ),
              ),
              // SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: TextFormFrave(
                    hintText: 'Email Address',
                    type: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
                    controller: emailController,
                    validator: validatedEmail),
              ),
              // SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: TextFormFrave(
                  hintText: 'Password',
                  prefixIcon: Icons.vpn_key_rounded,
                  obscureText: true,
                  controller: passowrdController,
                  validator: passwordValidator,
                ),
              ),
              // SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: TextFormFrave(
                    hintText: 'Repeat Password',
                    controller: passController,
                    prefixIcon: Icons.vpn_key_rounded,
                    obscureText: true,
                    validator: (val) =>
                        MatchValidator(errorText: 'Password do not macth ')
                            .validateMatch(val, passowrdController.text)),
              ),
              // SizedBox(height: 25.0),
              // SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: CustomButton(
                  text: 'Sign Up',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  height: 60,
                  onPressed: () {
                    
                    }
                  
                ),
              )
            ],
          ),
        ),
      )
    
  }
}
