import 'package:flutter/material.dart';
import 'package:silent_treatment/login.dart';
<<<<<<< HEAD
=======
import 'package:silent_treatment/widgets/rounded_button.dart';
>>>>>>> parent of 94617e1 (schedule)

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
<<<<<<< HEAD
                ),
              ],
            ),
            const Text(
              'Unfinished - Plan UI first',
              style: TextStyle(color: Colors.white),
=======
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
>>>>>>> parent of 94617e1 (schedule)
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
