import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConnectionPage extends StatefulWidget {
  @override
  _ConnectionPageState createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.90),
        title: Text(
          "No internet",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Lottie.asset(
                  'assets/images/network-error.json',
                  width: 300.0,
                  height: 300.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Text(
                  "ℹ Oops, Looks like you are not connected to the internet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
