import 'package:flutter_bloc/flutter_bloc.dart';
import 'news_bloc/news_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
      ];
}
