import 'dart:io';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:photo_manager/photo_manager.dart';

class FetchFileFromDevice {
  //for fetching audio
  static final OnAudioQuery _audioQuery = OnAudioQuery();

  static Future<List<SongModel>> fetchAllAudio() async {
    final List<SongModel> songs = await _audioQuery.querySongs(
      sortType: SongSortType.DATE_ADDED,
      orderType: OrderType.DESC_OR_GREATER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
    return songs;
  }

  //fetching video
  static Future<List<AssetEntity>> fetchAllVideos() async {
    final List<AssetPathEntity> videoAlbums =
        await PhotoManager.getAssetPathList(
          type: RequestType.video,
          filterOption: FilterOptionGroup(
            orders: [OrderOption(type: OrderOptionType.createDate, asc: false)],
          ),
        );

    final List<AssetEntity> allVideos = [];

    for (final album in videoAlbums) {
      final List<AssetEntity> videos = await album.getAssetListPaged(
        page: 0,
        size: 1000,
      );
      allVideos.addAll(videos);
    }

    return allVideos;
  }

  //fetching audio from folder
  static Future<List<SongModel>> fetchAllAudioFromFolder(
    String folderPath,
  ) async {
    final List<SongModel> songs = await _audioQuery.queryAudiosFrom(
      AudiosFromType.ALBUM,
      folderPath,
      sortType: SongSortType.DATE_ADDED,
      orderType: OrderType.DESC_OR_GREATER,
    );
    return songs;
  }

  //fetching video from folder
  static Future<List<AssetEntity>> fetchVideosFromFolder(
    String folderPath,
  ) async {
    // Request permission
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!ps.isAuth) return [];

    // Get assets directly from the folder
    final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.video,
      onlyAll: true, // only fetch the 'All Videos' path
      filterOption: FilterOptionGroup(
        containsPathModified: true, // filter by folder
        orders: [OrderOption(type: OrderOptionType.createDate, asc: false)],
      ),
    );

    if (albums.isEmpty) return [];

    // Fetch all assets from the filtered album
    final List<AssetEntity> assets = await albums[0].getAssetListPaged(
      page: 0,
      size: 1000,
    );

    return assets;
  }
}
