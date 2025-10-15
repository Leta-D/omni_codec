import 'package:bloc/bloc.dart';
import 'package:omni_codec_player/data/logic/fetch_file_from_device.dart';
import 'package:omni_codec_player/logic/fetch_from_device/fetch_from_device_state.dart';

class MediaCubit extends Cubit<FetchFromDeviceState> {
  MediaCubit() : super(FetchFromDeviceState());

  Future<void> fetchAllMedia() async {
    emit(FetchFromDeviceState(loading: true));

    // await Permission.audio.request();
    // await Permission.videos.request();

    final songs = await FetchFileFromDevice.fetchAllAudio();
    final videos = await FetchFileFromDevice.fetchAllVideos();

    emit(FetchFromDeviceState(audios: songs, videos: videos, loading: false));
  }
}
