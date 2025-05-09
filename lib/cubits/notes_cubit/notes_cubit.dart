import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

import '../../constant.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;

  fetchAllNotes(){
      var notesBox = Hive.box<NoteModel>(kNotesBox);
     notes= notesBox.values.toList().reversed.toList();
      emit(NotesSuccess(notes!));

    }
  }


