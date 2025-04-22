import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import '../edit_note_view.dart';

class CustomSlidable extends StatelessWidget {
  const CustomSlidable({super.key, required this.note, required this.child});
  final NoteModel note;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey('Test'),
      startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
        SlidableAction(
          onPressed: (context) {
            note.color = Colors.green.value;
            note.save();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);


          },
          borderRadius: BorderRadius.circular(16),
          icon: Icons.check,
          backgroundColor: Colors.green,
        )
      ]),
      endActionPane: ActionPane(
          motion: ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            note.delete();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          }),
          children: [
            SlidableAction(
              onPressed: (_) {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return EditNoteView(
                      note: note,
                    );
                  },
                ));
              },
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Colors.grey,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              onPressed: (context) {
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
              borderRadius: BorderRadius.circular(16),
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ]),
      child: child,
    );
  }
}
final snackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Success!',
    message: 'Your note has been done 🎉',
    contentType: ContentType.success,
  ),
);