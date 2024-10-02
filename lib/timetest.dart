import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // เพิ่มแพ็คเกจนี้เพื่อใช้ในการจัดรูปแบบเวลา

class TimeRecorder extends StatefulWidget {
  @override
  _TimeRecorderState createState() => _TimeRecorderState();
}

class _TimeRecorderState extends State<TimeRecorder> {
  String? _recordedTime1; // ตัวแปรสำหรับเก็บเวลา
  String? _recordedTime2; // ตัวแปรสำหรับเก็บเวลา

  void _recordTime() {
    // รับเวลาปัจจุบัน
    final now = DateTime.now();

    // แปลงเป็นรูปแบบทศนิยม (ชั่วโมง.นาที)
    String formattedTime = DateFormat('HH:mm').format(now);

    // สร้างข้อความสำหรับวันที่และเวลาที่บันทึก
    _recordedTime1 = "${now.day}/${now.month}/${now.year}";
    _recordedTime2 = "เวลา ${formattedTime} นาฬิกา";
    setState(() {}); // อัพเดท UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time Recorder")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _recordTime, // เรียกใช้ฟังก์ชันเมื่อกดปุ่ม
              child: Text("บันทึกเวลา"),
            ),
            if (_recordedTime1 != null) // แสดงเวลาเมื่อมีการบันทึก
              Column(
                children: [
                  Text(
                    _recordedTime1!,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    _recordedTime2!,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: TimeRecorder()));
}
