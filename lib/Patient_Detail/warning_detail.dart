import 'package:flutter/material.dart';
import 'package:hospital_app/Edit_Patient/EditWarning1.dart';
import 'package:hospital_app/sql_lite.dart';

class WarningDetail extends StatefulWidget {
  final int patientID;

  const WarningDetail({Key? key, required this.patientID}) : super(key: key);

  @override
  State<WarningDetail> createState() => _WarningDetailState();
}

class _WarningDetailState extends State<WarningDetail> {
  Map<String, dynamic>? patient;
  final SqllLiteManage _databaseManager = SqllLiteManage();

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
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    String checkIndication(int? value) {
      if (value == null) {
        return 'ไม่ได้ระบุ';
      }
      switch (value) {
        case 0:
          return 'ไม่';
        case 1:
          return 'ใช่';
        default:
          return 'ไม่ได้ระบุ';
      }
    }

    String checkProhibited(int? value) {
      if (value == null) {
        return 'ไม่ได้ระบุ';
      }
      switch (value) {
        case 0:
          return 'มี';
        case 1:
          return 'ไม่มี';
        default:
          return 'ไม่ได้ระบุ';
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFF82B1FF),
          centerTitle: true,
          title: Text(
            'ข้อบ่งชี้/ข้อห้าม',
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
              padding: EdgeInsets.symmetric(
                horizontal: height * 0.02,
              ),
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
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อบ่งชี้',
                            style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          buildRow(
                            height,
                            width,
                            'มีอาการของหลอดเลือดสมองตีบภายในระยะเวลา 4.5 ชั่วโมง\n',
                            checkIndication(patient?['Indications1']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีอายุเท่ากับหรือมากกว่า 18 ปี',
                            checkIndication(patient?['Indications2']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'ผล CT brain ไม่พบว่ามีเลือดออกในเนื้อสมองหรือชั้นใต้เยื่อหุ้มสมอง',
                            checkIndication(patient?['Indications3']),
                          ),
                          Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: height * 0.02,
              ),
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
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อห้ามอย่างเด็ดขาด',
                            style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          buildRow(
                            height,
                            width,
                            'มีอาการบาดเจ็บที่ศรีษะอย่างรุนเเรงหรือมีประวัติเป็นโรคหลอดเลือดสมองใน 3 เดือน',
                            checkProhibited(patient?['StrictlyProhibited1']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีอาการสงสัยว่ามีเลือดออกชั้นใต้ของ\nเยื่อหุ้มสมอง',
                            checkProhibited(patient?['StrictlyProhibited2']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีประวัติเคยมีเลือดออกในกระโหลกศรีษะ',
                            checkProhibited(patient?['StrictlyProhibited3']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีเนื้องอกในสมอง , Aneuysm, Arteriovenous Malformation',
                            checkProhibited(patient?['StrictlyProhibited4']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีการเเทงหลอกเลือดเเดงขนาดใหญ่ในตำเเหน่งที่ไม่สามารถกดได้ภายใน7วัน',
                            checkProhibited(patient?['StrictlyProhibited5']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีการได้รับการผ่าตัดกระโหลกศรีษะหรือกระดูกสันหลังภายใน 3 เดือน',
                            checkProhibited(patient?['StrictlyProhibited6']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีความดันโลหิตสูงเเละไม่สามารถลดความดันโลหิตลงได้ก่อนให้ยาละลายลิ่มเลือด',
                            checkProhibited(patient?['StrictlyProhibited7']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีผลการตรวจร่างกายพบว่ามีภาวะเลือดออก (Active Bleeding)',
                            checkProhibited(patient?['StrictlyProhibited8']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีภาวะเลือดออกง่าย',
                            checkProhibited(patient?['StrictlyProhibited9']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีระดับน้ำตาลในเลือดเท่ากับหรือ\nน้อยกว่า 50 mg/dl',
                            checkProhibited(patient?['StrictlyProhibited10']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'CT brain พบมีสมองขาดเลือดมากกว่าขนาด 1/3 ชอง cerebral hemisphere',
                            checkProhibited(patient?['StrictlyProhibited11']),
                          ),
                          Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: height * 0.02,
              ),
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
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อห้ามที่ไม่ถือว่าห้ามอย่างเด็ดขาด',
                            style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          buildRow(
                            height,
                            width,
                            'มีอาการทางประสาทดีขึ้นอย่างรวดเร็วจนเกือบเป็นปกติหรือมีอาการอย่างเดียวไม่รุนเเรง',
                            checkProhibited(patient?['StrictlyNotProhibited1']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีการตั้งครรภ์',
                            checkProhibited(patient?['StrictlyNotProhibited2']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีอาการชักตอนเริ่มต้นเเละภายหลังจากชักยังมีอาการอ่อนเเรงอยู่',
                            checkProhibited(patient?['StrictlyNotProhibited3']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'เคยมีประวัติการผ่าตัดใหญ่หรือ\nมีอุบัติเหตุรุนเเรงภายใน 14 วัน',
                            checkProhibited(patient?['StrictlyNotProhibited4']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีเลือดออกในทางเดินอาหารหรือ\nทางเดินปัสสสาวะภายใน 21 วัน',
                            checkProhibited(patient?['StrictlyNotProhibited5']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีประวัติ Recent Myocardial Infracytion ภายใน 3 เดือน',
                            checkProhibited(patient?['StrictlyNotProhibited6']),
                          ),
                          Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: height * 0.02,
              ),
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
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อห้ามเพิ่มเติมในกรณีผู้ป่วยมีอาการมากกว่า 3 - 4.5 ชั่วโมง',
                            style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          buildRow(
                            height,
                            width,
                            'NIHSS มากกว่า 25 คะเเนน',
                            checkProhibited(
                                patient?['AdditionalProhibitions1']),
                          ),
                          Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: height * 0.02,
              ),
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
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'ข้อห้ามเพิ่มเติมในกรณีผู้ป่วยมีอาการมากกว่า 3 - 4.5 ชั่วโมง',
                            style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Color(0xFF82B1FF),
                            thickness: 2.0,
                          ),
                          buildRow(
                            height,
                            width,
                            'เป็นเบาหวานร่วมกับเคยมีโรคหลอดเลือดสมองอุดตันมาก่อน',
                            checkProhibited(
                                patient?['AdditionalProhibitions2']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีอายุมากกว่า 80 ปี',
                            checkProhibited(
                                patient?['AdditionalProhibitions3']),
                          ),
                          Divider(),
                          buildRow(
                            height,
                            width,
                            'มีประวัติได้รับยาละลายลิ่มเลือด \n(Warfarin) โดยไม่พิจารณา INR',
                            checkProhibited(
                                patient?['AdditionalProhibitions4']),
                          ),
                          Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
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
                  builder: (context) => EditWarning1(
                    patientID: widget.patientID,
                  ),
                ),
              ).then((_) {
                _loadPatientData();
              });
            },
            borderRadius: BorderRadius.circular(height * 0.076 / 2),
            child: Center(
              child: Icon(
                Icons.edit_document,
                color: Colors.black,
                size: width * 0.095,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(double height, double width, String text, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: height * 0.018,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: width * 0.05),
          Text(
            value,
            style: TextStyle(
              fontSize: height * 0.018,
            ),
          ),
        ],
      ),
    );
  }
}
