// ignore_for_file: prefer_const_constructors
import 'package:covid19_checker/constans/colors.dart';
import 'package:covid19_checker/constans/spacing.dart';
import 'package:covid19_checker/screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Resultscreen extends StatefulWidget {
  final int count;
  const Resultscreen({Key? key, @required this.count = 0}) : super(key: key);

  @override
  _ResultscreenState createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    void _launchURL() async {
      const url = 'https://inozura.github.io/my';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      body: Container(
        height: heightScreen,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                top: paddingY, left: paddingX, right: paddingX),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Container(
                  child: Column(
                    children: [
                      // TEXT AND IMAGE
                      Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            // HEAD TITLE
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Hasil Prediksi',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            // SUB TITLE
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'SARS-CoV-2',
                                  style: GoogleFonts.montserrat(fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image.asset(
                              'assets/img/result_img.png',
                              width: 230,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      // RESULT
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: ((widget.count < 40) == true
                                    ? Colors.black.withOpacity(0.5)
                                    : (widget.count >= 40 &&
                                                widget.count < 60) ==
                                            true
                                        ? Colors.orangeAccent
                                        : (widget.count >= 60) == true
                                            ? Colors.red
                                            : Colors.blue),
                                width: 2),
                            borderRadius: BorderRadius.circular(radius)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [Text("Persentase")],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  ((widget.count < 40) == true
                                      ? "Negatif"
                                      : (widget.count >= 40 &&
                                                  widget.count < 60) ==
                                              true
                                          ? "Waspada"
                                          : (widget.count >= 60) == true
                                              ? 'Bahaya'
                                              : 'null'),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: ((widget.count < 40) == true
                                          ? Colors.black
                                          : (widget.count >= 40 &&
                                                      widget.count < 60) ==
                                                  true
                                              ? Colors.orangeAccent
                                              : (widget.count >= 60) == true
                                                  ? Colors.red
                                                  : Colors.blue)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${widget.count}%",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: ((widget.count < 40) == true
                                          ? Colors.black
                                          : (widget.count >= 40 &&
                                                      widget.count < 60) ==
                                                  true
                                              ? Colors.orangeAccent
                                              : (widget.count >= 60) == true
                                                  ? Colors.red
                                                  : Colors.blue)),
                                )
                              ],
                            ),
                            // Button
                          ],
                        ),
                      ),
                      // Button
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(mainColor),
                              onPrimary: Colors.white,
                              minimumSize: Size(40, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(radius))),
                          child: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 15,
                          ),
                          onPressed: () => showDialog(
                                context: context,
                                builder: (_) => FlareGiffyDialog(
                                  flarePath: 'assets/flare/space_demo.flr',
                                  flareAnimation: 'loading',
                                  flareFit: BoxFit.contain,
                                  title: Text(
                                    "Novandra Zulfi Ramadhan ❤️️ Space",
                                    style: GoogleFonts.lato(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  description: Text(
                                    "The Fantastic Dreamer 💫",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 17,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  entryAnimation: EntryAnimation.DEFAULT,
                                  buttonCancelText: Text(
                                    "Close",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  buttonOkText: Text(
                                    "Visit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  buttonOkColor: Color(mainColor),
                                  onOkButtonPressed: _launchURL,
                                ),
                              )),
                      SizedBox(
                        width: 1,
                      ),
                      SizedBox(
                        width: widthScreen * 0.67,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(mainColor),
                              onPrimary: Colors.white,
                              minimumSize: Size.fromHeight(0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(radius))),
                          child: Text('Ulangi', style: TextStyle(fontSize: 20)),
                          onPressed: () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homescreen()),
                              ModalRoute.withName("/Home")),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
