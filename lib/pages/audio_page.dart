import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_codec_player/constants/app_colors.dart';
import 'package:omni_codec_player/logic/fetch_from_device/fetch_from_device_cubit.dart';
import 'package:omni_codec_player/logic/fetch_from_device/fetch_from_device_state.dart';

class AudioPage extends StatelessWidget {
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
              "Audio",
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
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<FetchFromDeviceCubit>(context).fetchAllMedia();
              },
              child: Text("reload"),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
