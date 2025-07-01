import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_assg/model/user.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Call Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // variable to call and store future list of users
  Future<List<User>> usersFuture = getUsers();

  static Future<List<User>> getUsers() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    final List body = json.decode(response.body);
    return body.map((user) => User.fromJson(user)).toList();
  }

  //build function to call the future list of userss
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          height: 1.5,
        ),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: usersFuture, // call the future function
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // until data is fetched, show loader
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              // once data is fetched, display it on screen (call buildUsers())
              final users = snapshot.data!;
              return buildUsers(users);
            } else {
              // if no data, show simple Text
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  // function to display fetched data on screen
  //
  //
  Widget buildUsers(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left icon
              Icon(Icons.person, size: 48, color: Colors.blueAccent),
              SizedBox(width: 12),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildLabelValue('Name', user.name),
                    buildLabelValue('Username', user.username),
                    buildLabelValue('Email', user.email),
                    buildLabelValue('Phone', user.phone),
                    buildLabelValue('Website', user.website),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Helper widget to show "Label: value" nicely
  Widget buildLabelValue(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(
              text: '$label: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value ?? 'N/A'),
          ],
        ),
      ),
    );
  }
}
