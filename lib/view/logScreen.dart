import 'package:flutter/material.dart';
import 'package:mvvm/utitlities/routes/rotuteName.dart';
import 'package:mvvm/view/homeScreen.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesNames.home);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Center(child: Text('Clicked'))));
  }
}
