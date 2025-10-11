import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';
import 'package:omni_codec_player/pages/home_page.dart';
import 'package:omni_codec_player/pages/browse_page.dart';
import 'package:omni_codec_player/pages/more_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, dynamic>> _mainPages = [
    {
      "label": "Home",
      "selectedIcon": Icons.home_filled,
      "defaultIcon": Icons.home_outlined,
      "target": HomePage(),
    },
    {
      "label": "Browse",
      "selectedIcon": Icons.folder,
      "defaultIcon": Icons.folder_open_outlined,
      "target": BrowsePage(),
    },
    {
      "label": "More",
      "selectedIcon": Icons.more_rounded,
      "defaultIcon": Icons.more_outlined,
      "target": MorePage(),
    },
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlack(1),
      body: Stack(
        children: [
          _mainPages[_currentIndex]["target"],

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              // color: const Color.fromARGB(162, 0, 0, 0),
              color: appBlack(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var item in _mainPages)
                    AnimatedContainer(
                      duration: Duration(microseconds: 300),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: !(_currentIndex == _mainPages.indexOf(item))
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  offset: const Offset(0, 5),
                                  blurRadius: 15,
                                ),
                              ],
                      ),
                      child: InkWell(
                        onTap: () => setState(() {
                          _currentIndex = _mainPages.indexOf(item);
                        }),

                        child: Column(
                          children: [
                            Icon(
                              (_currentIndex == _mainPages.indexOf(item))
                                  ? item["selectedIcon"]
                                  : item["defaultIcon"],
                              color: (_currentIndex == _mainPages.indexOf(item))
                                  ? appGreen(1)
                                  : appGrey(1),
                              size: 32,
                            ),
                            Text(
                              item["label"],
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    (_currentIndex == _mainPages.indexOf(item))
                                    ? appWhite(1)
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),

      // bottomNavigationBar:
    );
  }
}
