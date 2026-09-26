import 'package:flutter/material.dart';
import 'package:silent_treatment/login.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(78, 110, 158, 1),
      ),
      home: const LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                BackButton(
                  color: Colors.white,
                ),
              ],
            ),
            const Text(
              'Unfinished - Plan UI first',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Features I want:
// groups -- configure identity and demands
// "trade" -- find a compromise for the proposed issue
// elaboration on "trade":
// person A submits complaint
// person B will have this complaint in a bubble until addressed
// person B can interact with this bubble
// shut down the bubble or they can address this bubble by either accepting or compromising
// by compromising, the bubble is sent back to person A
// person A can then address them the same way until resolved

// Also should have a "spit" feature, where it's just complaints but no desired solution
// battery level
// shared calendar with import/export
// notifications
// settings
// user profile
