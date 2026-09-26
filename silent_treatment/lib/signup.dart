import 'package:flutter/material.dart';
import 'package:silent_treatment/login.dart';

import 'package:silent_treatment/widgets/rounded_button.dart';
import 'package:silent_treatment/widgets/rounded_text_form_field.dart';
import 'package:silent_treatment/main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topFields(),
              bottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget topFields() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          RoundedTextFormField(
            prefixIcon: Icons.abc_outlined,
            hintText: 'Username',
          ),
          RoundedTextFormField(
            prefixIcon: Icons.email_outlined,
            hintText: 'Email',
          ),
          RoundedTextFormField(
            prefixIcon: Icons.password_outlined,
            hintText: 'Password',
            obscureText: true,
          ),
          RoundedTextFormField(
            prefixIcon: Icons.password_outlined,
            hintText: 'Confirm password',
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget bottomButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: RoundedCircularButton(
          text: 'SIGN UP',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
