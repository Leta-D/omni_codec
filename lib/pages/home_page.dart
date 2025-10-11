import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            height: 650,
            child: ListView(
              children: [
                Text(
                  "Wellcome back!",
                  style: TextStyle(fontSize: 18, color: appGreen(1)),
                ),
                Text(
                  "Your playlist awaits.",
                  style: TextStyle(fontSize: 16, color: appWhite(0.7)),
                ),

                Text(
                  "Explore, play, and save favorite tracks",
                  style: TextStyle(fontSize: 14, color: appGrey(1)),
                ),
                SizedBox(height: 30),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Favorite",
                    style: TextStyle(
                      color: appWhite(1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: appWhite(0.61),
                    size: 25,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(height: 150, width: 50, color: appGreen(1)),
                ),

                SizedBox(height: 30),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Most Played",
                    style: TextStyle(
                      color: appWhite(1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: appWhite(0.61),
                    size: 25,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(height: 150, width: 50, color: appGreen(1)),
                ),

                SizedBox(height: 30),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Vedios",
                    style: TextStyle(
                      color: appWhite(1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: appWhite(0.61),
                    size: 25,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(height: 150, width: 50, color: appGreen(1)),
                ),

                SizedBox(height: 30),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "Audio",
                    style: TextStyle(
                      color: appWhite(1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                    ),
                  ),
                  trailing: Icon(
                    Icons.navigate_next,
                    color: appWhite(0.61),
                    size: 25,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(height: 150, width: 50, color: appGreen(1)),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
