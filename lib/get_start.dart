import 'package:flutter/material.dart';

class GetStart extends StatefulWidget {
  const GetStart({Key? key}) : super(key: key);

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: screenHeight * 0.625, // equivalent to height / 1.6
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
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          'เเอปพลิเคชัน \n ป้องกันเเละดูเเลรักษา \n โรคหลอดเลือดสมองครบวงจร',
                          style: TextStyle(
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.4,
                          child: Image.asset(
                            'images/doctor.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.375, // equivalent to height / 2.666
                  color: Color(0xFF82B1FF),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.375, // equivalent to height / 2.666
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'เเอปพลิเคชันช่วยอำนวยความสะดวก\nให้กับเเพทย์สำหรับในการในการประเมิน\nความรุนเเรงของโรคทางหลอดเลือดสมอง\nเพิ่มความรวดเร็วในการประเมินอาการของผู้ป่วย\nเพื่อลดอัตราการตายเเละการพิการของผู้ป่วย',
                        style: TextStyle(
                          fontSize: screenHeight * 0.021,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF82B1FF),
                              Color(0xFF82B1FF),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/patientList', (route) => false);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                              horizontal: screenWidth * 0.2,
                            ),
                            child: Text(
                              'เริ่มต้นใช้งาน',
                              style: TextStyle(
                                fontSize: screenHeight * 0.025,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
