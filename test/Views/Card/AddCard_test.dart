import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pasell/Views/Profile/Card/AddCard.dart';

void main() {
  testWidgets('AddCard ...', (tester) async {
   
     await tester.pumpWidget(MaterialApp(
      home: AddCreditCardPage()));
      
      final title = find.text('Add Cards');
      expect(title, findsOneWidget);

      expect(find.byIcon(Icons.arrow_back_ios_rounded), findsOneWidget);

      expect(find.text('test'), findsOneWidget);
      
  });
 
}