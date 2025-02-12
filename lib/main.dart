import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_thrift/screens/authentication/login_screen.dart';
import 'package:phone_thrift/screens/authentication/otp_screen.dart';
import 'package:phone_thrift/screens/homescreen/home_screen.dart';
import 'screens/splash_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thrift Phone',
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpScreen(verificationId: '', phoneNumber: '',),
      },
    );
  }
}


