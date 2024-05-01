import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movieapp/core/resources/app_router.dart';
import 'package:movieapp/core/resources/app_strings.dart';
import 'package:movieapp/core/resources/app_themes.dart';
import 'package:movieapp/core/services/service_locator.dart';
import 'package:movieapp/model/hive_movie_model.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveMovieModelAdapter());
  await Hive.openBox<HiveMovieModel>('movie_lists');
  ServiceLoctor.init();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init(),
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings().appTitle,
      theme: getApplicationTheme(),
      routerConfig: AppRouter().router,
    );
  }
}
