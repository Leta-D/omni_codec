import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_codec_player/logic/video_to_audio_converter/convert_to_audio_state.dart';

class ConvertToAudioCubit extends Cubit<ConvertToAudioState> {
  ConvertToAudioCubit() : super(ConverterInitialState());
}
