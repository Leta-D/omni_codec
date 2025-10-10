import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainPages[_currentIndex]["target"],
      bottomNavigationBar: Container(
        height: 70,
        color: const Color.fromARGB(255, 20, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var item in _mainPages)
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
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
                            : Colors.grey,
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
