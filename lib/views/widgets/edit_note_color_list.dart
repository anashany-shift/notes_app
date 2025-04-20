import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../models/note_model.dart';
import 'colors_item.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {

  late int currentIndex;
  @override
  void initState() {
    currentIndex=kColorsList.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 *2,
      child: ListView.builder(
        itemCount: kColorsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
                onTap:(){
                  currentIndex=index;
                  widget.note.color=kColorsList[index].value;
                  setState(() {

                  });
                },
                child: ColorItem(
                  color: kColorsList[index],
                  isActive: currentIndex == index,
                )),
          );
        },
      ),
    );
  }
}
