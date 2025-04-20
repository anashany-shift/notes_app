import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/models/note_model.dart';

import '../../cubits/add_note_cubit/add_note_cubit.dart';
import 'colors_list_view.dart';
import 'csutom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          onSaved: (value) {
            title = value;
          },
          hint: 'title',
        ),
        SizedBox(
          height: 16,
        ),
        CustomTextField(
          onSaved: (value) {
            subTitle = value;
          },
          hint: 'content',
          maxLines: 5,
        ),
        SizedBox(
          height: 32,
        ),
        ColorsListView(),

        SizedBox(
          height: 32,
        ),
        BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formatedDate = DateFormat.yMd().format(currentDate);
                  var noteModel = NoteModel(
                      title: title!,
                      subtitle: subTitle!,
                      date: formatedDate,
                      color: Colors.blue.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          },
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }}

