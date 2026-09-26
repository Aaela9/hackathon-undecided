import 'package:flutter/material.dart';
import 'package:silent_treatment/login.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart' as sender;

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        scaffoldBackgroundColor: Color.fromRGBO(78, 110, 158, 1),
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
  bool is_clockedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .start,
              children: [
                BackButton(
                  color: Colors.white,
                )
              ],
            ),    
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.7,
              child: RawMaterialButton(
                onPressed: () {
                    setState(() {
                      is_clockedIn = !is_clockedIn;
                    });
                  if (is_clockedIn == true) {

                  }
                  },
    
                elevation: 2.0,
                fillColor: Colors.white,
                constraints: BoxConstraints(minWidth: 0.0),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
                child: Text(
                  is_clockedIn ? 'Clock-out' : 'Clock-in',
                  textScaleFactor: 2,
                  ),
              )
            ),
          ],
        ),

      )
    );
  }
}