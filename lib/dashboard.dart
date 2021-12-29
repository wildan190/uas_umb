import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:uas_umb/location.dart';
import 'package:uas_umb/screens/add_screen.dart';
import 'package:uas_umb/screens/info_screen.dart';

import 'screens/add_screen.dart';

class dashboard extends StatelessWidget {
  dashboard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 532.0, start: 0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                ),
                color: const Color(0xffcaecf9),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 82.0, end: 82.0),
            Pin(size: 241.0, middle: 0.3736),
            child:
                // Adobe XD layer: 'splashscreen' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/splash.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 255.0, middle: 0.5223),
            Pin(size: 53.0, start: 84.0),
            child: Text(
              'UAS FLUTTER',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 40,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          /*Pinned.fromPins(
            Pin(start: 82.0, end: 82.0),
            Pin(size: 55.0, middle: 0.7129),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),*/
          /*Pinned.fromPins(
            Pin(start: 82.0, end: 82.0),
            Pin(size: 55.0, middle: 0.8184),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),*/
          /*Pinned.fromPins(
            Pin(start: 82.0, end: 82.0),
            Pin(size: 55.0, end: 62.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),*/
          Pinned.fromPins(
            Pin(start: 82.0, end: 82.0),
            Pin(size: 55.0, middle: 0.7700),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(54, 126, 235, 10)),
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => InfoScreen());
                Navigator.push(context, route);
              },
              child: Text(
                'List Data Mahasiswa',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 10),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 82.0, end: 82.0),
            Pin(size: 55.0, middle: 0.8650),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(54, 126, 235, 10)),
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => AddScreen());
                Navigator.push(context, route);
              },
              child: Text(
                'Input Data Mahasiswa',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 10),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 82.0, end: 82.0),
            Pin(size: 55.0, end: 30.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(54, 126, 235, 10)),
              onPressed: () {
                Route route = MaterialPageRoute(builder: (context) => MyMaps());
                Navigator.push(context, route);
              },
              child: Text(
                'Lokasi Kampus UMB',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
