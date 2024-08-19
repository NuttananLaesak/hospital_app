import 'package:flutter/material.dart';
import 'package:hospital_app/Add_Page/add_patient.dart';
import 'package:hospital_app/dashboard_patient.dart';
import 'package:hospital_app/sql_lite.dart';

class PatientListPage extends StatefulWidget {
  @override
  _PatientListPageState createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  late double height;
  late double width;
  final SqllLiteManage _databaseManager = SqllLiteManage();
  List<Map<String, dynamic>> _patients = [];
  List<Map<String, dynamic>> _filteredPatients = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPatientData();
    _searchController.addListener(_filterPatients);
  }

  Future<void> _loadPatientData() async {
    await _databaseManager.openOrCreateDatabase();
    List<Map<String, dynamic>> patients =
        await _databaseManager.selectDatabase("SELECT * FROM Patient");
    setState(() {
      _patients = patients;

      _filteredPatients = patients;
    });
  }

  void _filterPatients() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPatients = _patients.where((patient) {
        return patient['PatientName'].toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<void> _deletePatient(int id) async {
    await _databaseManager.deleteRecordById(id);
    await _loadPatientData();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF82B1FF),
                Color(0xFF82B1FF),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'รายชื่อผู้ป่วย',
              style: TextStyle(
                fontSize: height * 0.028,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.04,
                bottom: height * 0.04,
                left: width * 0.076,
                right: width * 0.076,
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'ค้นหาผู้ป่วย',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filteredPatients.length,
                itemBuilder: (context, index) {
                  final patient = _filteredPatients[index];
                  int totalScore = patient['TotalScore'] ?? 0;
                  Color scoreColor;

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
                        colors: [
                          Color(0xFF82B1FF),
                          Color(0xFF82B1FF),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 0.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Container(
                        width: height * 0.055,
                        height: height * 0.055,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage('images/1.1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Center(
                        child: Text(
                          patient['PatientName'] != null &&
                                  patient['PatientName'].isNotEmpty
                              ? patient['PatientName']
                              : 'ไม่ระบุ',
                          style: TextStyle(
                              fontSize: height * 0.022,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                            'NIHSS : ${patient['TotalScore']} ',
                            style: TextStyle(
                              fontSize: height * 0.017,
                              fontWeight: FontWeight.bold,
                              color: scoreColor,
                            ),
                          ),
                          Text(
                            '${patient['NIHSSLevel']}',
                            style: TextStyle(
                                fontSize: height * 0.017, color: Colors.black),
                          ),
                          Text(
                            '${patient['Hospital']?.isNotEmpty == true ? patient['Hospital'] : '-'} ',
                            style: TextStyle(
                                fontSize: height * 0.017, color: Colors.black),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.black),
                        onPressed: () {
                          _showDeleteConfirmationDialog(patient['ID']);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DashboardPatient(patientID: patient['ID']),
                          ),
                        ).then((_) {
                          _loadPatientData(); // Reload data when returning
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: height * 0.08,
        height: height * 0.1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF82B1FF),
              Color(0xFF82B1FF),
            ],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPatient(),
                ),
              );
            },
            borderRadius: BorderRadius.circular(height * 0.076 / 2),
            child: Center(
              child: Icon(
                Icons.person_add_alt_sharp,
                color: Colors.black,
                size: width * 0.095,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ยืนยันการลบ'),
          content: const Text('คุณแน่ใจหรือไม่ว่าต้องการลบผู้ป่วยรายนี้?'),
          actions: [
            TextButton(
              child: const Text(
                'ยกเลิก',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'ลบ',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              onPressed: () {
                _deletePatient(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
