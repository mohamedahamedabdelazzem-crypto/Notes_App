import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body.dart';
import 'package:notes_app/widgets/bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F9FA),
      drawer: Drawer(backgroundColor: Color(0xFFFFFFFF)),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF8F9FA),
        centerTitle: false,
        iconTheme: IconThemeData(color: Color(0xff6C63FF)),
        title: Text(
          "The Editorial Notes",
          style: TextStyle(fontFamily: 'Monrope', fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                'assets/images/Gemini_Generated_Image_r43j7yr43j7yr43j.png',
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff5755DF),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            builder: (context) {
              return CustomBottomSheet();
            },
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Icon(Icons.add_box_outlined, size: 25, color: Color(0xFFFFFFFF)),
      ),
      body: NotesViewBody(),
    );
  }
}
