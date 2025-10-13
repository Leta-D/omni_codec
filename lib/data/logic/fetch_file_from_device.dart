// import 'dart:io';

// import 'package:on_audio_query/on_audio_query.dart';

// class FetchFileFromDevice {
//   //for fetching audio
//   static final OnAudioQuery _audioQuery = OnAudioQuery();

//   static Future<List<SongModel>> fetchAllAudio() async {
//     final List<SongModel> songs = await _audioQuery.querySongs(
//       sortType: SongSortType.DATE_ADDED,
//       orderType: OrderType.DESC_OR_GREATER,
//       uriType: UriType.EXTERNAL,
//       ignoreCase: true,
//     );
//     return songs;
//   }

//   //fetching video
//   static Future<List<FileSystemEntity>> fetchAllVideos() async {
//     final List<FileSystemEntity> videoFiles = [];

//     // Start from external storage
//     final dir = Directory('/storage/emulated/0/'); // Android main storage

//     await for (var entity in dir.list(recursive: true, followLinks: false)) {
//       if (entity is File && _isVideoFile(entity.path)) {
//         videoFiles.add(entity);
//       }
//     }

//     return videoFiles;
//   }

//   static bool _isVideoFile(String path) {
//     final extensions = [
//       '.mp4',
//       '.mkv',
//       '.avi',
//       '.mov',
//       '.flv',
//       '.webm',
//       '.wmv',
//       '.3gp',
//       '.ts',
//       '.m4v',
//       '.mpeg',
//       '.mpg',
//       '.ovg',
//     ];
//     return extensions.any((ext) => path.toLowerCase().endsWith(ext));
//   }
// }
