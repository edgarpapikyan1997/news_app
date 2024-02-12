import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc_providers.dart';
import 'utils/go_router/go_router.dart';
import 'utils/themes/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(milliseconds: 200));
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'),],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    child: MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: const ForestVPNTestApp()),
  ));
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      color: AppColors.white,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'ForestVPN test',
      routerConfig: router,
    );
  }
}
