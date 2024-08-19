import 'package:flutter/material.dart';
import 'package:hospital_app/Patient_Detail/warning_detail.dart';
import 'package:hospital_app/sql_lite.dart';

class MadicDetail extends StatefulWidget {
  final int patientID;

  const MadicDetail({Key? key, required this.patientID}) : super(key: key);

  @override
  State<MadicDetail> createState() => _MadicDetailState();
}

class _MadicDetailState extends State<MadicDetail> {
  Map<String, dynamic>? patient;
  final SqllLiteManage _databaseManager = SqllLiteManage();
  double medic1 = 0.0;
  double medic2 = 0.0;
  double medic3 = 0.0;
  bool showMedicationError = false;

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
      });
      _checkcalculateWeight();
    }
  }

  void _checkcalculateWeight() {
    if (patient?['Indications1'] == 1 &&
        patient?['Indications2'] == 1 &&
        patient?['Indications3'] == 1 &&
        patient?['StrictlyProhibited1'] == 1 &&
        patient?['StrictlyProhibited2'] == 1 &&
        patient?['StrictlyProhibited3'] == 1 &&
        patient?['StrictlyProhibited4'] == 1 &&
        patient?['StrictlyProhibited5'] == 1 &&
        patient?['StrictlyProhibited6'] == 1 &&
        patient?['StrictlyProhibited7'] == 1 &&
        patient?['StrictlyProhibited8'] == 1 &&
        patient?['StrictlyProhibited9'] == 1 &&
        patient?['StrictlyProhibited10'] == 1 &&
        patient?['StrictlyProhibited11'] == 1 &&
        patient?['AdditionalProhibitions1'] == 1) {
      setState(() {
        showMedicationError = false; 
      });
    } else {
      setState(() {
        showMedicationError = true;
      });
    }
  }

  void _calculateWeight() {
    int patientWeight = int.tryParse(patient?['Weight']) ?? 0;
    setState(() {
      medic1 = patientWeight * 0.9;
      medic2 = medic1 * 0.1;
      medic3 = medic1 - medic2;
    });
  }

  void _navigateToWarningPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WarningDetail(patientID: widget.patientID)),
    ).then((_) {
      _loadPatientData();
    });
  }

  Future<void> _updateMadic() async {
    String sql = "UPDATE Patient SET "
        "Medic1 = ${medic1}, "
        "Medic2 = ${medic2}, "
        "Medic3 = ${medic3} "
        "WHERE ID = ${patient?['ID']}";

    print('Executing SQL: $sql');

    await _databaseManager.updateDatabase(sql);
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
            'ปริมาณยา',
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
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height * 0.02),
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: const BorderSide(
                    color: Color(0xFF82B1FF),
                    width: 5,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.02),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อมูลผู้ป่วย',
                            style: TextStyle(
                                fontSize: height * 0.026,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          Text(
                            'ชื่อ : ${patient?['PatientName']}',
                            style: TextStyle(fontSize: height * 0.02),
                          ),
                          Divider(),
                          Text(
                            'โรงพยาบาล : ${patient?['Hospital']}',
                            style: TextStyle(fontSize: height * 0.02),
                          ),
                          Divider(),
                          Text(
                            'น้ำหนัก : ${patient?['Weight']} กิโลกรัม',
                            style: TextStyle(fontSize: height * 0.02),
                          ),
                          Divider(),
                          SizedBox(height: height * 0.04),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          Text(
                            'การให้ยาผู้ป่วย',
                            style: TextStyle(
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          if (showMedicationError)
                            Column(
                              children: [
                                Text(
                                  'ไม่สามารถคำนวณยาได้เนื่องจาก\nไม่ผ่านข้อบ่งชี้และข้อห้าม',
                                  style: TextStyle(
                                    fontSize: height * 0.02,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: height * 0.01),
                                ElevatedButton(
                                  onPressed: () {
                                    _navigateToWarningPage();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF82B1FF)),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            Size(width * 0.4, height * 0.05)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'ไปยังหน้าข้อบ่งชี้เเละข้อห้าม',
                                    style: TextStyle(
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )
                          else
                            Column(
                              children: [
                                Text(
                                  'ปริมาณยาละลายลิ่มเลือด\n(rt-PA) ${patient?['Medic1'].toStringAsFixed(2)} มิลลิกรัม',
                                  style: TextStyle(fontSize: height * 0.02),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                                Text(
                                  'แบ่งให้ ${patient?['Medic2'].toStringAsFixed(2)} มิลลิกรัม\nทางหลอดเลือดดำใน 1 นาที',
                                  style: TextStyle(fontSize: height * 0.02),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                                Text(
                                  'และ ${patient?['Medic3'].toStringAsFixed(2)} มิลลิกรัม\nหยดทางหลอดเลือดดำใน 60 นาที',
                                  style: TextStyle(fontSize: height * 0.02),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            ElevatedButton(
              onPressed: () {
                _calculateWeight();
                _updateMadic().then((_) {
                  _loadPatientData();
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF82B1FF)),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(150, 70)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
              child: Text(
                'คำนวณยาเเละบันทึก',
                style: TextStyle(
                  fontSize: height * 0.022,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
