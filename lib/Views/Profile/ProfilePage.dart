import 'dart:async';
import 'dart:io';

import '../Start/HomeScreenPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:animate_do/animate_do.dart';

import '../../Widgets/CustomText.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:proximity_sensor/proximity_sensor.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Stack(
        children: [
          ListProfile(),
          Positioned(
            bottom: 20,
            child: Container(
                width: size.width,
                ),
          ),
        ],
      ),
    );
  }
}

class ListProfile extends StatefulWidget {
  @override
  _ListProfileState createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  File image;
  String img;
  final picker = ImagePicker();
  bool _isNear = false;
  StreamSubscription<dynamic> _streamSubscription;

  @override
  void initState() {
    listenProximitySensor();
    super.initState();
  }

  // dispose
  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  Future<void> listenProximitySensor() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (foundation.kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
    };
    _streamSubscription = ProximitySensor.events.listen((int event) {
      setState(() {
        _isNear = (event > 0) ? true : false;
      });
    });
  }

  Future getImage() async {
    // ignore: deprecated_member_use
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      img = pickedFile.path;

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

  @override
  Widget build(BuildContext context) {
    _isNear ? getTakeFoto() : print("no");
    final size = MediaQuery.of(context).size;
   
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: CustomText(
                  text: 'Profile Updated successfully!', fontSize: 18),
              backgroundColor: Colors.green));
       
      
      child: BlocBuilder(
        builder: (context, state) {
          return ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 35.0, bottom: 90.0),
            children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      
                          
                           
                            ),
                  SizedBox(width: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BounceInRight(
                        child: Align(
                            alignment: Alignment.center,
                            child: CustomText(
                              text: state.username,
                              fontSize: 21,
                              color: Colors.black,
                            )),
                      ),
                      FadeInRight(
                        child: Align(
                            alignment: Alignment.center,
                            child: CustomText(
                              text: state.email,
                              fontSize: 18,
                              color: Colors.grey,
                            )),
                      ),
                    ],
                  ),
                
              SizedBox(height: 25.0),
              Container(
                height: 61,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Column(
                  children: [
                    CardProfile(
                      text: 'Profile',
                      borderRadius: BorderRadius.circular(50.0),
                      icon: Icons.person,
                      backgroundColor: Color.fromARGB(255, 79, 84, 152),
                      ),
                    
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              state.role == "Admin"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: CustomText(
                            text: 'Admin Panel',
                            fontSize: 17,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 110.h,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Column(
                            children: [
                              CardProfile(
                                text: 'Product Items',
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30.0)),
                                backgroundColor: Color(0xff2EAA9B),
                                icon: Icons.settings_applications,
                                ),
                              
                              _Divider(size: size),
                              CardProfile(
                                text: 'Available Product',
                                backgroundColor: Color(0xff0716A5),
                                icon: Icons.shopping_bag_outlined,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30.0)),
                               
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: CustomText(
                  text: 'General',
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 130.sm,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Column(
                  children: [
                    CardProfile(
                      text: 'Wishlist',
                      backgroundColor: Color.fromARGB(255, 169, 7, 7),
                      icon: Icons.favorite_border_rounded,
                      borderRadius: BorderRadius.zero,
                   
                    ),
                    _Divider(size: size),
                    CardProfile(
                      text: 'Order History',
                      backgroundColor: Color.fromARGB(255, 7, 165, 65),
                      icon: Icons.history,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30.0)),
                    
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              
              CardProfile(
                text: 'Sign Out',
                borderRadius: BorderRadius.circular(50.0),
                icon: Icons.power_settings_new_sharp,
                backgroundColor: Color.fromARGB(255, 204, 48, 37),
                
              ),
            ],
              ),
          ); 
        },
      
    );
  }

  }

