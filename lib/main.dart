import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Bloc/Auth/auth_bloc.dart';

import 'Bloc/General/general_bloc.dart';

import 'Routes/Routes.dart';

void main() async {
  AwesomeNotifications().initialize('resource://drawable/ic', [
    NotificationChannel(
        channelKey: 'key1',
        channelName: 'pasell',
        channelDescription: "pasell",
        defaultColor: const Color(0XFF9050DD),
        ledColor: const Color.fromARGB(255, 14, 120, 241),
        playSound: true,
        channelShowBadge: true,
        enableLights: true,
        importance: NotificationImportance.High,
        enableVibration: true)
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(CheckLoginEvent())),
        BlocProvider(create: (context) => GeneralBloc()),
      ],
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
          // initialRoute: 'dashboard',
          initialRoute: 'loadingPage',

          routes: routes,
        ),
      ),
    );
  }
}
