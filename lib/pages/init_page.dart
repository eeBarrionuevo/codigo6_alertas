import 'package:codigo6_alertas/pages/home_page.dart';
import 'package:codigo6_alertas/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitPage extends StatefulWidget {
  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int indexPage = 0;

  List<Widget> pages = [
    HomePage(),
    MapPage(),
    Center(
      child: Text("Noticias"),
    ),
    Center(
      child: Text("Perfil"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          indexPage = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.amber,
        currentIndex: indexPage,
        iconSize: 22,
        selectedFontSize: 14,
        selectedItemColor: Color(0xff605AF8),
        selectedIconTheme: IconThemeData(
          size: 24.0,
        ),
        showSelectedLabels: true,
        unselectedFontSize: 14,
        unselectedItemColor: Colors.black38,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: indexPage == 0 ? Color(0xff605AF8) : Colors.black38,
            ),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/map.svg",
              color: indexPage == 1 ? Color(0xff605AF8) : Colors.black38,
            ),
            label: "Mapa",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/news.svg",
              color: indexPage == 2 ? Color(0xff605AF8) : Colors.black38,
            ),
            label: "Noticias",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/user.svg",
              color: indexPage == 3 ? Color(0xff605AF8) : Colors.black38,
            ),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
