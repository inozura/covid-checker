// ignore: file_names
// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:backdrop_modal_route/backdrop_modal_route.dart';
import 'package:covid19_checker/backdrops/SelectDisease.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constans/colors.dart';
import '../constans/spacing.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          height: heightScreen,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: paddingY, left: paddingX, right: paddingX, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      Image.asset(
                        'assets/img/homepage_img.png',
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Cek Dini Covid 19",
                          style: GoogleFonts.montserrat(
                              fontSize: 34,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      const SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            widthScreen * 0.15, 0, widthScreen * 0.15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("@2022", style: TextStyle(fontSize: 14)),
                            Text("Novandra Zulfi Ramadhan",
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(mainColor),
                          onPrimary: Colors.white,
                          minimumSize: Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(radius))),
                      child: Text('Periksa Sekarang',
                          style: TextStyle(fontSize: 20)),
                      onPressed: () => handleSelectDesiaseBackdrop(context)),
                ],
              ),
            ),
          )),
    );
  }

  void handleSelectDesiaseBackdrop(BuildContext context) {
    Navigator.push(
      context,
      BackdropModalRoute(
          overlayContentBuilder: (context) => SelectDisease(),
          topPadding: 77.0),
    );
  }
}
