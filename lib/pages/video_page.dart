import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: appBlack(1), foregroundColor: appGrey(1)),
      backgroundColor: appBlack(1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Video",
              style: TextStyle(
                color: appWhite(1),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              spacing: 5,
              children: [
                Container(
                  height: 6,
                  width: 30,
                  decoration: BoxDecoration(
                    color: appGreen(1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Container(
                  height: 6,
                  width: 10,
                  decoration: BoxDecoration(
                    color: appGreen(0.7),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(height: 660, child: ListView(children: [])),
          ],
        ),
      ),
    );
  }
}
