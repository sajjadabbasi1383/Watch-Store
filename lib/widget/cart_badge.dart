import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, this.count = 0});

  final count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 33,
          width: 33,
        ),
        SvgPicture.asset(
          Assets.svg.cart.path,
          color: Colors.black,
          height: 28,
        ),
        Visibility(
            visible: count > 0 ? true : false,
            child: Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ))),
      ],
    );
  }
}
