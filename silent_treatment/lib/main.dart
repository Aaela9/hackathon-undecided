import 'dart:async'; // Required for Timer
import 'package:flutter/material.dart';
import 'package:silent_treatment/login.dart';
import 'package:silent_treatment/widgets/rounded_button.dart';
import 'package:silent_treatment/data/mock_people.dart';

final List<Person> tasks = [
  Person(name: 'Aaelas', event: 'Requires attention'),
  Person(name: 'Tom', event: 'Medication'),
  Person(name: 'Alex', event: 'idk'),
];

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
  bool is_clockedIn = false;
  
  // Stopwatch and Timer variables
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  @override
  void dispose() {
    // Cancel the timer when the widget is destroyed to prevent memory leaks
    _timer?.cancel();
    super.dispose();
  }

  // Helper method to format Duration into HH:MM:SS
  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {}); // Force UI to redraw and update the stopwatch text
    });
  }

  void _pauseTimer() {
    _stopwatch.stop();
    _timer?.cancel();
    setState(() {});
  }

  void _resetTimer() {
    _stopwatch.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackButton(
                  color: Colors.white,
                )
              ],
            ),    
            // clock in button
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              child: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    is_clockedIn = !is_clockedIn;
                  });
                  if (is_clockedIn) {
                    _startTimer();
                  } else {
                    _pauseTimer();
                    _resetTimer(); // Resets timer to 00:00:00 when clocked out completely
                  }
                },
                elevation: 2.0,
                fillColor: const Color.fromRGBO(119, 147, 190, 1),
                constraints: const BoxConstraints(minWidth: 0.0),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
                child: Text(
                  is_clockedIn ? 'Clock-out' : 'Clock-in',
                  textScaleFactor: 2,
                  style: const TextStyle(
                    color: Colors.white60
                  ),
                ),
              )
            ),
            // schedule
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.5,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    final currentTask = tasks[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        minVerticalPadding: 20,
                        tileColor: Colors.white30,
                        title: Text(currentTask.name),
                        trailing: Text(currentTask.event),
                      ),
                    );
                  }
                ),
              )
            ),
            
            // Stopwatch timer in small red text
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                _formatTime(_stopwatch.elapsed),
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // break button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RoundedCircularButton(
                text: "Break", 
                onPressed: () {
                  if (is_clockedIn) {
                    setState(() {
                      is_clockedIn = false; // Set UI state to clocked out
                    });
                    _pauseTimer(); // Pauses the timer without resetting it
                  }
                }
              ),
            ),
          ],
        ),
      )
    );
  }
}
