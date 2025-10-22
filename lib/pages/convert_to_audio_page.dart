import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';

class ConvertToAudioPage extends StatefulWidget {
  const ConvertToAudioPage({super.key});

  @override
  State<StatefulWidget> createState() => _ConvertToAudioPageState();
}

class _ConvertToAudioPageState extends State<ConvertToAudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: appBlack(1), foregroundColor: appGrey(1)),
      backgroundColor: appBlack(1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Media ",
                  style: TextStyle(
                    color: appWhite(1),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Converter",
                  style: TextStyle(
                    color: appWhite(0.6),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                Container(
                  height: 6,
                  width: 40,
                  decoration: BoxDecoration(
                    color: appGreen(1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Container(
                  height: 6,
                  width: 20,
                  decoration: BoxDecoration(
                    color: appGreen(0.6),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
