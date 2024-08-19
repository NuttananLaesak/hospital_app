import 'package:flutter/material.dart';

class DatetimeSelection3 extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback? onDateChanged;

  const DatetimeSelection3(
      {Key? key, required this.controller, this.onDateChanged})
      : super(key: key);

  @override
  State<DatetimeSelection3> createState() => _DatetimeSelection3State();
}

class _DatetimeSelection3State extends State<DatetimeSelection3> {
  String _formattedDateTime(DateTime dateTime, TimeOfDay time) {
    // กำหนดเดือนเป็นข้อความ
    String month = '';
    switch (dateTime.month) {
      case 1:
        month = 'มกราคม';
        break;
      case 2:
        month = 'กุมภาพันธ์';
        break;
      case 3:
        month = 'มีนาคม';
        break;
      case 4:
        month = 'เมษายน';
        break;
      case 5:
        month = 'พฤษภาคม';
        break;
      case 6:
        month = 'มิถุนายน';
        break;
      case 7:
        month = 'กรกฎาคม';
        break;
      case 8:
        month = 'สิงหาคม';
        break;
      case 9:
        month = 'กันยายน';
        break;
      case 10:
        month = 'ตุลาคม';
        break;
      case 11:
        month = 'พฤศจิกายน';
        break;
      case 12:
        month = 'ธันวาคม';
        break;
      default:
        month = '';
    }

    // กำหนดเวลาให้แสดงในรูปแบบ 24 ชั่วโมง
    String formattedHour = time.hour.toString().padLeft(2, '0');
    String formattedMinute = time.minute.toString().padLeft(2, '0');

    // สร้างรูปแบบวันที่และเวลา
    String formattedDateTime =
        'วันที่ ${dateTime.day} $month ${dateTime.year}, เวลา $formattedHour:$formattedMinute น.';

    return formattedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
          top: height * 0.01,
          bottom: height * 0.01),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'เวลาที่ใช้ยาละลายลิ่มเลือด',
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            controller: widget.controller,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  setState(() {
                    widget.controller.text =
                        _formattedDateTime(pickedDate, pickedTime);

                    // Ensure onDateChanged is called if it's not null
                    widget.onDateChanged?.call();
                  });
                }
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'เลือกวันที่และเวลา',
              hintText: 'เลือกวันที่และเวลา',
              prefixIcon: Icon(Icons.calendar_month),
              prefixIconColor: Color(0xFF304FFE),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Color(0xFF304FFE)),
              ),
              labelStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
