import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.90),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Lottie.asset(
                    'assets/images/404.json',
                    height: 300.0,
                    width: 300.0,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "ℹ Looks like entered user is not available on github...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
