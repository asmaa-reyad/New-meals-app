import 'package:flutter/material.dart';

class CustomMealItem extends StatefulWidget {
  const CustomMealItem({
    super.key,
    required this.meal,
  });
  final String meal;

  @override
  State<CustomMealItem> createState() => _CustomMealItemState();
}

class _CustomMealItemState extends State<CustomMealItem> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          tapped = !tapped;
        });
      },
      child: Container(
        height: 40,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: !tapped ? const Color(0xff7F59D0) : Colors.grey,
        ),
        child: Center(
            child: Text(
          widget.meal,
          style: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
