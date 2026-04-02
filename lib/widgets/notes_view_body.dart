import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            right: 15,
            left: 15,
            bottom: 10,
          ),
          child: Text(
            "My Notes",
            style: TextStyle(
              fontFamily: 'Monrope',
              fontWeight: FontWeight.w900,
              fontSize: 36,
            ),
          ),
        ),
        CustomTextField(),
        NoteItem(),
      ],
    );
  }
}
