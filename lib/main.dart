import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project 1',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
//Private fields for further assignment
  late String _firstName;
  late String _lastName;

  bool _isButtonEnabled = false;

  _MyPageState({String firstName = '', String lastName = ''}) {
    _firstName = firstName;
    _lastName = lastName;
  }

// Get names
  String get firstName => _firstName;
  String get lastName => _lastName;

// Set names
  set firstName(String val) => _firstName = val;
  set lastName(String val) => _lastName = val;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Hi!', style: TextStyle(fontSize: 22),)), backgroundColor: Colors.lightBlue[50],),
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Please input your First and Last name: ',
              style: TextStyle( fontSize: 20),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _firstName = value;
                      _isButtonEnabled = _firstName.isNotEmpty && _lastName.isNotEmpty;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'First name: ',
                    hoverColor: Colors.blue
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _lastName = value;
                      _isButtonEnabled = _firstName.isNotEmpty && _lastName.isNotEmpty;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Last name: ',
                    hoverColor: Colors.blue
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Check if user pressed the button
              if (_isButtonEnabled)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _firstName = '';
                      _lastName = '';
                      _isButtonEnabled = false;
                    });
                    // Update the page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => MyPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Reset'),
              ),
              const SizedBox(height: 30),
              Text(
                'Hi, $_firstName $_lastName!',
                style: const TextStyle(
                    fontSize: 22,
                    color:  Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      )
    );
  }
}
