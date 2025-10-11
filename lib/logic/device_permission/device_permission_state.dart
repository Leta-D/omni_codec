import 'package:equatable/equatable.dart';

abstract class DevicePermissionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PermissionInitial extends DevicePermissionState {}

class PermissionGranted extends DevicePermissionState {}

class PermissionDenied extends DevicePermissionState {}

class PermissionPermanentlyDenied extends DevicePermissionState {}
