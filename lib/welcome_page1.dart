import 'package:flutter/material.dart';
import 'package:depi/explain.dart';

class Welcome_Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Image in the middle of the page
        Image.asset(
          'images/catcot.jpg', // Replace with your own image
          height: 150,
          width: 150,
        ),
        SizedBox(height: 20), // Add some space between the image and the text

        // Text Box with centered text
        Text(
          'Let’s own your list now!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, // Center the text
        ),
        SizedBox(height: 40), // Add space before the button
        ElevatedButton(
          onPressed: () {
            // Navigate to the Welcome_Page1 when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => explain()),
            );
          },
          child: Text('Lets Starts!'),
        ),
      ]),
    ));
  }
}
