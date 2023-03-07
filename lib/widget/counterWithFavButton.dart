import 'package:flutter/material.dart';
import 'package:online_shop_app/widget/cartCounter.dart';

class CounterWithFavButton extends StatelessWidget {
  const CounterWithFavButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CartCounter(),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.red.shade900,
              shape: BoxShape.circle),
          child: const Icon(Icons.favorite, color: Colors.white, size: 15),
        ),
      ],
    );
  }
}
