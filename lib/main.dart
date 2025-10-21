import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_codec_player/logic/device_permission/device_permission_cubit.dart';
import 'package:omni_codec_player/logic/fetch_from_device/fetch_from_device_cubit.dart';
import 'package:omni_codec_player/pages/main_page.dart';
import 'package:omni_codec_player/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DevicePermissionCubit()),
        BlocProvider(create: (context) => FetchFromDeviceCubit()),
      ],
      child: MaterialApp(
        title: 'Omni Codec',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 183, 85),
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: AppRoutes.generateRoute,
        home: MainPage(),
      ),
    );
  }
}
