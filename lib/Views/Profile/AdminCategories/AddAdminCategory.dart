import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Widgets/CustomButton.dart';
import '../../../Widgets/CustomText.dart';

// ignore: must_be_immutable
class AddAdminCategory extends StatefulWidget {
  String category;
  String id;
  bool isUpdate = false;
  AddAdminCategory({this.category, this.id, this.isUpdate});

  @override
  _AddAdminCategoryState createState() => _AddAdminCategoryState();
}

class _AddAdminCategoryState extends State<AddAdminCategory> {
  TextEditingController categoryController = TextEditingController();
  var category = "";
  var id = "";
  bool isUpdate = false;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    category = widget.category;
    id = widget.id;
    isUpdate = widget.isUpdate == null ? false : widget.isUpdate;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    child:
    Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _keyForm,
        child: ListView(
          physics: BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          children: [
            SizedBox(height: 30.0),
            CustomText(text: 'Categories Information', fontSize: 18),
            SizedBox(height: 10.0),
            TextFormField(
              initialValue: category,
              onChanged: (value) => category = value,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Categories name';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  File image;
  String img;
  final picker = ImagePicker();

  Future getImage() async {
    // ignore: deprecated_member_use
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      img = pickedFile.path;

      print("This is uploaded picture");
    }

    setState(() {});
  }

  Future getTakeFoto() async {
    // ignore: deprecated_member_use
    var pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      img = pickedFile.path;
    }
    setState(() {});
  }

  void changePicture(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      enableDrag: false,
      builder: (context) {
        return Container();
      },
    );
  }
}
