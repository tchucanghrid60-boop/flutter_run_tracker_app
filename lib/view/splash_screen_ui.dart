import 'package:flutter/material.dart';
import 'package:flutter_run_tracker_app/view/show_all_run_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ShowAllRunUi()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF090359),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min, // สำคัญ!
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/RUN.png',
                    width: 180,
                    height: 180,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'RUN TRACKER',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  CircularProgressIndicator(
                    color: const Color.fromARGB(255, 59, 144, 255),
                  ),
                ],
              ),
            ),
          ),

          // footer อยู่ล่าง
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Text(
                  '© 2026 RUN TRACKER',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
                SizedBox(height: 5),
                Text(
                  'Created by Ninnin SAU TEAM',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
