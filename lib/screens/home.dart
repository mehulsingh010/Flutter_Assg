import 'package:flutter/material.dart';
import 'package:flutter_assg/constants/colors.dart';
import 'package:flutter_assg/model/todo.dart';
import 'package:flutter_assg/widgets/todo_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_assg/provider/todo_provider.dart';

class Home extends StatelessWidget {
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            searchBox(),
            Expanded(
              child: Consumer<TodoProvider>(
                builder: (context, todoProvider, child) {
                  return ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'All ToDos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in todoProvider.todos)
                        ToDoItem(todo: todo),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    hintText: 'Add a new todo item',
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              height: 60,
              width: 60,
              child: ElevatedButton(
                onPressed: () {
                  final text = _todoController.text;
                  if (text.isNotEmpty) {
                    Provider.of<TodoProvider>(
                      context,
                      listen: false,
                    ).addTodo(text);
                    _todoController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  backgroundColor: tdBlue,
                ),
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(201),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBGColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: tdBlack, size: 30),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
