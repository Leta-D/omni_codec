import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_codec_player/constants/app_colors.dart';
import 'package:omni_codec_player/data/logic/fetch_all_folders.dart';
import 'package:omni_codec_player/logic/folder_loading/fetch_folders_cubit.dart';
import 'package:omni_codec_player/logic/folder_loading/fetch_folders_state.dart';

class ConvertToAudioPage extends StatefulWidget {
  const ConvertToAudioPage({super.key});

  @override
  State<StatefulWidget> createState() => _ConvertToAudioPageState();
}

class _ConvertToAudioPageState extends State<ConvertToAudioPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => FetchFoldersCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBlack(1),
          foregroundColor: appGrey(1),
        ),
        backgroundColor: appBlack(1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 20),
              Text(
                "Smart video to audio converter; choose any video",
                style: TextStyle(color: appWhite(0.6)),
              ),
              SizedBox(height: 30),
              Center(
                child: [
                  _initialFinderSelection(),
                  _listAllVideos(),
                  _browseFolder(screenSize),
                ][index],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _initialFinderSelection() {
    return Column(
      spacing: 30,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              index = 1;
            });
          },
          child: AnimatedContainer(
            width: 250,
            height: 45,
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: appBlack(1)),
              boxShadow: [
                BoxShadow(
                  color: appGreen(0.6),
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 1,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  appGreen(0.2),
                  const Color.fromARGB(155, 245, 250, 245),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "List All",
                    style: TextStyle(
                      color: appWhite(1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: appBlackL(0.4),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.list_alt_rounded, color: appWhite(1)),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              index = 2;
            });
          },
          child: AnimatedContainer(
            width: 250,
            height: 45,
            duration: Duration(milliseconds: 400),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: appBlack(1)),
              boxShadow: [
                BoxShadow(
                  color: appGreen(0.6),
                  blurStyle: BlurStyle.outer,
                  spreadRadius: 1,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  appBlack(0.6),
                  const Color.fromARGB(155, 131, 91, 128),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Browse Folder",
                    style: TextStyle(
                      color: appGreen(1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: appWhite(0.2),
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.list_alt_rounded, color: appGreen(1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _listAllVideos() {
    return Column();
  }

  Widget _browseFolder(Size screenSize) {
    return BlocBuilder<FetchFoldersCubit, FetchFoldersState>(
      builder: (context, state) {
        if (state is FetchFoldersInitial) {
          context.watch<FetchFoldersCubit>().fetchAllFolders();
          return Text(
            "Initializing ...",
            style: TextStyle(color: appWhite(1), fontSize: 18),
          );
        } else if (state is FetchFoldersLoading) {
          return Center(
            child: Column(
              spacing: 25,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(color: appGreen(1)),
                ),
                Text(
                  "Loading Folders ...",
                  style: TextStyle(color: appWhite(1), fontSize: 16),
                ),
              ],
            ),
          );
        } else if (state is FetchFoldersLoaded) {
          return SizedBox(
            height: 610,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: state.folders.length,
              itemBuilder: (context, index) {
                return Container(
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
                  // height: screenSize.height / 10.72,
                  // width: screenSize.width / 5.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Icon(
                        Icons.folder_open,
                        size: screenSize.width / 10.2,
                        color: appGreen(0.5),
                      ),
                      Text(
                        state.folders[index].split("/").last,
                        style: TextStyle(color: appWhite(1)),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Text("Error", style: TextStyle(color: appWhite(1)));
        }
      },
    );
  }
}
