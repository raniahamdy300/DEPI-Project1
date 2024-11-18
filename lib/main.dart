import 'package:flutter/material.dart';
import 'package:depi/welcome_page1.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: FirstPage(), // Start at the first page
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add a logo or an image in the middle of the page
            Image.asset(
              'images/logo.jpg', // Replace with the path to your image
              height: 150,
              width: 150,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Welcome_Page1 when button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome_Page1()),
                );
              },
              child: Text('Hello'),
            ),
          ],
        ),
      ),
    );
  }
}
