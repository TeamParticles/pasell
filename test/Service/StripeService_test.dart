
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasell/Service/StripeService.dart';

import 'StripeService_test.mocks.dart';

@GenerateMocks([StripeService])


void main() {

  StripeService stripeservice;

  double amount;

  var paymentIntent = { amount: "",  "currency": "", };
  
  var paymentIntentData;

  setUpAll(() {
    stripeservice = MockStripeService();

    paymentIntent = {
      amount: "1000", 
      "currency":"USD",

    };

    paymentIntentData = paymentIntent;

  });

  test('making payment has been successfully passed ', () async {

    when(stripeservice.makePayment(amount))
       .thenAnswer(
      (_) async => bool.fromEnvironment(
        paymentIntentData,
      ),     
    );

    // verify(stripeservice.makePayment(amount));
    // expect(response.msj, "Registered Successfully");
    // expect(response.resp, true);

  });

  
  test('displaying payment has been successfully passed ', () async {

    when(stripeservice.displayPaymentSheet())
       .thenAnswer(
      (_) async => bool.fromEnvironment(
        paymentIntentData,
      ),     
    );

  });

  tearDownAll(() {
    stripeservice = null;

  });
}





