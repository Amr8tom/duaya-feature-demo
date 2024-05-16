import 'package:duaya_app/app/app.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/settings/presentation/controller/translation_cubit.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DDeviceUtils.setStatusBarColor(ColorRes.transparent);
  DDeviceUtils.initCacheHelper();
  DDeviceUtils.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await PrefService.init();
  final TranslationCubit translationCubit = TranslationCubit();
  String? storedLang = PrefService.getString(key: CacheKeys.lang) == ''
      ? "ar"
      : PrefService.getString(key: CacheKeys.lang);
  await translationCubit.setCurrentLangeuage(language: storedLang!);
  runApp(
    BlocProvider(
      create: (context) => translationCubit,
      child: DuayaApp(),
    ),
  );
  // runApp(
  //   BlocProvider<TranslationCubit>(
  //     create: (context) => myCubit,
  //     child: DuayaApp(),
  //   ),
  // );
}
