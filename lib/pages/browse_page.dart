import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';
import 'package:omni_codec_player/pages/widgets/audio_player_widget.dart';

class BrowsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width / 36.0,
        vertical: screenSize.height / 49,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: screenSize.width / 10.28,
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
            height: screenSize.height / 1.2,
            child: ListView(
              children: [folderContainerWidget(context), audioPlayerWidget()],
            ),
          ),
        ],
      ),
    );
  }

  Widget folderContainerWidget(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
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
            height: screenSize.height / 6.72,
            width: screenSize.width / 2.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Icon(
                      Icons.folder_open,
                      size: screenSize.width / 7.2,
                      color: appGreen(0.5),
                    ),
                    Text(
                      "Downloads",
                      style: TextStyle(
                        color: appWhite(1),
                        fontSize: screenSize.width / 22.5,
                      ),
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
