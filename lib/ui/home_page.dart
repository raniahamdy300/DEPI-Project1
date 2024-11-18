import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/theme_services.dart';
import './theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'add_task_page.dart';
import './widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  final String? taskname;
  Color? colorname;
  List? newTaskList;

  HomePage({super.key, this.taskname, this.colorname, this.newTaskList});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selecteddate = DateTime.now();

  List ToDoList = [
    ['Reading', false],
    ['Do tutorial', false],
    ['Drink', false],
  ];

  void deleteTask(int index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
        },
        child: Get.isDarkMode
            ? (Icon(Icons.nightlight_round, size: 20))
            : (Icon(Icons.sunny, size: 20)),
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                    style: subHeadingStyle),
                Text('Today', style: headingStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 70,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryclr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          _selecteddate = date;
        },
      ),
    );
  }

  _checkBoxChanged(bool? value, int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          SizedBox(height: 10),
          _addDateBar(),
          Expanded(
            child: ListView.builder(
              itemCount: ToDoList.length,
              itemBuilder: (BuildContext context, index) {
                return ToDoTile(
                  taskName: ToDoList[index][0],
                  taskCompleted: ToDoList[index][1],
                  onChanged: (value) => _checkBoxChanged(value, index),
                  deleteTask: (context) => deleteTask(index),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Get.to(AddTaskPage());
                },
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
