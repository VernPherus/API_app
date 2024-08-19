import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Data Shite"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Employee"),
              subtitle: const Text("001"),
              trailing: const Icon(Icons.drag_handle),
              tileColor: const Color.fromARGB(255, 201, 199, 199),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
            )
          ],
        ),
      ),
    );
  }
}
