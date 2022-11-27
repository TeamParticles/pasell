import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:shimmer/shimmer.dart';


import '../../../Widgets/CustomText.dart';
import 'AddAdminProduct.dart';

class AdminProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(text: 'Manage Products', color: Colors.black),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        // height: 1.sh,
        child: Column(
          children: [
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'All Item list',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).push(customRoute(
                          page: AddAdminProduct(), curved: Curves.easeInOut)),
                      child: Text(
                        "Add New Items",
                        style: TextStyle(fontSize: 15.sm),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
              child: _ListProducts(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListProducts extends StatefulWidget {
  @override
  State<_ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<_ListProducts> {
  @override
  Widget build(BuildContext context) {
    
      
      child: Container(
        height: 600.sm,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<>>(
          
          builder: (context, snapshot) {
            print("This is snapsohot of Product data ${snapshot.data}");
          

            return !snapshot.hasData
                ? _LoadingShimmerProducts()
                : RefreshIndicator(
                    onRefresh: () async {
                     
                      setState(() {});
                      
                    },
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: list.length == null ? 0 : list.length,
                      itemBuilder: (context, i) => Container(
                        margin: EdgeInsets.all(10.sm),
                        padding: EdgeInsets.symmetric(vertical: 10.sm),
                        width: 150,
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              list[i].nameProduct,
                              style: GoogleFonts.getFont('Roboto',
                                  fontSize: 18, color: primaryColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Container(
                              width: 100.sm,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    splashColor:
                                        Color.fromARGB(255, 192, 118, 241),
                                    icon: Icon(
                                      Icons.edit,
                                      color: primaryColor,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push((
                                          page: AddAdminProduct(
                                              isUpdate: true, product: list[i]),
                                          curved: Curves.easeInOut));
                                    },
                                  ),
                                  IconButton(
                                    splashColor:
                                        Color.fromARGB(255, 253, 154, 154),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
  
  }
}


  
