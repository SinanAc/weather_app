import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weatherapp_starter_project/app/controller/home/home_binding.dart';
import 'package:weatherapp_starter_project/app/controller/routs/app_routs.dart';
import 'package:weatherapp_starter_project/app/controller/search/search_binding.dart';
import 'package:weatherapp_starter_project/app/controller/splash/splash_binding.dart';
import 'package:weatherapp_starter_project/app/view/screens/home_screen.dart';
import 'package:weatherapp_starter_project/app/view/screens/search_screen.dart';
import 'package:weatherapp_starter_project/app/view/screens/splash_screen.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.home,
        page: () =>  HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.search,
        page: () => const SearchScreen(),
        binding: SearchBinding()),
  ];
}
