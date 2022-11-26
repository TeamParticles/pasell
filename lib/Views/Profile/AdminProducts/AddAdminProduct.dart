import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Widgets/CustomButton.dart';
import '../../../Widgets/CustomText.dart';

// ignore: must_be_immutable
class AddAdminProduct extends StatefulWidget {
  bool isUpdate = false;

  @override
  _AddAdminProductstate createState() => _AddAdminProductstate();
}

class _AddAdminProductstate extends State<AddAdminProduct> {
  TextEditingController categoryController = TextEditingController();
  Product product = Product(
      id: "",
      categoryId: CategoryId(id: "", category: ""),
      codeProduct: "",
      description: "",
      nameProduct: "",
      picture: "",
      price: 0.0,
      status: "",
      stock: 0,
      v: 0);
  bool isUpdate = false;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.product?.id != null) {
      product = widget.product;
    }

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
                text:
                    isUpdate ? "Update ${product.nameProduct}" : 'Add Product',
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
              CustomText(text: 'Product Details', fontSize: 18),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Product Name"),
                initialValue: product.nameProduct,
                onChanged: (value) => product.nameProduct = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Product Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Item Details"),
                initialValue: product.description,
                onChanged: (value) => product.description = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Item Details';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(hintText: "Discount Cupon "),
                initialValue: product.codeProduct,
                keyboardType: TextInputType.number,
                onChanged: (value) => product.codeProduct = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Discount Cupon';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    InputDecoration(hintText: "Enter Total Stock Quantity"),
                keyboardType: TextInputType.number,
                initialValue: product.stock.toString(),
                onChanged: (value) => product.stock = int.parse(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter stock';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Price"),
                keyboardType: TextInputType.number,
                initialValue: product.price.toString(),
                onChanged: (value) => product.price = double.parse(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              FutureBuilder<List<Category>>(
               
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? DropdownSearch<Category>(
                          // selectedItem: snapshot.data[0],
                          items: snapshot.data,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "Select a Category",
                              labelText: "Select Category",
                              contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                            ),
                          
                          // onFind: (String filter) => getData(filter),
                          
                     
                },
              ),
              SizedBox(height: 20.0),
              DropdownSearch<String>(
                // selectedItem: snapshot.data[0],
                items: ["Avaliable", "Not Avaliable"],
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Select a Status",
                    labelText: "Status",
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  ),
                ),
                itemAsString: (String p) => p,
                onChanged: (String data) => product.status = data,
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 15.0),
  
                        child: TextButton(
                          onPressed: () => changePicture(context),
                          child: CustomText(
                            text: 'Choose Product Image',
                            color: primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ))
  },
                  SizedBox(height: 15.0),
                ],
              ),
              SizedBox(height: 15.0),
              
            
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
