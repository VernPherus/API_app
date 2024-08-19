import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_app/models/employee.dart';

class EmpList extends StatelessWidget {
  const EmpList({super.key});

  Future<void> fetchEmployeeData() async {
    final response = await http
        .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));

    if (response.statusCode == 200) {
      List<dynamic> employeesJson = json.decode(response.body)['data'];
      List<Employee> employees =
          employeesJson.map((json) => Employee.fromJson(json)).toList();

      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: <Widget>[
        ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Employee"),
            subtitle: const Text("001"),
            trailing: const Icon(Icons.drag_handle),
            tileColor: const Color.fromARGB(255, 201, 199, 199),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
      ]),
    );
  }
}
