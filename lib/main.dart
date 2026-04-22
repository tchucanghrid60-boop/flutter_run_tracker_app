import 'package:flutter/material.dart';
import 'package:flutter_run_tracker_app/view/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://fcpsbvvmsimmqhsqyjgb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZjcHNidnZtc2ltbXFoc3F5amdiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY1MjQwMzIsImV4cCI6MjA5MjEwMDAzMn0.5jSiQ-RlVKsfNePI59Narb9c04HbrDLcsAC0niNLr2w',
  );

  runApp(FlutterRunTrackerApp());
}

class FlutterRunTrackerApp extends StatefulWidget {
  const FlutterRunTrackerApp({super.key});

  @override
  State<FlutterRunTrackerApp> createState() => _FlutterRunTrackerAppState();
}

class _FlutterRunTrackerAppState extends State<FlutterRunTrackerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
    );
  }
}
