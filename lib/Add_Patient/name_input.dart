import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  final TextEditingController nameController;

  const NameInput({Key? key, required this.nameController}) : super(key: key);

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
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'ชื่อผู้ป่วย',
                    style: TextStyle(
                      fontSize: height * 0.023,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontSize: height * 0.023,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextField(
            cursorColor: Color(0xFF304FFE),
            controller: nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'ชื่อผู้ป่วย',
              prefixIcon: const Icon(Icons.person),
              prefixIconColor: Color(0xFF304FFE),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Color(0xFF304FFE)),
              ),
              labelStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
