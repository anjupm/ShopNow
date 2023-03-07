import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BuyNowWidget extends StatefulWidget {
  var product;
  BuyNowWidget({Key? key, required this.product}) : super(key: key);

  @override
  State<BuyNowWidget> createState() => _BuyNowWidgetState();
}

class _BuyNowWidgetState extends State<BuyNowWidget> {

  late Razorpay razorpay;

  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) async {
    // print("Payment Success");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: widget.product.color,
        content: const Text("Payment Success"),
      ),
    );
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    // print("payment error");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Payment Failed"),
      ),
    );
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    // ignore: avoid_print
    print("External Wallet");
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_tOuoihHsvURpVn',
      'amount': num.parse(widget.product.price) * 100,
      'name': 'Online Shopping App',
      'description': 'Payment',
      'prefill': {
        'contact': "Name",
        'email': "Email",
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight - 5,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            height: double.infinity,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10.0, left: 10.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                onPressed: () {  },
                child: const Icon(Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                openCheckout();
              },
              child: Container(
                height: kBottomNavigationBarHeight,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: widget.product.color,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text("Buy Now",
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
