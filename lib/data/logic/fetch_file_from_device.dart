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
    // Assume permission already granted
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
}
