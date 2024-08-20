// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_app/models/employee.dart';

class EmpList extends StatefulWidget {
  const EmpList({super.key});

  @override
  State<EmpList> createState() => _EmpListState();
}

class _EmpListState extends State<EmpList> {
  Future<List<Employee>> employeesFuture = fetchEmployeeData();

  static Future<List<Employee>> fetchEmployeeData() async {
    final response = await http
        .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));

    if (response.statusCode == 200) {
      List<dynamic> employeesJson = json.decode(response.body)['data'];
      return employeesJson.map((json) => Employee.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load employee data');
    }
  }

  Widget buildEmployees(List<Employee> employees) => ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(employee.employeeName),
              subtitle: Text(employee.id.toString()),
              trailing: const Icon(Icons.drag_handle_rounded),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Employee>>(
        future: employeesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            final employees = snapshot.data!;
            return buildEmployees(employees);
          } else {
            return const Text("No user data");
          }
        });
  }
}
