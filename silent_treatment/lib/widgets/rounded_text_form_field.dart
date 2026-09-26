import 'package:flutter/material.dart';

class RoundedTextFormField extends StatelessWidget {

  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const RoundedTextFormField({super.key, required this.prefixIcon, required this.hintText, this.obscureText = false, this.controller, this.onChanged, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
          ),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(99, 134, 188, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                  ),
                ),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white
                ),
                cursorColor: Colors.white, 
                onChanged: onChanged,
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    prefixIcon,
                    color: Color.fromRGBO(255, 255, 255, 0.75),
                    ),
                  suffixIcon: suffixIcon,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: 	Color.fromRGBO(253, 253, 253, 0.75),
                    ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}