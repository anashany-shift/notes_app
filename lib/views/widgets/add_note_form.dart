import 'package:flutter/material.dart';

import 'csutom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}


class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState>formKey=GlobalKey();
  AutovalidateMode autoValidateMode=AutovalidateMode.disabled;
  String? title,content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,

      child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              onSaved: (value) {
                title=value;
              },
              hint: 'title',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              onSaved: (value) {
                content=value;
              },
              hint: 'content',
              maxLines: 5,
            ),
            SizedBox(
              height: 32,
            ),
            CustomButton(
              onTap: () {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                }else{
                  autoValidateMode=AutovalidateMode.always;
                  setState(() {

                  });
                }

              },
            ),
            SizedBox(
              height: 20,
            ),
          ]),
    );
  }
}
