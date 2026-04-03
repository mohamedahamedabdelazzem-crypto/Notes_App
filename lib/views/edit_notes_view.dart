import 'package:flutter/material.dart';
import 'package:notes_app/widgets/bottom_sheet_text_field.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        title: Text('The Editorial Notes'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SizedBox(
              height: 40,
              width: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff6361EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Monrope',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          BottomSheetTextField(height: 80, hintText: 'Title'),
          BottomSheetTextField(height: 120, hintText: 'Your note...'),
        ],
      ),
    );
  }
}
