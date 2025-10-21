import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
                  "Videos",
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
                                  content: Text(
                                    'Wait video files are still loading!',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: appGreen(1),
                                    ),
                                  ),
                                  backgroundColor: appGreen(0.24),
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
                  width: 35,
                  decoration: BoxDecoration(
                    color: appGreen(1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Container(
                  height: 6,
                  width: 15,
                  decoration: BoxDecoration(
                    color: appGreen(0.7),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            BlocBuilder<FetchFromDeviceCubit, FetchFromDeviceState>(
              builder: (context, state) {
                if (state is FileFetchingInitial) {
                  BlocProvider.of<FetchFromDeviceCubit>(
                    context,
                  ).fetchAllMedia();
                  return Center(
                    child: Column(
                      spacing: 15,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(color: appGreen(1)),
                        ),
                        Text(
                          "Initial Fetching...",
                          style: TextStyle(color: appGreen(1), fontSize: 16),
                        ),
                      ],
                    ),
                  );
                } else if (state is FileFetchingLoading) {
                  return Center(
                    child: Column(
                      spacing: 15,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(color: appGreen(1)),
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Please Wait videos are being loaded!",
                              style: TextStyle(
                                color: appGreen(1),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (state is FileFetchingLoaded) {
                  if (state.videos.isEmpty) {
                    return Column(
                      spacing: 15,
                      children: [
                        Icon(
                          Icons.video_file_outlined,
                          color: appGrey(1),
                          size: 35,
                        ),
                        Text(
                          "No videos found!",
                          style: TextStyle(color: appGreen(1), fontSize: 16),
                        ),
                      ],
                    );
                  }
                  return SizedBox(
                    height: 660,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio:
                            1, // width/height ratio (1 means square)
                      ),
                      itemCount: state.videos.length,
                      itemBuilder: (context, index) {
                        final video = state.videos[index];
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 200),
                          columnCount: 3,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: FutureBuilder<Uint8List?>(
                                future: video.thumbnailDataWithSize(
                                  const ThumbnailSize(200, 200),
                                ),
                                builder: (context, snapshot) {
                                  return GestureDetector(
                                    onTap: () {
                                      // You can navigate to a player screen here
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Tapped on ${video.title}',
                                          ),
                                        ),
                                      );
                                    },
                                    child: (snapshot.hasData)
                                        ? Stack(
                                            children: [
                                              Positioned.fill(
                                                child: Image.memory(
                                                  snapshot.data!,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 5,
                                                right: 5,
                                                child: Icon(
                                                  Icons.play_circle_fill,
                                                  color: appGreen(1),
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Stack(
                                            children: [
                                              Positioned.fill(
                                                child: Image.asset(
                                                  "assets/image/omniCodec_logo.png",
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                        color: appWhite(0.6),
                                                      ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 5,
                                                right: 5,
                                                child: Icon(
                                                  Icons.play_circle_fill,
                                                  color: appWhite(1),
                                                  size: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      spacing: 20,
                      children: [
                        Text(
                          "Error: While loading video files!",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "What to do to fix this issues",
                          style: TextStyle(color: appGreen(1), fontSize: 15),
                        ),
                        Text(
                          "* Please check app permoission is enabled \n* Refreash the page \n* Exit and reopen the page",
                          style: TextStyle(color: appGreen(0.5), fontSize: 14),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
