import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/practice_api/views/home_screen.dart';
import 'package:todo_app/todo_list/views/add_page.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/todo_list/views/edit_page.dart';

import '../services/todo_api.dart';
import '../utils/snackbar_helper.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Center(
                child: Text("Todo List", style: TextStyle(color: Colors.white)),
              ),
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder:(context) =>HomeScreen(), ),
                );
              },
                child: Text('Go to next project',
                  style: TextStyle(color: Colors.purple,fontSize: 17),
                ),
            ),
          ],
        ),

      ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              final id = item['_id'] as String;
              return ListTile(
                leading: Text('${index + 1}'),
                title: Text(item['title']),
                subtitle: Text(item['description']),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'edit') {
                      /// open edit page....
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => EditPage(
                                todo: items[index],
                                title: item['title'],
                                description: item['description'],
                              ),
                        ),
                      );
                    } else if (value == 'delete') {
                      /// delete and remove the item....
                      deleteById(id);
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(child: Text('Edit'), value: 'edit'),
                      PopupMenuItem(child: Text('delete'), value: 'delete'),
                    ];
                  },
                ),
              );
            },
          ),
        ),
      ),

      /// on clicking floating action button(Add Todo button) open new screen...
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
        label: Text('Add Todo', style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Future<void> deleteById(String id) async {
    /// delete the item
    final isSuccess = await TodoServices.deleteById(id);
    if (isSuccess) {
      /// remove item from the list
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      /// show error....
      showErrorMessage(context,message: 'deletion Completed');
    }
  }

  /// get all the data which is saved on server.....
  Future<void> fetchTodo() async {
    isLoading = true;
    final response = await TodoServices.fetchTodos();

    if (response != null) {
      setState(() {
        items = response;
        isLoading = true;
      });
    } else {
      /// show error....
      showErrorMessage(context,message: 'Something went wrong');
    }
    setState(() {
      isLoading = false;
    });
  }


}
