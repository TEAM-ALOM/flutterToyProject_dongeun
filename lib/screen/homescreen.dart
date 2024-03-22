import 'package:flutter/material.dart';
import 'package:newtoyproject/screen/todolist.dart';

class homeScreen extends StatefulWidget {

  @override
  State<homeScreen> createState() => _AppState();
}

class _AppState extends State<homeScreen> {
  List<String> _todoList = []; // 할 일 리스트
  bool _showTodoList = false; // 할 일 목록을 보여줄 지 여부
  bool _showWeeklyTodoList = false; // 일주일 간 해야할 일 목록을 보여줄지 여부
  bool _showMonthlyTodoList = false; // 이번 달의 할 일 목록을 보여줄지 여부
  bool _showCurrentTodoList = false; // 지금 할 일 목록을 보여줄지 여부

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFFFFDEAD),
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Text(
                        ' ToDoList',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Builder(
                          builder: (context) {
                            return Container(
                                child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=> todoList()
                                      ),
                                    );
                                  },
                                )
                            );
                          }
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '오늘의 할 일',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        icon: _showTodoList ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          setState(() {
                            _showTodoList = !_showTodoList;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '일주일 간 해야할 일',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        icon: _showWeeklyTodoList ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          setState(() {
                            _showWeeklyTodoList = !_showWeeklyTodoList;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '이번 달의 할 일',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        icon: _showMonthlyTodoList ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          setState(() {
                            _showMonthlyTodoList = !_showMonthlyTodoList;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '지금 할 일',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        icon: _showCurrentTodoList ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          setState(() {
                            _showCurrentTodoList = !_showCurrentTodoList;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
        )
    );
  }
}