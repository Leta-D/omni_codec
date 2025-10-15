import 'package:bloc/bloc.dart';
import 'package:omni_codec_player/logic/device_permission/device_permission_state.dart';
import 'package:permission_handler/permission_handler.dart';

class DevicePermissionCubit extends Cubit<DevicePermissionState> {
  DevicePermissionCubit() : super(PermissionInitial());

  Future<void> requestMediaPermission() async {
    try {
      // For Android 13+, request both audio and video access
      Map<Permission, PermissionStatus> statuses = await [
        Permission.videos,
        Permission.audio,
        // Permission.storage, // fallback for older devices
      ].request();

      // Handle logic
      if (statuses.values.every((status) => status.isGranted)) {
        emit(PermissionGranted());
      } else {
        emit(PermissionDenied());
      }
    } catch (e) {
      // emit(PermissionDenied());
      print("Error==================================");
      print(e);
      emit(PermissionDenied());
    }
  }

  Future<void> openAppSettings() async {
    try {
      // For Android 13+, request both audio and video access
      await openAppSettings();
      List<bool> statuses = [
        await Permission.audio.isGranted,
        await Permission.videos.isGranted,
      ];
      // Handle logic
      if (statuses[0] && statuses[1]) {
        emit(PermissionGranted());
      } else {
        emit(PermissionDenied());
      }
    } catch (e) {
      // emit(PermissionDenied());
      print("Error==================================");
      print(e);
    }
  }
}
