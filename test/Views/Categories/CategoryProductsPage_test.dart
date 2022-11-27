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

    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);
    
  });
  
  
  testWidgets('Testing if list View Shows items ...', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CategoryProductsPage(category: "Test", uidCategory: ""),
    ));

    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    final card = find.byType(Card);
    expect(card, findsNothing);
  });
}
