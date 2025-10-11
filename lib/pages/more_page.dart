import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  MorePage({super.key});

  final List<Map<String, dynamic>> pages = [
    {"label": "Audio", "icon": Icons.audio_file, "target": "/audio"},
    {"label": "Video", "icon": Icons.video_file, "target": "/video"},
    {
      "label": "Network",
      "icon": Icons.network_wifi_rounded,
      "target": "/audio",
    },
    {
      "label": "Settings",
      "icon": Icons.settings_applications_sharp,
      "target": "/settings",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [CircleAvatar(radius: 50, backgroundColor: Colors.grey)],
          ),
        ],
      ),
    );
  }
}
