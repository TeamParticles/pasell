import 'package:pasell/Views/Categories/CategoryProductsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {


  testWidgets('CategoryProductPage ...', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CategoryProductsPage(category: "Test", uidCategory: ""),
    ));

    final title = find.text('Test');
    expect(title, findsOneWidget);

  
    
  });
  
 
  
}
