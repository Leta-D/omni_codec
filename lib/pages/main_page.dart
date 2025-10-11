import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';
import 'package:omni_codec_player/pages/home_page.dart';
import 'package:omni_codec_player/pages/library_page.dart';
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
      "label": "Library",
      "selectedIcon": Icons.library_music_rounded,
      "defaultIcon": Icons.library_music_outlined,
      "target": LibraryPage(),
    },
    {
      "label": "More",
      "selectedIcon": Icons.more_rounded,
      "defaultIcon": Icons.more_outlined,
      "target": MorePage(),
    },
  ];

  int _currentIndex = 0;
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlack(1),
      body: _mainPages[_currentIndex]["target"],
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.transparent,
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
                            ? const Color.fromARGB(255, 7, 255, 48)
                            : appGrey(1),
                        size: 32,
                      ),
                      Text(
                        item["label"],
                        style: TextStyle(
                          fontSize: 16,
                          color: (_currentIndex == _mainPages.indexOf(item))
                              ? const Color.fromARGB(255, 7, 255, 48)
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
    );
  }
}
