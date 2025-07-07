import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final receivedMessage = args is String ? args : 'No data received';
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Received Data: $receivedMessage"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Sending data back from Details");
              },
              child: const Text("Back to Home screen"),
            ),
          ],
        ),
      ),
    );
  }
}
