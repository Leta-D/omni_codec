import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_codec_player/constants/app_colors.dart';
import 'package:omni_codec_player/logic/folder_loading/fetch_folders_cubit.dart';
import 'package:omni_codec_player/logic/folder_loading/fetch_folders_state.dart';
import 'package:omni_codec_player/pages/widgets/audio_player_widget.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  bool boxStyleList = true;
  Set<String> folderStack = {};
  final String homeFolder = "/storage/emulated/0/";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => FetchFoldersCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width / 36.0,
          vertical: screenSize.height / 49,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: screenSize.width / 10.28,
                  backgroundColor: Colors.transparent,
                  child: Image.asset("assets/image/omniCodec_logo.png"),
                ),
                BlocBuilder<FetchFoldersCubit, FetchFoldersState>(
                  builder: (context, state) {
                    if (state is FetchFoldersLoaded) {
                      return Text(
                        state.currentFolder,
                        style: TextStyle(color: appGreen(1), fontSize: 16),
                      );
                    }
                    return Text(
                      "OmniCodec",
                      style: TextStyle(color: appGreen(1), fontSize: 16),
                    );
                  },
                ),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {
                    setState(() {
                      boxStyleList = !boxStyleList;
                    });
                  },
                  label: Text(
                    !boxStyleList ? "Grid" : "List",
                    style: TextStyle(color: appGreen(1)),
                  ),
                  icon: Icon(
                    !boxStyleList ? Icons.grid_view_rounded : Icons.list_sharp,
                    color: appWhite(1),
                  ),
                ),
              ],
            ),
            BlocBuilder<FetchFoldersCubit, FetchFoldersState>(
              builder: (context, state) => folderStack.isEmpty
                  ? SizedBox()
                  : IconButton(
                      onPressed: () async {
                        folderStack.remove(folderStack.last);

                        await BlocProvider.of<FetchFoldersCubit>(
                          context,
                          listen: false,
                        ).fetchFolders(
                          folderStack.isEmpty ? homeFolder : folderStack.last,
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: appGreen(0.8),
                      ),
                    ),
            ),
            // SizedBox(
            //   height: screenSize.height / 1.2,
            //   child: ListView(
            //     children: [folderContainerWidget(context), audioPlayerWidget()],
            //   ),
            // ),
            folderContainerWidget(context, boxStyleList),
            // audioPlayerWidget(),
          ],
        ),
      ),
    );
  }

  Widget folderContainerWidget(BuildContext context, bool boxStyleList) {
    Size screenSize = MediaQuery.sizeOf(context);
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
            height: 680,
            child: boxStyleList
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.folders.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<FetchFoldersCubit>(
                            context,
                            listen: false,
                          ).fetchFolders(state.folders[index]);
                          folderStack.add(state.folders[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(16),
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
                          // height: screenSize.height / 6.72,
                          // width: screenSize.width / 2.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [
                              Icon(
                                Icons.folder_open,
                                size: screenSize.width / 7.2,
                                color: appGreen(0.5),
                              ),
                              Text(
                                state.folders[index].split("/").last,
                                style: TextStyle(color: appWhite(1)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: state.folders.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          BlocProvider.of<FetchFoldersCubit>(
                            context,
                            listen: false,
                          ).fetchFolders(state.folders[index]);

                          folderStack.add(state.folders[index]);
                        },

                        contentPadding: EdgeInsets.only(bottom: 10),
                        splashColor: appGreen(0.2),
                        leading: Icon(
                          Icons.folder_open,
                          size: screenSize.width / 7.2,
                          color: appGreen(0.5),
                        ),
                        title: Text(
                          state.folders[index].split("/").last,
                          style: TextStyle(color: appWhite(1)),
                        ),
                        subtitle: Text(
                          state.folders[index],
                          style: TextStyle(color: appGrey(0.7)),
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
