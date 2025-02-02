import 'package:flutter/material.dart';

class StrictlyNotProhibited1 extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialStrictlynotprohibited1;

  const StrictlyNotProhibited1(
      {Key? key,
      required this.onChanged,
      required this.initialStrictlynotprohibited1})
      : super(key: key);

  @override
  State<StrictlyNotProhibited1> createState() => _StrictlyNotProhibited1State();
}

class _StrictlyNotProhibited1State extends State<StrictlyNotProhibited1> {
  late int strictlynotprohibited1;

  @override
  void initState() {
    super.initState();
    strictlynotprohibited1 = widget.initialStrictlynotprohibited1;
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      if (strictlynotprohibited1 == index) {
        strictlynotprohibited1 = -1;
      } else {
        strictlynotprohibited1 = index;
      }
      widget.onChanged(strictlynotprohibited1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.02),
          Text(
            'มีอาการทางประสาทดีขึ้นอย่างรวดเร็ว\nจนเกือบเป็นปกติหรือมีอาการอย่างเดียว\nไม่รุนเเรง เช่น เเขนขาอ่อนเเรงเล็กน้อย\nโดย NIHSS น้อยกว่า 4 คะเเนน',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: height * 0.019),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.025),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: strictlynotprohibited1 == 0,
                      activeColor: Color(0xFF304FFE),
                      onChanged: (value) {
                        _handleCheckboxChange(0);
                      },
                    ),
                    Text(
                      'มี',
                      style: TextStyle(fontSize: height * 0.018),
                    ),
                  ],
                ),
                SizedBox(width: width * 0.05),
                Row(
                  children: [
                    Checkbox(
                      value: strictlynotprohibited1 == 1,
                      activeColor: Color(0xFF304FFE),
                      onChanged: (value) {
                        _handleCheckboxChange(1);
                      },
                    ),
                    Text(
                      'ไม่มี',
                      style: TextStyle(fontSize: height * 0.018),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}
