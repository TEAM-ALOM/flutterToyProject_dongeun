import 'package:flutter/material.dart';
import 'package:newtoyproject/screen/homescreen.dart';


class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _AppState();
}

class _AppState extends State<todoList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.amberAccent,
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      title: Text(
                        "취소",
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> homeScreen()));
                      },
                    ),
                    Text(
                      "오늘의 할일이 무엇인가요?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "완료",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
