import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: screenSize.width / 10,
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
            height: screenSize.height / 1.142,
            child: ListView(
              children: [
                Text(
                  "Wellcome back!",
                  style: TextStyle(
                    fontSize: screenSize.width / 20,
                    color: appGreen(1),
                  ),
                ),
                Text(
                  "Your playlist awaits.",
                  style: TextStyle(
                    fontSize: screenSize.width / 22.5,
                    color: appWhite(0.7),
                  ),
                ),

                Text(
                  "Explore, play, and save favorite tracks",
                  style: TextStyle(
                    fontSize: screenSize.width / 25.7,
                    color: appGrey(1),
                  ),
                ),
                SizedBox(height: screenSize.height / 24.67),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Favorite",
                    style: TextStyle(
                      color: appWhite(1),
                      fontSize: screenSize.width / 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: appWhite(0.61),
                    size: screenSize.width / 14.4,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: screenSize.height / 4.933,
                    width: screenSize.width / 7.2,
                    color: appGreen(1),
                  ),
                ),

                SizedBox(height: screenSize.height / 24.67),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Most Played",
                    style: TextStyle(
                      color: appWhite(1),
                      fontSize: screenSize.width / 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: appWhite(0.61),
                    size: screenSize.width / 14.4,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: screenSize.height / 4.933,
                    width: screenSize.width / 7.2,
                    color: appGreen(1),
                  ),
                ),

                SizedBox(height: screenSize.height / 24.67),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Vedios",
                    style: TextStyle(
                      color: appWhite(1),
                      fontSize: screenSize.width / 120,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: appWhite(0.61),
                    size: screenSize.width / 14.4,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: screenSize.height / 4.933,
                    width: screenSize.width / 7.2,
                    color: appGreen(1),
                  ),
                ),

                SizedBox(height: screenSize.height / 24.67),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Audio",
                    style: TextStyle(
                      color: appWhite(1),
                      fontSize: screenSize.width / 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: appWhite(0.61),
                    size: screenSize.width / 14.4,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    height: screenSize.height / 4.933,
                    width: screenSize.width / 7.2,
                    color: appGreen(1),
                  ),
                ),
                SizedBox(height: screenSize.height / 9.25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
