import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SugarInput extends StatefulWidget {
  final TextEditingController controller;

  const SugarInput({Key? key, required this.controller}) : super(key: key);

  @override
  State<SugarInput> createState() => _SugarInputState();
}

class _SugarInputState extends State<SugarInput> {
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
            padding: EdgeInsets.all(height * 0.01),
            child: Text(
              'ระดับน้ำตาลในเลือด',
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            cursorColor: Colors.blue,
            controller: widget.controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'ระดับน้ำตาลในเลือด (mg/dl)',
              prefixIcon: const Icon(Icons.healing),
              prefixIconColor: const Color(0xFF304FFE),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: Color(0xFF304FFE)),
              ),
              labelStyle: const TextStyle(color: Colors.grey),
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
