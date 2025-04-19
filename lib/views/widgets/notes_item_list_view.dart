import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'custom_note_item.dart';

class NotesItemListView extends StatelessWidget {
  const NotesItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            List<NoteModel>notes=BlocProvider.of<NotesCubit>(context).notes ?? [];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount:notes.length ,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: NoteItem(),
                  );
                },
              ),
            );
          },
        ));
  }
}
