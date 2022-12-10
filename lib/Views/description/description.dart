//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Description>>(
      future: dbHomeController.getListProductsHome(),
      builder: (context, snapshot) {
        List<Description> list = snapshot.data;
        print("$list, this is snapshot of data");
        return !snapshot.hasData
            ? CircularProgressIndicator
            : GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 220),
                itemCount: list.length == null ? 0 : list.length,
                itemBuilder: (context, i) => Container(
                  // padding: EdgeInsets.only(top: 0, bottom: 40),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 235, 235),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: GestureDetector(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: double.infinity,
                            // height: 140,
                            // width: 300,
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.3,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  scale: 2.0,
                                ),
                              ),
                            )),
                        // Divider(),
                        // Container(
                        //   child: Hero(
                        //       tag: list[i].id,
                        //       child: Image.network(
                        //         publicServerUrl + list[i].picture,
                        //         height: 150,
                        //         fit: BoxFit.cover,
                        //       )),
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 5, right: 0, bottom: 0, top: 7),
                            ),

                            Row(
                              children: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
