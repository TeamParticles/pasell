import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pasell/Bloc/Auth/auth_bloc.dart';
import 'package:pasell/Views/Login/SignupPage.dart';

void main() {

  group('Register screen test', (){

    testWidgets('Signup  screen test with fields', (tester) async {
  
      await tester.pumpWidget(
        MaterialApp(
          home:BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(CheckLoginEvent()),
          child: SignUpPage(),
        ),),);
      

      await tester.pump();

      expect(find.text('Sign Up'),findsNWidgets(2));

      final usernameField = find.text('Username');
      expect(usernameField, findsOneWidget);

      final emailField = find.text('Email Address');
      expect(emailField, findsOneWidget);

      final passwordField = find.text('Password');
      expect(passwordField, findsOneWidget);

      final repeatpasswordField = find.text('Repeat Password');
      expect(repeatpasswordField, findsOneWidget);

      final signbtn = find.text('Sign Up');
      expect(signbtn, findsNWidgets(2));  

    });

    testWidgets('Sign up screen test with icon', (tester) async {
  
      await tester.pumpWidget(
        MaterialApp(
          home:BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(CheckLoginEvent()),
          child: SignUpPage(),
        ),),);
      
      await tester.pump();

      expect(find.byIcon(Icons.person_outline_rounded), findsOneWidget);
      expect(find.byIcon(Icons.email_outlined), findsOneWidget);
      expect(find.byIcon(Icons.vpn_key_rounded), findsNWidgets(2));

    });




  });
  
  
}

