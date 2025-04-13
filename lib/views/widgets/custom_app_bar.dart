import 'package:flutter/material.dart';

import 'custom_Search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Notes',style: TextStyle(
          color: Colors.white,fontSize: 28
        ),),
        Spacer(),
        CustomSearchIcon(),
      ],
    );
  }
}

