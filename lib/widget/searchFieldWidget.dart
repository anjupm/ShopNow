import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFieldWidget extends StatelessWidget {
  final String? hintText;
  final Function()? onTap;
  final Function(String value)? onChanged;
  final bool readOnly;
  final bool autofocus;
  final TextEditingController? controller;

  const SearchFieldWidget(
      {Key? key,
        this.hintText,
        this.onTap,
        required this.readOnly,
        required this.autofocus,
        this.onChanged,
        this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      maxLines: 1,
      style: GoogleFonts.openSans(
        fontSize: 10,
        color: Colors.grey,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Icon(Icons.search, size: 15, color: Colors.grey),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        contentPadding: const EdgeInsets.only(left: 20, right: 20),
        enabledBorder: OutlineInputBorder(
          gapPadding: 1.0,
          borderSide: BorderSide(color: Colors.grey.shade400, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 1.0,
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}