import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'package:todo/Constants/api.dart';
import 'package:todo/widgets/app_bar.dart';
import 'package:todo/widgets/todo_container.dart';
import '../models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> myTodos = [];
  double done = 0;
  bool isLoading = true;

  void fetchData() async {
    try {
      final response = await http.get(Uri.parse(api));
      var data = jsonDecode(response.body);

      List<Todo> fetchedTodos = [];
      double completedCount = 0;

      data.forEach((todo) {
        Todo ton = Todo(
          id: todo['id'],
          title: todo['title'],
          desc: todo['desc'],
          isDone: todo['isDone'],
          date: todo['date'],
        );
        if (todo['isDone']) {
          completedCount += 1;
        }
        fetchedTodos.add(ton);
      });

      setState(() {
        myTodos = fetchedTodos;
        done = completedCount;
        isLoading = false;
      });

    } catch (e) {
      print('Exception: $e');
    }
  }

  void deleteTodo(int id) async {
    try {
      await http.delete(Uri.parse('$api/$id/'));
      setState(() {
        myTodos.removeWhere((todo) => todo.id == id);
        done = myTodos.where((todo) => todo.isDone).length.toDouble();
      });
    } catch (e) {
      print('Error deleting: $e');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: Column(
        children: [
          PieChart(
            dataMap: myTodos.isEmpty
                ? {"No Data": 1}
                : {"Done": done, "Incomplete": (myTodos.length - done)},
          ),
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
            child: ListView(
              children: myTodos.map((e) {
                return TodoContainer(
                  id: e.id,
                  title: e.title,
                  desc: e.desc,
                  isDone: e.isDone,
                  onPress: (id) => deleteTodo(id), // ✅ Corrected
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
