import 'package:flutter/material.dart';

import 'colors_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key, required this.isActive});
  final bool isActive;
 

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  List<Color>colors=[
    Color(0xff606c38),
    Color(0xff283618),
    Color(0xfffefae0),
    Color(0xffdda15e),
    Color(0xffbc6c25),
    Color(0xff264653),
    Color(0xff2a9d8f),
    Color(0xffe9c46a),
    Color(0xfff4a261),
    Color(0xffe76f51),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 *2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap:(){
                currentIndex=index;
                setState(() {

                });
              },
                child: ColorItem(
                  color: colors[index],
              isActive: currentIndex == index,
            )),
          );
        },
      ),
    );
  }
}
