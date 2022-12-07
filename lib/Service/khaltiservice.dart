import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
// import 'package:pasell/Service/KhaltiPaymentPage.dart';
import 'package:pasell/Service/khaltipayment.dart';

class KhaltiPaymentApp extends StatelessWidget {
  const KhaltiPaymentApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: "test_public_key_add4983d57a1487fb1a26e71aac6ab21",
      builder: (context, navigatorKey) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          title: 'Khalti Payment',
          home: const KhaltiPaymentPage(),
        );
      },
    );
  }
}
