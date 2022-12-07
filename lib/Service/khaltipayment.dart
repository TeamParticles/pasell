import 'package:flutter/material.dart';
// import 'package:wallet/amount_list.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiPaymentPage extends StatefulWidget {
  const KhaltiPaymentPage({Key key, double amount}) : super(key: key);
  @override
  KhaltiPaymentPageState createState() => KhaltiPaymentPageState();
}

class KhaltiPaymentPageState extends State<KhaltiPaymentPage> {
  TextEditingController amountController = TextEditingController();
  getAmt() {
    return int.parse(amountController.text) * 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Pasell Khalti Payment"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            // For Amount
            TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Enter Amount to Pay",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ))),
            const SizedBox(height: 8),
            // For Button
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.red)),
                height: 50,
                color: const Color(0xff5D2E8E),
                child: const Text(
                  "Pay with Khalti",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onPressed: () {
                  KhaltiScope.of(context).pay(
                    config: PaymentConfig(
                      amount: getAmt(),
                      productIdentity: 'dells-sssssg5-g5510-2022',
                      productName: 'Dell G5 2022',
                    ),
                    preferences: [
                      PaymentPreference.khalti,
                      PaymentPreference.connectIPS,
                      PaymentPreference.eBanking,
                    ],
                    onSuccess: (su) {
                      const successsnackBar = SnackBar(
                        content: Text("Payment Successful"),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(successsnackBar);
                    },
                    onFailure: (fa) {
                      const failedsnackBar = SnackBar(
                        content: Text("Payment Failed"),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(failedsnackBar);
                    },
                    onCancel: () {
                      const cancelsnackBar = SnackBar(
                        content: Text("Payment Cancelled"),
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(cancelsnackBar);
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
