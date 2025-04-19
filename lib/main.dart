import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simple_bloc_observer.dart';
import 'package:note_app/views/notes_view.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Bloc.observer=SimpleBlocObserver();
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..fetchAllNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff242222),
          fontFamily: 'Poppins'
        ),
        home:NotesView() ,
      ),
    );

  }
}
