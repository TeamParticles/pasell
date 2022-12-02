import 'package:flutter/material.dart';
import '../../Widgets/CustomText.dart';
import '../../Widgets/CustomButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _ListProductsCard(),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              height: 133,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 10,
                        spreadRadius: 5)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                            text: 'Total',
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.0),
                  CustomButton(
                    text: 'Checkout',
                    borderRadius: 50,
                    fontSize: 20,
                    height: 56,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
