// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_entri/features/cart/firebase_cart_service.dart';
import 'package:project_entri/features/orders/firebase_order_service.dart';
import 'package:project_entri/reuse_functions.dart';
import 'package:project_entri/theme/colors.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final double total;
  final List<Map<String, dynamic>> items;

  const PaymentScreen({super.key, required this.total, required this.items});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = "COD";
  bool loading = false;

  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();

    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _onSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _onError);
  }

  // COD PAYMENT
  Future<void> payNow() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    setState(() => loading = true);

    try {
      await FirebaseOrderService.placeOrder(
        userId: user.uid,
        total: widget.total,
        items: widget.items,
      );

      await FirebaseCartService.clearCart(user.uid);

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Order Placed (COD) 🎉")));

      // Stay on screen + reset state
      setState(() {
        loading = false;
        selectedMethod = "COD";
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));

      setState(() => loading = false);
    }
  }

  // OPEN RAZORPAY
  void openPayment() {
    var options = {
      'key': 'rzp_test_So7lBSdwovhcnc',
      'amount': (widget.total * 100).toInt(),
      'name': 'PerfumePalace',
      'description': 'Test Payment',
      'prefill': {'contact': '8075010277', 'email': ''},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      ReuseFunctions.logPrint().i("Error: $e");
    }
  }

  // PAYMENT SUCCESS
  void _onSuccess(PaymentSuccessResponse response) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseOrderService.placeOrder(
      userId: user.uid,
      total: widget.total,
      items: widget.items,
    );

    await FirebaseCartService.clearCart(user.uid);

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Payment Successful 🎉")));

    // Stay on same screen
    setState(() {
      loading = false;
    });
  }

  // PAYMENT FAILED
  void _onError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Payment Failed ❌")));

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: MyColours.bgColor,
        centerTitle: true,
        title: const Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// TOTAL
            Text(
              "Total: ₹${widget.total.toStringAsFixed(0)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            /// PAYMENT OPTIONS
            RadioListTile(
              value: "COD",
              groupValue: selectedMethod,
              title: const Text("Cash on Delivery"),
              onChanged: (v) => setState(() => selectedMethod = v!),
            ),

            RadioListTile(
              value: "UPI",
              groupValue: selectedMethod,
              title: const Text("UPI / Online Payment"),
              onChanged: (v) => setState(() => selectedMethod = v!),
            ),

            RadioListTile(
              value: "Card",
              groupValue: selectedMethod,
              title: const Text("Credit/Debit Card"),
              onChanged: (v) => setState(() => selectedMethod = v!),
            ),
            const Spacer(),

            /// BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColours.bgColor,
                ),
                onPressed: loading
                    ? null
                    : () {
                        if (selectedMethod == "COD") {
                          payNow();
                        } else {
                          openPayment();
                        }
                      },
                child: loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Pay Now",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
