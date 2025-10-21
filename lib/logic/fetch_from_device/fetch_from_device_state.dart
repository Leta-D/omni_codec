import 'dart:io';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class FetchFromDeviceState {}

class FileFetchingInitial extends FetchFromDeviceState {}

class FileFetchingLoading extends FetchFromDeviceState {}

class FileFetchingLoaded extends FetchFromDeviceState {
  final List<SongModel> audios;
  final List<AssetEntity> videos;

  FileFetchingLoaded({this.audios = const [], this.videos = const []});
}

class FileFetchingError extends FetchFromDeviceState {
  final String message;
  FileFetchingError(this.message);
}
