import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'theme.dart';
import './widgets/input_field.dart';
import './widgets/button.dart';
import 'home_page.dart';
import 'widgets/todo_tile.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});
  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  // VoidCallback onSave;

  final _titlecontroller = TextEditingController();
  final _notecontroller = TextEditingController();
  Color? colorPallete = Colors.blueAccent;

  final _formKey = GlobalKey<FormState>();

  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = "9:30 PM";
  int _selectedRemind = 5;
  List<int> remainderList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weakly", "Monthly"];
  int _selectedcolor = 0;

  List saveDataList = [];

  _saveDataAtList() {
    setState(() {
      saveDataList.add([_titlecontroller.text, colorPallete]);
    });
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      //backgroundColor: context.theme.scaffoldBackgroundColor,

      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios_new,
            color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }

  _getDateFromUser() async {
    var _pickerdate = await _showDatePicker();

    if (_pickerdate != null) {
      setState(() {
        _selectedDate = _pickerdate;
      });
    } else {
      return;
    }
  }

  _showDatePicker() {
    return showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedtime = pickedTime.format(context);
    if (isStartTime == true) {
      setState(() {
        _startTime = formatedtime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formatedtime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split("")[0])),
    );
  }

  _colorPallete() {
    return Column(
      children: [
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedcolor = index;
                  _selectedcolor == 0
                      ? colorPallete = primaryclr
                      : index == 1
                          ? colorPallete = yellowclr
                          : colorPallete = pinkclr;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? primaryclr
                        : index == 1
                            ? yellowclr
                            : pinkclr,
                    child: _selectedcolor == index
                        ? Icon(Icons.done, color: whiteclr, size: 16)
                        : Container()),
              ),
            );
          }),
        ),
      ],
    );
  }

  _validatedata() {
    if (_titlecontroller.text.isNotEmpty && _notecontroller.text.isNotEmpty) {
      _saveDataAtList;
      Get.to(HomePage(
          taskname: _titlecontroller.text,
          colorname: colorPallete,
          newTaskList: [_saveDataAtList]));
      //Get.back();
    } else if (_titlecontroller.text.isEmpty || _notecontroller.text.isEmpty) {
      Get.snackbar("required", "All fields are required!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: pinkclr,
          icon: Icon(Icons.warning_amber_rounded, color: Colors.red));
    }
  }
  // _addTaskDb()async{
  //   int value = await _taskController.addTask(
  //     task:Task(
  //     title: _titlecontroller.text,
  //     note: _notecontroller.text,
  //     iscompleted: 0,
  //     date: DateFormat.yMd().format(_selectedDate),
  //     startTime: _startTime,
  //     endTime: _endTime,
  //     color: _selectedcolor,
  //     reminder: _selectedRemind,
  //     repeat: _selectedRepeat
  //   )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:primaryclr,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text('ADD TASK', style: headingStyle),
                MyInputField(
                    title: 'Title',
                    hint: 'New Task',
                    controller: _titlecontroller),
                MyInputField(
                    title: 'Desciption',
                    hint: 'Add Desciption',
                    controller: _notecontroller),
                MyInputField(
                  title: 'Date',
                  hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined,
                        size: 15, color: Colors.grey),
                    onPressed: () {
                      _getDateFromUser();
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyInputField(
                        title: 'Start Time',
                        hint: _startTime,
                        widget: IconButton(
                            icon: Icon(Icons.access_time_rounded,
                                color: Colors.grey),
                            onPressed: () {
                              _getTimeFromUser(isStartTime: true);
                            }),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: MyInputField(
                        title: 'End Time',
                        hint: _endTime,
                        widget: IconButton(
                            icon: Icon(Icons.access_time_rounded,
                                color: Colors.grey),
                            onPressed: () {
                              _getTimeFromUser(isStartTime: false);
                            }),
                      ),
                    ),
                  ],
                ),
                MyInputField(
                  title: 'Reminder',
                  hint: '$_selectedRemind minutes early',
                  widget: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    iconSize: 32,
                    elevation: 4,
                    style: hintStyle,
                    items: remainderList
                        .map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    underline: Container(height: 0),
                    onChanged: (String? newvalue) {
                      setState(() {
                        _selectedRemind = int.parse(newvalue!);
                      });
                    },
                  ),
                ),
                MyInputField(
                  title: 'Repeat',
                  hint: '$_selectedRepeat ',
                  widget: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    iconSize: 32,
                    elevation: 4,
                    style: hintStyle,
                    items: repeatList
                        .map<DropdownMenuItem<String>>((String? value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value!, style: TextStyle(color: Colors.grey)),
                      );
                    }).toList(),
                    underline: Container(height: 0),
                    onChanged: (String? newvalue) {
                      setState(() {
                        _selectedRepeat = newvalue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _colorPallete(),
                    MyButton(
                      label: 'CREATE',
                      onTap: () {
                        _validatedata();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
