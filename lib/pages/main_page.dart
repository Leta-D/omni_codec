import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_codec_player/constants/app_colors.dart';
import 'package:omni_codec_player/logic/device_permission/device_permission_cubit.dart';
import 'package:omni_codec_player/logic/device_permission/device_permission_state.dart';
import 'package:omni_codec_player/pages/home_page.dart';
import 'package:omni_codec_player/pages/browse_page.dart';
import 'package:omni_codec_player/pages/more_page.dart';
import 'package:permission_handler/permission_handler.dart';

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
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: appBlack(1),
      body: Stack(
        children: [
          BlocBuilder<DevicePermissionCubit, DevicePermissionState>(
            builder: (context, state) {
              if (state is PermissionGranted) {
                return _mainPages[_currentIndex]["target"];
              } else if (state is PermissionInitial) {
                // Request permission
                context.read<DevicePermissionCubit>().requestMediaPermission();
                return Center(
                  child: CircularProgressIndicator(color: appGreen(1)),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 50,
                    children: [
                      Text(
                        "Permission Permanently Denied\nPlease allow storage permission from settings",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: appWhite(1),
                          fontSize: screenSize.width / 20,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await openAppSettings().then((value) {
                            if (value) {
                              setState(() {});
                            } else {
                              context
                                  .read<DevicePermissionCubit>()
                                  .requestMediaPermission();
                            }
                          });
                        },
                        child: Text("Open Settings"),
                      ),
                    ],
                  ),
                );
              }
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenSize.height / 15,
              // color: const Color.fromARGB(162, 0, 0, 0),
              color: appBlack(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var item in _mainPages)
                    AnimatedContainer(
                      duration: Duration(microseconds: 300),
                      margin: EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          screenSize.width / 18,
                        ),
                        boxShadow: !(_currentIndex == _mainPages.indexOf(item))
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.5),
                                  offset: const Offset(0, 5),
                                  blurRadius: screenSize.width / 24,
                                ),
                              ],
                      ),
                      child: InkWell(
                        onTap: () => setState(() {
                          _currentIndex = _mainPages.indexOf(item);
                        }),
                        radius: 20,
                        child: Column(
                          children: [
                            Icon(
                              (_currentIndex == _mainPages.indexOf(item))
                                  ? item["selectedIcon"]
                                  : item["defaultIcon"],
                              color: (_currentIndex == _mainPages.indexOf(item))
                                  ? appGreen(1)
                                  : appGrey(1),
                              size: 28,
                            ),
                            Text(
                              item["label"],
                              style: TextStyle(
                                fontSize: screenSize.width / 24,
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
