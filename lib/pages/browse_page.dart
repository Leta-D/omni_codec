import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';
import 'package:omni_codec_player/pages/widgets/audio_player_widget.dart';

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
          SizedBox(
            height: 640,
            child: ListView(
              children: [folderContainerWidget(), audioPlayerWidget()],
            ),
          ),
        ],
      ),
    );
  }

  Widget folderContainerWidget() {
    return Wrap(
      children: [
        for (int i = 0; i < 5; i++)
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  blurRadius: 2,
                  spreadRadius: 5,
                  color: appGrey(1),
                ),
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  blurRadius: 2,
                  spreadRadius: 3,
                  color: appBlackL(1),
                ),
              ],
            ),
            height: 110,
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Icon(Icons.folder_open, size: 50, color: appGreen(0.5)),
                    Text(
                      "Downloads",
                      style: TextStyle(color: appWhite(1), fontSize: 16),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              ],
            ),
          ),
      ],
    );
  }
}
