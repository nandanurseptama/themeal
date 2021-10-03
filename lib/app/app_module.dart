import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/utils/database.dart';
import '../core/utils/network_info.dart';
import '../core/widgets/navigation_screen.dart';
import '../core/widgets/splash_screen.dart';
import '../meal/meal.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
    MealModul(),
  ];
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => AppDb()),
    Bind.singleton<NetworkInfo>((i) => NetworkInfoImpl(i())),
    Bind.singleton((i) => Connectivity()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SplashScreen()),
    ChildRoute('/home', child: (context, args)=> NavigationScreen()),
  ];
}