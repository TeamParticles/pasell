import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        builder: (contexts, widgets) => MaterialApp(
          theme: ThemeData(primarySwatch: Colors.red).copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          themeMode: ThemeMode.system,
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Pasell',
        ),
      ),
    );
  }
}
