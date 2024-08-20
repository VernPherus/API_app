import "package:api_app/widgets/employee_list.dart";
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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: EmpList()
      ),
    );
  }
}
