import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _todoListState();
}

class _todoListState extends State<todoList> {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  @override
  void initState() {
    super.initState();
    _startTime = TimeOfDay(hour: 0, minute: 0);
    _endTime = TimeOfDay(hour: 23, minute: 59);
  }

  void _validate(BuildContext context){         //경고창
    final text = _textEditingController.text.trim();
    if(text.isEmpty){
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "잠깐!!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              content: Text(
                "할 일을 작성해주세요!",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "작성하기",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            );
          }
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFFDEAD),
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,  //뒤로가기 버튼 없앰
        title : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text(
                  "취소",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
            ),
            Text(
              "오늘의 할일이 무엇인가요?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            GestureDetector(
                onTap: (){
                  _saveAndGoBack();
                },
                child: Text(
                  "완료",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFFFDEAD),
      body: SingleChildScrollView(
        child : Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "할 일",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.8,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 5.0,
                      )
                  ),
                ),
                onSubmitted: (value){    //return 버튼 누르면
                  _validate(context);    //입력 값이 없으면 경고창
                },
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "날짜",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 0.8,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    _selectedDate != null
                        ? DateFormat('yyyy년 MM월 dd일').format(_selectedDate!)
                        : DateFormat('yyyy년 MM월 dd일').format(DateTime.now()),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null && pickedDate != _selectedDate) {
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '날짜 선택',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  "시간",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 85,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("시작시간"),
                    Text("종료시간"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _selectTime(true);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${_startTime != null ? _formatTime(_startTime!) : "00:00"}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _selectTime(false);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${_endTime != null ? _formatTime(_endTime!) : "23:59"}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "메모",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 25,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _selectTime(bool isStartTime) async {
    final initialTime = isStartTime ? _startTime : _endTime;
    final selectedTime = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime dateTime) {
              final selectedTime = TimeOfDay.fromDateTime(dateTime);
              setState(() {
                if (isStartTime) {
                  _startTime = selectedTime;
                } else {
                  _endTime = selectedTime;
                }
              });
            },
          ),
        );
      },
    );

    if (selectedTime != null) {
      setState(() {
        if (isStartTime) {
          _startTime = selectedTime;
        } else {
          _endTime = selectedTime;
        }
      });
    }
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat.jm().format(dateTime);
  }

  void _saveAndGoBack() {
    //데이터 저장해야 함
    Navigator.pop(context);
  }
}