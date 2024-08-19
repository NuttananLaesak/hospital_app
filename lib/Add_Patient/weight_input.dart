import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightInput extends StatefulWidget {
  final TextEditingController controller;

  const WeightInput({Key? key, required this.controller}) : super(key: key);

  @override
  State<WeightInput> createState() => _WeightInputState();
}

class _WeightInputState extends State<WeightInput> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.04,
        right: width * 0.04,
        top: height * 0.01,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(height * 0.01),
            child: Text(
              'น้ำหนัก',
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            cursorColor: Color(0xFF304FFE),
            controller: widget.controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'น้ำหนัก (กิโลกรัม)',
              prefixIcon: const Icon(Icons.fitness_center),
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
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(10),
            ],
          ),
        ],
      ),
    );
  }
}
