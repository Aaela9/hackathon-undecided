import 'package:flutter/material.dart';
import 'package:silent_treatment/login.dart';
import 'package:silent_treatment/widgets/rounded_button.dart';

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
            // clock in button
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.7,
              child: RawMaterialButton(
                onPressed: () {
                    setState(() {
                      is_clockedIn = !is_clockedIn;
                    });
                  if (is_clockedIn == true) {
                    // timer start
                  }
                  },
                elevation: 2.0,
                fillColor: Color.fromRGBO(119, 147, 190, 1),
                constraints: BoxConstraints(minWidth: 0.0),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
                child: Text(
                  is_clockedIn ? 'Clock-out' : 'Clock-in',
                  textScaleFactor: 2,
                  style: TextStyle(
                    color: Colors.white60
                  ),
                  ),
              )
            ),
            // schedule
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    children: [
                      Text('task 1',
                      style: TextStyle(
                        color: Colors.white60
                      ),),
                      Text('task 2'),
                      Text('task 3'),
                    ],
                  ),
                ),
              ),
            ),
            
            // break button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RoundedCircularButton(text: "Break", onPressed: () {
                // pause timer
              }
              ),
            ),
          ],
        ),

      )
    );
  }
}