import 'package:depi/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:depi/signup.dart';

class choose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20), // Spacer
            TextButton(
              onPressed: () {
                // Navigate to the SignUpPage when the sign-up text is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Lets Fix IT !'),
            ),
          ],
        ),
      ),
    );
  }
}
