import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
          child: buildOutlinedButton(
            icon: Icons.remove,
            press: () {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--;
                });
              }
            },
          ),
        ),
        const SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4 / 2),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: const TextStyle(fontSize: 15),
          ),
        ),
        const SizedBox(width: 5),
        Center(
          child: buildOutlinedButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            },
          ),
        ),
      ],
    );
  }

  SizedBox buildOutlinedButton({
    required IconData icon,
    required Function() press,
  }) {
    return SizedBox(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
