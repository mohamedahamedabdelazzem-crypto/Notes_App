import 'package:flutter/material.dart';
import 'package:notes_app/widgets/bottom_sheet_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetTextField(height: 80, hintText: 'Title'),
          BottomSheetTextField(height: 120, hintText: 'Your note...'),
        ],
      ),
    );
  }
}
