import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hint,
      this.onChanged,
      this.passcode = false,
      this.inputype,
      required this.onSubmitted});

  String? hint;
  bool? passcode;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  final TextInputType? inputype;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
          onSubmitted: onSubmitted,
          keyboardType: inputype,
          obscureText: passcode!,
          onChanged: onChanged,
          decoration: InputDecoration(
              hintText: hint,
              suffixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black)),
              contentPadding: EdgeInsets.symmetric(vertical: 30.0))),
    );
  }
}
