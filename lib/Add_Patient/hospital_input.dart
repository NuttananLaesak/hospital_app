import 'package:flutter/material.dart';

class HospitalInput extends StatelessWidget {
  final TextEditingController hospitalController;

  const HospitalInput({Key? key, required this.hospitalController})
      : super(key: key);

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
              'โรงพยาบาล',
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            cursorColor: Color(0xFF304FFE),
            controller: hospitalController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'โรงพยาบาล',
              prefixIcon: Icon(Icons.local_hospital_rounded),
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
