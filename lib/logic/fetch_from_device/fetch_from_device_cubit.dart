import 'package:bloc/bloc.dart';
import 'package:omni_codec_player/data/logic/fetch_file_from_device.dart';
import 'package:omni_codec_player/logic/fetch_from_device/fetch_from_device_state.dart';

class FetchFromDeviceCubit extends Cubit<FetchFromDeviceState> {
  FetchFromDeviceCubit() : super(FileFetchingInitial());

  Future<void> fetchAllMedia() async {
    try {
      emit(FileFetchingLoading());

      // await Permission.audio.request();
      // await Permission.videos.request();

      final songs = await FetchFileFromDevice.fetchAllAudio();
      final videos = await FetchFileFromDevice.fetchAllVideos();

      emit(FileFetchingLoaded(audios: songs, videos: videos));
    } catch (e) {
      emit(FileFetchingError(e.toString()));
    }
  }
}
