import 'package:flutter/material.dart';
import 'package:my_app/screens/dashboard_screen.dart';
  import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Simulate a time-consuming task (e.g., loading data) for the splash screen.
    // Replace this with your actual data loading logic.
    Future.delayed(
      Duration(seconds: 3),
          () {
        Get.to(DashboardScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/footballogo.jpg',
              width: 100.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),

          ],
        ),
      ),
    );
  }
}
