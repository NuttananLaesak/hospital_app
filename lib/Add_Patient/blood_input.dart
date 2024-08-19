import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BloodInput extends StatefulWidget {
  final TextEditingController systolicController;
  final TextEditingController diastolicController;

  const BloodInput({
    Key? key,
    required this.systolicController,
    required this.diastolicController,
  }) : super(key: key);

  @override
  _BloodInputState createState() => _BloodInputState();
}

class _BloodInputState extends State<BloodInput> {
  @override
  void initState() {
    super.initState();
    widget.systolicController.addListener(_checkBloodPressure);
    widget.diastolicController.addListener(_checkBloodPressure);
  }

  @override
  void dispose() {
    widget.systolicController.removeListener(_checkBloodPressure);
    widget.diastolicController.removeListener(_checkBloodPressure);
    super.dispose();
  }

  void _checkBloodPressure() {
    int? systolic = int.tryParse(widget.systolicController.text);
    int? diastolic = int.tryParse(widget.diastolicController.text);

    if ((systolic != null && systolic > 184) ||
        (diastolic != null && diastolic > 110)) {
      _showHighBloodPressureDialog(systolic, diastolic);
    }
  }

  void _showHighBloodPressureDialog(int? systolic, int? diastolic) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ความดันโลหิตสูงเกินไป'),
          content: Text(
              'ควรให้ยาลดความดันโลหิตทางหลอดเลือดดำก่อน\nเช่น ยา nicardipine หรือ labetalol เป็นต้น'),
          actions: [
            TextButton(
              child: Text('ตกลง', style: TextStyle(color: Colors.black)),
              onPressed: () {
                if (systolic != null && systolic > 184) {
                  widget.systolicController.clear();
                }
                if (diastolic != null && diastolic > 110) {
                  widget.diastolicController.clear();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(height * 0.005),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: Text(
                  'ความดันโลหิต',
                  style: TextStyle(
                      fontSize: height * 0.023, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.blue,
                      controller: widget.systolicController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: '(mmHG)',
                        prefixIcon: const Icon(Icons.show_chart),
                        prefixIconColor: const Color(0xFF304FFE),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF304FFE)),
                        ),
                        labelStyle: const TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.04, right: width * 0.04),
                    child: Text(
                      '/',
                      style: TextStyle(
                          fontSize: height * 0.044,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.blue,
                      controller: widget.diastolicController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: '(mmHG)',
                        prefixIcon: const Icon(Icons.show_chart),
                        prefixIconColor: const Color(0xFF304FFE),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF304FFE)),
                        ),
                        labelStyle: const TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
