import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNotesView()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 0, right: 15, left: 15, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Project Concepts',
                          style: TextStyle(
                            color: Color(0xff5A6062),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Monrope',
                          ),
                        ),
                      ),
                      Text(
                        'OCT 24,2023',
                        style: TextStyle(fontFamily: 'Monrope'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Designing for intentionality: A manifesto on modern interfaces.',
                    style: TextStyle(
                      fontFamily: 'Monrope',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  maxLines: 5,
                  r"The future of design isn't just about utility. It's about how the space between elements makes the user feel. We need to embrace asymmetric whitespace...",
                  style: TextStyle(fontFamily: 'Monrope', fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
