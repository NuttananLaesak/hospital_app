import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_app/Add_Page/add_patient.dart';
import 'package:hospital_app/dashboard_patient.dart';
import 'package:hospital_app/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientListPage extends StatefulWidget {
  @override
  _PatientListPageState createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  late double height;
  late double width;
  List<Patient> _patients = [];
  List<Patient> _filteredPatients = []; // สำหรับเก็บรายชื่อที่ถูกกรอง
  TextEditingController _searchController = TextEditingController();
  String? _selectedGender;
  String? _selectedSeverity;

  @override
  void initState() {
    super.initState();
    loadPatients();
    _searchController.addListener(
        _filterPatients); // ฟังค์ชั่นกรองรายชื่อเมื่อมีการเปลี่ยนแปลงในช่องค้นหา
  }

  Future<void> loadPatients() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? patientList = prefs.getStringList('patients') ?? [];

    setState(() {
      _patients = patientList.map((patientData) {
        Map<String, dynamic> map = Map.from(json.decode(patientData));
        return Patient.fromMap(map);
      }).toList();
      _patients.sort((a, b) => b.id.compareTo(a.id));
      _filteredPatients = _patients; // เริ่มต้นให้แสดงผู้ป่วยทั้งหมด
    });
  }

  // ฟังก์ชันกรองรายชื่อผู้ป่วย
  void _filterPatients() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      _filteredPatients = _patients.where((patient) {
        bool matchesName =
            patient.nameController.toLowerCase().startsWith(searchText);
        bool matchesGender =
            _selectedGender == null || patient.gender == _selectedGender;
        bool matchesSeverity = _selectedSeverity == null ||
            _getSeverity(patient.totalScore) == _selectedSeverity;

        return matchesName && matchesGender && matchesSeverity;
      }).toList();
    });
  }

// ฟังก์ชันเพื่อแปลงคะแนนเป็นระดับความรุนแรง
  String _getSeverity(int totalScore) {
    if (totalScore == 0) return 'No Stroke';
    if (totalScore >= 1 && totalScore <= 4) return 'Minor Stroke';
    if (totalScore >= 5 && totalScore <= 15) return 'Moderate Stroke';
    if (totalScore >= 16 && totalScore <= 20)
      return 'Moderate to Severe Stroke';
    if (totalScore >= 21) return 'Severe Stroke';
    return '';
  }

  // ฟังก์ชันลบผู้ป่วย
  Future<void> _deletePatient(int index) async {
    final prefs = await SharedPreferences.getInstance();
    _patients.removeAt(index);

    List<String> patientList = _patients.map((patient) {
      return json.encode(patient.toMap());
    }).toList();

    await prefs.setStringList('patients', patientList);

    setState(() {
      _filteredPatients = _patients;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.08),
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF82B1FF), Color(0xFF82B1FF)],
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: AppBar(
                    backgroundColor: Colors.transparent,
                    iconTheme: IconThemeData(color: Color(0xFF82B1FF)),
                    centerTitle: true,
                    title: Text('รายชื่อผู้ป่วย',
                        style: TextStyle(
                            fontSize: height * 0.028,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)))))),
        endDrawer: Drawer(
            child: Padding(
                padding: EdgeInsets.all(16.0), // เพิ่ม padding รอบๆ
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.06),
                      Text('กรองผู้ป่วย',
                          style: TextStyle(
                              fontSize: height * 0.028,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: height * 0.04),
                      // ส่วนที่มี DropdownButton
                      Padding(
                          padding: EdgeInsets.only(bottom: height * 0.02),
                          child: Row(children: [
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black54, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.025),
                                    child: DropdownButton<String>(
                                      hint: Text('เพศ',
                                          style:
                                              TextStyle(color: Colors.black54)),
                                      value: _selectedGender,
                                      items: [
                                        DropdownMenuItem(
                                            value: 'ชาย', child: Text('ชาย')),
                                        DropdownMenuItem(
                                            value: 'หญิง', child: Text('หญิง')),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedGender = value;
                                          _filterPatients(); // เรียกใช้ฟังก์ชันกรอง
                                        });
                                      },
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: height * 0.017),
                                      dropdownColor: Colors.white,
                                      underline: SizedBox(),
                                      isExpanded: true,
                                    ))),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedGender = null;
                                    _filterPatients();
                                  });
                                },
                                icon: Icon(Icons.restore))
                          ])),
                      Padding(
                          padding: EdgeInsets.only(bottom: height * 0.04),
                          child: Row(children: [
                            Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black54, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.025),
                                    child: DropdownButton<String>(
                                        hint: Text('ระดับความรุนแรง',
                                            style: TextStyle(
                                                color: Colors.black54)),
                                        value: _selectedSeverity,
                                        items: [
                                          DropdownMenuItem(
                                              value: 'No Stroke',
                                              child: Text('No Stroke')),
                                          DropdownMenuItem(
                                              value: 'Minor Stroke',
                                              child: Text('Minor Stroke')),
                                          DropdownMenuItem(
                                              value: 'Moderate Stroke',
                                              child: Text('Moderate Stroke')),
                                          DropdownMenuItem(
                                              value:
                                                  'Moderate to Severe Stroke',
                                              child: Text(
                                                  'Moderate to Severe Stroke')),
                                          DropdownMenuItem(
                                              value: 'Severe Stroke',
                                              child: Text('Severe Stroke')),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedSeverity = value;
                                            _filterPatients(); // เรียกใช้ฟังก์ชันกรอง
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: height * 0.017),
                                        dropdownColor: Colors.white,
                                        underline: SizedBox(),
                                        isExpanded: true))),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedSeverity = null;
                                    _filterPatients();
                                  });
                                },
                                icon: Icon(Icons.restore))
                          ])),
                      // เพิ่มปุ่มปิด Drawer

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _resetFilters();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF82B1FF)),
                                      minimumSize: MaterialStateProperty.all<
                                              Size>(
                                          Size(width * 0.58, height * 0.06)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0)))),
                                  child: Text('รีเซ็ต',
                                      style: TextStyle(
                                        fontSize: height * 0.019,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center)),
                              SizedBox(height: height * 0.02),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // ปิด Drawer
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF82B1FF)),
                                      minimumSize: MaterialStateProperty.all<Size>(
                                          Size(width * 0.58, height * 0.06)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      40.0)))),
                                  child: Text('ตกลง',
                                      style: TextStyle(
                                          fontSize: height * 0.019,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      textAlign: TextAlign.center))
                            ])
                          ])
                    ]))),
        body: Column(children: [
          Padding(
              padding: EdgeInsets.only(
                top: height * 0.04,
                bottom: height * 0.04,
                left: width * 0.076,
                right: width * 0.076,
              ),
              child: Row(children: [
                Expanded(
                    child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                            labelText: 'ค้นหาผู้ป่วย',
                            labelStyle: TextStyle(
                                color: Colors.black), // สีปกติของ label
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              borderSide: BorderSide(
                                  color: Colors.black), // เส้นขอบสีดำ
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                                borderSide: BorderSide(
                                    color: Colors
                                        .black)), // เส้นขอบเมื่ออยู่ในโฟกัส
                            prefixIcon: const Icon(Icons.search)),
                        cursorColor:
                            Colors.black54, // กำหนดสีของเคอร์เซอร์ที่นี่
                        onChanged: (text) {
                          setState(() {
                            // อัปเดตค่าเมื่อพิมพ์
                          });
                        })),
                Builder(
                  builder: (context) => IconButton(
                      icon:
                          Image.asset('images/filter.png', width: width * 0.1),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      }),
                )
              ])),
          Expanded(
              child: ListView.builder(
                  itemCount: _filteredPatients.length,
                  itemBuilder: (context, index) {
                    final patient = _filteredPatients[index];
                    int totalScore =
                        patient.totalScore; // ดึงค่าจาก Patient object
                    Color scoreColor;

                    // กำหนดสีตามคะแนน
                    if (totalScore == 0) {
                      scoreColor = Colors.green;
                    } else if (totalScore >= 1 && totalScore <= 4) {
                      scoreColor = Colors.yellow[600]!;
                    } else if (totalScore >= 5 && totalScore <= 15) {
                      scoreColor = Colors.orange;
                    } else if (totalScore >= 16 && totalScore <= 20) {
                      scoreColor = Colors.amber[900]!;
                    } else if (totalScore >= 21) {
                      scoreColor = Colors.red;
                    } else {
                      scoreColor = Colors.black;
                    }

                    return Container(
                        margin: EdgeInsets.only(
                          bottom: height * 0.02,
                          left: width * 0.076,
                          right: width * 0.076,
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.white, Colors.white]),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: Color(0xFF82B1FF), width: 5.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(0, 2))
                            ]),
                        child: ListTile(
                          title: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'NIHSS ${patient.totalScore}',
                                  style: TextStyle(
                                    fontSize: height * 0.0175,
                                    fontWeight: FontWeight.bold,
                                    color: scoreColor, // สีตัวอักษร
                                  ),
                                ),
                                SizedBox(width: width * 0.0175),
                                Text(
                                  '(${patient.nihssLevel})',
                                  style: TextStyle(
                                    fontSize: height * 0.0175,
                                    fontWeight: FontWeight.bold,
                                    color: scoreColor, // สีตัวอักษร
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Column(children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    patient.nameController.isNotEmpty
                                        ? 'ชื่อ ${patient.nameController}'
                                        : 'ชื่อ ไม่ระบุ',
                                    style: TextStyle(
                                        fontSize: height * 0.017,
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    patient.hospitalController.isNotEmpty
                                        ? 'โรงพยาบาล ${patient.hospitalController}'
                                        : 'โรงพยาบาล',
                                    style: TextStyle(
                                        fontSize: height * 0.017,
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  patient.gender.isNotEmpty
                                      ? 'เพศ${patient.gender} '
                                      : 'เพศ ',
                                  style: TextStyle(
                                      fontSize: height * 0.017,
                                      color: Colors.black),
                                ),
                                Text(
                                  patient.ageController != null
                                      ? 'อายุ${patient.ageController}ปี '
                                      : 'อายุ ',
                                  style: TextStyle(
                                    fontSize: height * 0.017,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  patient.weightController.isNotEmpty
                                      // ignore: unnecessary_null_comparison
                                      ? (patient.weightController != null &&
                                              patient
                                                  .weightController.isNotEmpty
                                          ? 'น้ำหนัก${patient.weightController}กก.'
                                          : 'น้ำหนัก')
                                      : 'น้ำหนัก',
                                  style: TextStyle(
                                    fontSize: height * 0.017,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'RTPA ${patient.rtpa}',
                                  style: TextStyle(
                                    fontSize: height * 0.017,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '${patient.recordedTime1} ${patient.recordedTime2}',
                                  style: TextStyle(
                                      fontSize: height * 0.014,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.black),
                            onPressed: () => _confirmDelete(
                                index), // เรียกฟังก์ชันยืนยันการลบ
                          ),
                          onTap: () {
                            _selectedGender = null;
                            _selectedSeverity = null;
                            _searchController.clear(); // ล้างช่องค้นหา
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardPatient(
                                    patientId: _patients[index].id),
                              ),
                            ).then((_) {
                              loadPatients(); // โหลดข้อมูลใหม่เมื่อกลับจากหน้ารายละเอียด
                            });
                          },
                        ));
                  }))
        ]),
        floatingActionButton: Container(
            width: height * 0.08,
            height: height * 0.1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF82B1FF), Color(0xFF82B1FF)]),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2))
                ]),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPatient()));
                    },
                    borderRadius: BorderRadius.circular(height * 0.076 / 2),
                    child: Center(
                        child: Icon(Icons.person_add_alt_sharp,
                            color: Colors.black, size: width * 0.076))))));
  }

  void _resetFilters() {
    setState(() {
      _selectedGender = null;
      _selectedSeverity = null;
      _filteredPatients = _patients; // คืนค่าผู้ป่วยทั้งหมด
      _searchController.clear(); // ล้างช่องค้นหา
    });
  }

  Future<void> _confirmDelete(int index) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                'ยืนยันการลบ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Text('คุณแน่ใจหรือว่าต้องการลบผู้ป่วยนี้?'),
              actions: <Widget>[
                TextButton(
                    child: Text('ลบ',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      _deletePatient(index); // เรียกฟังก์ชันลบ
                      Navigator.of(context).pop(); // ปิด popup
                    }),
                TextButton(
                    child: Text('ยกเลิก',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.of(context).pop(); // ปิด popup โดยไม่ลบ
                    }),
              ]);
        });
  }
}
