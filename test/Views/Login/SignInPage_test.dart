import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pasell/Bloc/Auth/auth_bloc.dart';
import 'package:pasell/Views/Login/SignInPage.dart';

void main() {

  group('Login screen test', (){

     testWidgets('SignInPage ...', (tester) async {

        await tester.pumpWidget(
          MaterialApp(
            home:BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(CheckLoginEvent()),
            child: SignInPage(),
          ),),);
        

        await tester.pump(); 

        expect(find.text('SignIn'), findsOneWidget);

        final emailField = find.text('Enter your Email ID');
        expect(emailField, findsOneWidget);

        final passwordField = find.text('Enter your password');
        expect(passwordField, findsOneWidget);
        
        // final passwordField = find.byText(passwordValidator);
        // expect(passwordField, findsOneWidget);
        // await tester.enterText(passwordField, '1234567890');
        // expect(find.byIcon(icon), findsOneWidget);

        expect(find.text('Forgot password?'),findsOneWidget);

        expect(find.text('Do not have an account? Sign up'), findsOneWidget);

        final loginbtn = find.text('Login');
        expect(loginbtn, findsOneWidget);

        await tester.tap(loginbtn);
        await tester.pumpAndSettle();

      });

  });
 
}
