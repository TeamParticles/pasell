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
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: CustomText(
                text: isUpdate ? "Update $category" : 'Add Category',
                color: Colors.black),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )),
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
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      
                  ),
                          },
                        
                        child: TextButton(
                          onPressed: () => changePicture(context),
                          child: CustomText(
                            text: 'Choose Category Picture',
                            color: primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      )),
                  
                
              ),
              SizedBox(height: 15.0),
              CustomButton(
                text: isUpdate ? "Update" : 'Save',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 55,
                onPressed: () {
                  print("This is uploaded image ${uploadBloc.picture}");
                  if (_keyForm.currentState.validate()) {
                    !isUpdate
                        ? adminCategoryBloc.add(AddCategoryEvent(
                            category: category,
                            picture: uploadBloc.picture,
                          ))
                        : adminCategoryBloc.add(
                            UpdateCategoryEvent(
                              id: id,
                              category: category,
                              picture: uploadBloc.picture,
                            ),
                          );
                  }
                },
              
    
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

      BlocProvider.of<UploadBloc>(context)
          .add(UploadPictureEvent(picture: img));

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
      BlocProvider.of<UploadBloc>(context)
          .add(UploadPictureEvent(picture: img));
    }
    setState(() {});
  }

  void changePicture(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      enableDrag: false,
      builder: (context) {
        return Container(
            height: 190,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 25.0),
                  child: CustomText(
                      text: 'Change profile picture',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        getImage();
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 22.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                                text: 'Select an image', fontSize: 18)),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        getTakeFoto();
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 22.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: CustomText(
                              text: 'Take a picture',
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
