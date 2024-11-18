import 'package:flutter/material.dart';
import 'package:depi/choose.dart';

class explain extends StatelessWidget {
  final List<String> features = [
    ' Have an account to save your data and profile info.',
    ' Save your daily routine and have a reminder!',
    ' Reminder of unfinished goals.',
    ' Encourage notifications to finish your jobs.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: features.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.yellow),
                  title: Text(
                    features[index],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          ),
          // Navigation button to go to the next page
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => choose()),
              );
            },
            child: Text('Got IT!'),
          ),
        ],
      ),
    );
  }
}
