// ignore_for_file: file_names, prefer_final_fields

import 'package:covid19_checker/constans/colors.dart';
import 'package:covid19_checker/constans/spacing.dart';
import 'package:covid19_checker/screens/Resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectDisease extends StatefulWidget {
  const SelectDisease({Key? key}) : super(key: key);

  @override
  State<SelectDisease> createState() => _SelectDiseaseState();
}

class _SelectDiseaseState extends State<SelectDisease> {
  int count = 0;

  List<Map<String, dynamic>> _dataDesiase = [
    {"title": "Kehilangan Rasa/Bau", "selected": false, "value": 25},
    {"title": "Demam", "selected": false, "value": 15},
    {"title": "Batuk", "selected": false, "value": 10},
    {"title": "Sakit Tenggorokan", "selected": false, "value": 15},
    {"title": "Nyeri Badan", "selected": false, "value": 5},
    {"title": "Ruam Kulit", "selected": false, "value": 5},
    {"title": "Diare", "selected": false, "value": 5},
    {"title": "Sesak Nafas", "selected": false, "value": 10},
    {"title": "Nyeri Dada", "selected": false, "value": 10}
  ];

  @override
  void initState() {
    super.initState();
  }

  void handleChangeState(int index, bool value) {
    setState(() {
      value
          ? _dataDesiase[index]['selected'] = false
          : _dataDesiase[index]['selected'] = true;
    });

    if (value == false) {
      countSelectedResult(_dataDesiase[index]['value']);
    } else if (value == true) {
      countNotSelectedResult(_dataDesiase[index]['value']);
    }
  }

  void countSelectedResult(int value) {
    count = count + value;
  }

  void countNotSelectedResult(int value) {
    count = count - value;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      height: height * 0.9,
      padding: EdgeInsets.only(
          top: 18, left: 18, right: 18, bottom: isPotrait ? 18 : 45),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 5),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x000000).withOpacity(0.25),
                            blurRadius: 5)
                      ]),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(mainColor),
                    size: 15,
                  ),
                ),
              ),
              Text(
                "Pilih Gejala",
                style: TextStyle(
                  fontSize: isPotrait ? 20 : 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),

          // List Disease
          Container(
            height: isPotrait ? height * 0.7 : height * 0.5,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(top: 10),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 1.1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10),
              itemCount: _dataDesiase.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () =>
                    handleChangeState(index, _dataDesiase[index]['selected']),
                child: Container(
                  height: height * 0.2,
                  padding: EdgeInsets.only(left: 3, right: 3),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        (_dataDesiase[index]['selected'] == false)
                            ? BoxShadow(
                                color: Color(0x000000).withOpacity(0.25),
                                blurRadius: 5)
                            : BoxShadow()
                      ],
                      border: (_dataDesiase[index]['selected'] == true)
                          ? Border.all(color: const Color(mainColor), width: 2)
                          : Border(),
                      borderRadius: BorderRadius.circular(radius)),
                  child: Center(
                    child: Text(
                      _dataDesiase[index]['title'],
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: count > 0
                    ? Color(mainColor)
                    : Color.fromARGB(255, 201, 201, 201),
                onPrimary: Colors.white,
                minimumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius))),
            child: Text('Prediksi', style: TextStyle(fontSize: 20)),
            onPressed: () => count != 0
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Resultscreen(count: count)))
                : null,
          ),
        ],
      ),
    );
  }
}
