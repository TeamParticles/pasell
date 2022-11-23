import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pasell/Bloc/Admin/AdminCategoryBloc/admin_category_bloc.dart';
import 'package:pasell/Views/Profile/AdminCategories/AdminCategories.dart';

void main() {

  group('Admin categories  : ', (){

    testWidgets('admin categories test passed ', (tester) async {
     await tester.pumpWidget(
        MaterialApp(
          home:BlocProvider<AdminCategoryBloc>(
          create: (context) => AdminCategoryBloc(),
          child: AdminCategories(),
        ),),);
      

      await tester.pump();
      
      final title = find.text('Manage Categories');
      expect(title, findsOneWidget);
      expect(find.byIcon(Icons.arrow_back_ios_new_rounded), findsOneWidget);

      expect(find.text('All Categories'), findsOneWidget);
      
      final container = find.byType(Container);
      expect(container, findsOneWidget);

      
      final addbtn = find.text('Add');
      expect(addbtn, findsOneWidget);
      await tester.tap(addbtn);




     });

   

   

   
  });
  
}