import 'package:flutter/material.dart';

/*
class BottomSheetTextField extends StatelessWidget {
  const BottomSheetTextField({super.key, required this.hight});
  final double hight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffF1F4F5),
          hintText: 'Search Through Your Thoughts...',
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
*/
class BottomSheetTextField extends StatelessWidget {
  const BottomSheetTextField({
    super.key,
    required this.height, // ✅ تصحيح الاسم
    this.hintText = 'Write something...', // ✅ قابل للتخصيص
    this.controller,
  });

  final double height;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: height,
        child: TextField(
          controller: controller,
          maxLines: null, // ✅ يملا الـ SizedBox
          expands: true, // ✅ ضروري مع maxLines: null
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF1F4F5),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black45),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.blue.shade400,
                width: 2.0,
              ), // ✅ بيتغير لما تضغط
            ),
          ),
        ),
      ),
    );
  }
}
