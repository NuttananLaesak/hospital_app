import 'package:flutter/material.dart';

class DiseaseSelection extends StatefulWidget {
  final Function(String) onDiseasesSelected;

  const DiseaseSelection({Key? key, required this.onDiseasesSelected})
      : super(key: key);

  @override
  _DiseaseSelectionState createState() => _DiseaseSelectionState();
}

class _DiseaseSelectionState extends State<DiseaseSelection> {
  bool hasNoDisease = false;
  bool hasDiabetes = false;
  bool hasHypertension = false;
  bool hasDyslipdemia = false;
  bool hasArteryDisease = false;
  bool hasAviral = false;
  bool hasOtherDisease = false;

  TextEditingController otherDiseaseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: CheckboxListTile(
            title: Text(
              'ไม่มีโรคประจำตัว\n(No Underlying Disease)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: hasNoDisease,
            activeColor: Color(0xFF304FFE),
            onChanged: (bool? value) {
              setState(() {
                hasNoDisease = value!;
                if (hasNoDisease) {
                  hasDiabetes = false;
                  hasHypertension = false;
                  hasDyslipdemia = false;
                  hasArteryDisease = false;
                  hasAviral = false;
                  hasOtherDisease = false;
                  otherDiseaseController.clear();
                }
                updateSelectedDiseases();
              });
            },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคเบาหวาน\n(Diabetes Mellitus)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: hasDiabetes,
            activeColor: Color(0xFF304FFE),
            onChanged: hasNoDisease
                ? null
                : (bool? value) {
                    setState(() {
                      hasDiabetes = value!;
                      updateSelectedDiseases();
                    });
                  },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคความดันโลหิตสูง\n(Hypertension)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: hasHypertension,
            activeColor: Color(0xFF304FFE),
            onChanged: hasNoDisease
                ? null
                : (bool? value) {
                    setState(() {
                      hasHypertension = value!;
                      updateSelectedDiseases();
                    });
                  },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคไขมันในเลือดสูง\n(Dyslipidemia)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: hasDyslipdemia,
            activeColor: Color(0xFF304FFE),
            onChanged: hasNoDisease
                ? null
                : (bool? value) {
                    setState(() {
                      hasDyslipdemia = value!;
                      updateSelectedDiseases();
                    });
                  },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคหลอดเลือดสมอง\n(Stroke)',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: hasArteryDisease,
            activeColor: Color(0xFF304FFE),
            onChanged: hasNoDisease
                ? null
                : (bool? value) {
                    setState(() {
                      hasArteryDisease = value!;
                      updateSelectedDiseases();
                    });
                  },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'โรคหัวใจเต้นพลิ้ว\n(Atrial Fibrillation/Atrial Flutter)',
              style: TextStyle(fontSize: height * 0.017),
            ),
            value: hasAviral,
            activeColor: Color(0xFF304FFE),
            onChanged: hasNoDisease
                ? null
                : (bool? value) {
                    setState(() {
                      hasAviral = value!;
                      updateSelectedDiseases();
                    });
                  },
          ),
        ),
        SizedBox(height: height * 0.01),
        Card(
          child: CheckboxListTile(
            title: Text(
              'อื่นๆ',
              style: TextStyle(fontSize: height * 0.018),
            ),
            value: hasOtherDisease,
            activeColor: Color(0xFF304FFE),
            onChanged: hasNoDisease
                ? null
                : (bool? value) {
                    setState(() {
                      hasOtherDisease = value!;
                      updateSelectedDiseases();
                    });
                  },
          ),
        ),
        if (hasOtherDisease)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: otherDiseaseController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'โปรดระบุโรค',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Color(0xFF304FFE)),
                ),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (text) {
                updateSelectedDiseases();
              },
            ),
          ),
      ],
    );
  }

  void updateSelectedDiseases() {
    List<String> selectedDiseases = [];
    if (hasNoDisease) {
      selectedDiseases.add('ไม่มีโรคประจำตัว');
    } else {
      if (hasDiabetes) selectedDiseases.add('โรคเบาหวาน');
      if (hasHypertension) selectedDiseases.add('โรคความดันโลหิตสูง');
      if (hasDyslipdemia) selectedDiseases.add('โรคไขมันในเลือดสูง');

      if (hasArteryDisease) selectedDiseases.add('โรคหลอดเลือดสมอง');
      if (hasAviral) selectedDiseases.add('โรคหัวใจเต้นพลิ้ว');
      if (hasOtherDisease && otherDiseaseController.text.isNotEmpty) {
        selectedDiseases.add(otherDiseaseController.text);
      }
    }

    widget.onDiseasesSelected(selectedDiseases.join(', '));
  }
}
