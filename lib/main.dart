import 'package:chatbot1/app_theme.dart';
import 'package:flutter/material.dart';
import 'Screens/HomePage/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 28, 129, 82),
            secondary: Color.fromARGB(255, 85, 126, 173)),
        textTheme: TextTheme(titleLarge: AppTheme.titleStyle),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/Home',
      routes: {
        '/': (context) => WelcomePage(),
        '/Home': (context) => HomePage(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hamada bot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo or image goes here
            Image.asset('assets/robot.png', width: 150, height: 150),
            SizedBox(height: 20),
            Text(
              'Welcome to Your App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            // Add your authentication buttons here (Sign In, Sign Up)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60),
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              onPressed: () {
                // Handle sign-in button press
              },
              child: Text(
                'Sign In',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60),
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              onPressed: () {
                // Handle sign-up button press
              },
              child: Text('Sign Up',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ],
        ),
      ),
    );
  }
}
