import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_codec_player/constants/app_colors.dart';
import 'package:omni_codec_player/logic/fetch_from_device/fetch_from_device_cubit.dart';
import 'package:omni_codec_player/logic/fetch_from_device/fetch_from_device_state.dart';
import 'package:photo_manager/photo_manager.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: appBlack(1), foregroundColor: appGrey(1)),
      backgroundColor: appBlack(1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Video",
                  style: TextStyle(
                    color: appWhite(1),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                BlocBuilder<FetchFromDeviceCubit, FetchFromDeviceState>(
                  builder: (context, state) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        (state is FileFetchingLoading)
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Wait video files are still loading!',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  backgroundColor: appGreen(0.3),
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.only(
                                    top: 20,
                                    left: 10,
                                    right: 10,
                                  ),
                                  dismissDirection: DismissDirection.up,
                                  duration: const Duration(seconds: 2),
                                ),
                              )
                            : BlocProvider.of<FetchFromDeviceCubit>(
                                context,
                              ).fetchAllMedia();
                      },
                      icon: (state is FileFetchingLoading)
                          ? SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(),
                            )
                          : Icon(Icons.refresh_sharp),
                      label: (state is FileFetchingLoading)
                          ? Text("reloading...")
                          : Text("reload"),
                    );
                  },
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}
