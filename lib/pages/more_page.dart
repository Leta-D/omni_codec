import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';

class MorePage extends StatelessWidget {
  MorePage({super.key});

  final List<Map<String, dynamic>> pages = [
    {"label": "Audio", "icon": Icons.audio_file, "target": "/audio"},
    {"label": "Video", "icon": Icons.video_file, "target": "/video"},
    {
      "label": "Favorite",
      "icon": Icons.favorite_rounded,
      "target": "/mostAndFavorite",
    },
    {
      "label": "Most Played",
      "icon": Icons.star_border_purple500_rounded,
      "target": "/mostAndFavorite",
    },
    {
      "label": "Network / Stream",
      "icon": Icons.network_wifi_rounded,
      "target": "/settings",
    },
    {"label": "Settings", "icon": Icons.settings, "target": "/settings"},
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Column(
        spacing: 15,
        children: [
          Row(
            spacing: screenSize.width / 12,
            children: [
              CircleAvatar(
                radius: screenSize.width / 7.2,
                backgroundColor: Colors.transparent,
                child: Image.asset("assets/image/omniCodec_logo.png"),
              ),

              Text(
                "plays any format, endlessly.",
                style: TextStyle(
                  fontSize: screenSize.width / 30,
                  color: appGrey(1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenSize.height / 1.44,
            child: ListView(
              children: [
                for (var item in pages)
                  Padding(
                    padding: EdgeInsets.only(top: screenSize.width / 49),
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        item["target"],

                        arguments: {
                          "animationType": "slide",
                          "isMostPlayed": item["label"] == "Most Played"
                              ? true
                              : item["label"] == "Favorite"
                              ? false
                              : null,
                        },
                      ),
                      leading: Icon(item["icon"], color: appGreen(1)),
                      title: Text(
                        item["label"],
                        style: TextStyle(color: appWhite(1)),
                      ),
                      tileColor: const Color.fromARGB(22, 121, 248, 149),
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: appGrey(1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
