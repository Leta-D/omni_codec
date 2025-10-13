import 'package:flutter/material.dart';
import 'package:omni_codec_player/constants/app_colors.dart';

Widget audioPlayerWidget() {
  return GestureDetector(
    onTap: () {
      print("Go to Player page");
    },
    child: Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              print("Play Back");
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(appGrey(0.5)),
            ),
            icon: Icon(
              Icons.navigate_before_rounded,
              color: appGreen(1),
              size: 30,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            radius: 20,
            onTap: () {
              print("Pause | Start");
            },
            child: Icon(
              Icons.play_circle_outline,
              color: appGreen(1),
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {
              print("Play forward");
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(appGrey(0.5)),
            ),
            icon: Icon(
              Icons.navigate_next_rounded,
              color: appGreen(1),
              size: 30,
            ),
          ),
        ],
      ),
    ),
  );
}
