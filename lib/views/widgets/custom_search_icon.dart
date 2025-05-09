import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.iconData, this.onPressed});
  final IconData iconData;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16)),
        child: IconButton(
          onPressed: onPressed,
         icon: Icon(iconData,  color: Colors.white,
           size: 28,),

        ));
  }
}
