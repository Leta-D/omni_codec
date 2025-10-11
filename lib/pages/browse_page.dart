import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';

class BrowsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.transparent,
                child: Image.asset("assets/image/omniCodec_logo.png"),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, color: appWhite(1)),
              ),
            ],
          ),
          SizedBox(height: 640, child: ListView(children: [])),
        ],
      ),
    );
  }
}
