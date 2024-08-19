import 'package:flutter/material.dart';
import 'package:hospital_app/sql_lite.dart';

class CureDetial extends StatefulWidget {
  final int patientID;

  const CureDetial({Key? key, required this.patientID}) : super(key: key);

  @override
  State<CureDetial> createState() => _CureDetialState();
}

class _CureDetialState extends State<CureDetial> {
  Map<String, dynamic>? patient;
  final SqllLiteManage _databaseManager = SqllLiteManage();
  TextEditingController beforecure = TextEditingController();
  TextEditingController aftercure = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPatientData();
  }

  Future<void> _loadPatientData() async {
    await _databaseManager.openOrCreateDatabase();
    List<Map<String, dynamic>> result = await _databaseManager.selectDatabase(
      "SELECT * FROM Patient WHERE ID = ${widget.patientID}",
    );

    if (result.isNotEmpty) {
      setState(() {
        patient = result.first;
        beforecure.text =
            patient!['BeforeCure'] ?? ''; // Load initial data if available
        aftercure.text =
            patient!['AfterCure'] ?? ''; // Load initial data if available
      });
    }
  }

  Future<void> _updateCurePatient() async {
    String updateQuery = "UPDATE Patient SET "
        "BeforeCure = '${beforecure.text}', "
        "AfterCure = '${aftercure.text}' "
        "WHERE ID = ${widget.patientID}";

    await _databaseManager.updateDatabase(updateQuery);
    Navigator.pop(context);
    await _loadPatientData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'ผลการรักษา',
            style: TextStyle(
                fontSize: height * 0.026, fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.06,
              right: width * 0.06,
              top: height * 0.01,
              bottom: height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: Center(
                  child: Text(
                    'ก่อนการรักษา',
                    style: TextStyle(
                        fontSize: height * 0.023, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                cursorColor: const Color(0xFF304FFE),
                controller: beforecure,
                maxLines: null, // Allows the TextField to grow dynamically
                minLines: 5, // Sets a minimum height
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'กรุณาระบุ',
                  alignLabelWithHint: true, // Aligns label to the top
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Color(0xFF304FFE)),
                  ),
                  labelStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.all(height * 0.01),
                child: Center(
                  child: Text(
                    'หลังการรักษา',
                    style: TextStyle(
                        fontSize: height * 0.023, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                cursorColor: const Color(0xFF304FFE),
                controller: aftercure,
                maxLines: null, // Allows the TextField to grow dynamically
                minLines: 5, // Sets a minimum height
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'กรุณาระบุ',
                  alignLabelWithHint: true, // Aligns label to the top
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Color(0xFF304FFE)),
                  ),
                  labelStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: height * 0.045),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await _updateCurePatient();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF82B1FF)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(150, 70)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'บันทึก',
                    style: TextStyle(
                      fontSize: height * 0.022,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
