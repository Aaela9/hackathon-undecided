import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// widgets
import 'package:silent_treatment/widgets/rounded_button.dart';
import 'package:silent_treatment/widgets/rounded_text_form_field.dart';

// pages
import 'package:silent_treatment/main.dart';
import 'package:silent_treatment/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
final storage = FlutterSecureStorage();
bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    return Scaffold(
      body: Center(
        child: Padding( 
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: .spaceBetween,
            children: [
              topButtons(),
              bottomButtons(),
            ]
          ),
        ),
      ),
    );
  }

  Widget topButtons() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        children: [
          // email field
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, top: 12.0),
            child: RoundedTextFormField(
              obscureText: false,
              prefixIcon: Icons.email_outlined,
              suffixIcon: null,
              hintText: "Email Address",
              ),
            ),
                // password field
            RoundedTextFormField(
                obscureText: true,
                prefixIcon: Icons.password_outlined,
                suffixIcon: null,
                hintText: "Password",
              ),
            CheckboxListTile(
              value: rememberMe, 
              onChanged: (bool? value) { // bool tri-state, value can be true, false, or null
                setState(() {
                  rememberMe = value ?? false; // if null, use false
                }
                );
            
            },
            title: const Text(
              'Remember me',
              style: TextStyle(
              color: Colors.white,
            
                    fontSize: 13.0,))
          ),
        ]
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
      )
    );
  }
  Widget bottomButtons() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: RoundedCircularButton(
              text: 'LOGIN', 
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(
                    title: 'Silent Treatment',
                    )
                  ),
                );
              },
            ),
          ), 
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: .end,
              children: [
                Text("Don't have an account?",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    fontSize: 11.0,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const SignupPage()
                        )
                      );
                    },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero
                  ),
                  child:
                  Text("Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]
    );
  }
}