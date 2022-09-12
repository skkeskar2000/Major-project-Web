import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ReusedButtonWidget extends StatelessWidget {
  const ReusedButtonWidget({
    Key? key, required this.onTap, required this.text,
  }) : super(key: key);

  final String text;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: kPrimaryTextColour,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}