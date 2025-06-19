import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfileCardPage(),
    );
  }
}

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProfileCard")),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('asset/profile_image.jpg'),
                ),

                Text(
                  'mehul charak',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "I am a Intern at Josh Software as a devloper .",
                  style: TextStyle(fontSize: 14),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: null,
                  child: Text("Follow"),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BackButton(color: Colors.black),
    );
  }
}
