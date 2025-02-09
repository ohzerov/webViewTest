import 'package:shared_preferences/shared_preferences.dart';
import 'package:zmtest/core/di/di.dart';
import 'package:zmtest/core/network/dioClient.dart';
import 'package:zmtest/features/startup/domain/repository/device_data_repository.dart';

class StartupRepository {
  Future<void> fetchLink() async {
    String data = await DeviceDataRepository.loadDeviceData();

    try {
      final response = await getIt<DioClient>()
          .dio
          .get('/', queryParameters: {'data': data});

      await getIt<SharedPreferences>().setString('url',
          'https://${response.data['part1'] + response.data['part2']}'.trim());
    } catch (e) {
      throw Exception();
    }
  }
}
