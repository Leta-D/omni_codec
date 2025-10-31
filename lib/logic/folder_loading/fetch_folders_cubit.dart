import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_codec_player/data/logic/fetch_all_folders.dart';
import 'package:omni_codec_player/logic/folder_loading/fetch_folders_state.dart';

class FetchFoldersCubit extends Cubit<FetchFoldersState> {
  FetchFoldersCubit() : super(FetchFoldersInitial());

  Future<void> fetchAllFolders() async {
    try {
      emit(FetchFoldersLoading());

      List<String> folders = await FetchAllFolders.fetchAllDeviceFolders();

      emit(FetchFoldersLoaded(folders: folders, currentFolder: "Internal"));
    } catch (e) {
      emit(FetchFoldersError(e.toString()));
    }
  }
}
