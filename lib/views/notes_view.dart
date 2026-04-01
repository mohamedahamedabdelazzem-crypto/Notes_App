import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff6C63FF)),
        title: Text("The Editorial Notes"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                'assets/images/Gemini_Generated_Image_r43j7yr43j7yr43j.png',
              ),
            ),
          ),
        ],
      ),
      body: NotesViewBody(),
    );
  }
}
