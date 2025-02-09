import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zmtest/core/network/dioClient.dart';

final GetIt getIt = GetIt.instance;
Future<void> setupDependencies() async {
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  getIt.registerSingleton<DioClient>(DioClient());
}
