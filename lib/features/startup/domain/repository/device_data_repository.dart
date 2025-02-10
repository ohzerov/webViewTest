import 'dart:convert';

import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:uuid/uuid.dart';

class DeviceDataRepository {
  Map<String, String?> _deviceData = {};
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  final Battery _battery = Battery();
  Future<String> loadDeviceData() async {
    final IosDeviceInfo iosInfo;
    String deviceInfo = '';
    int? batteryLevel;
    BatteryState? batteryStatus;
    String? timeZone;
    String? osVersion;
    String? devModel;

    final String uid = Uuid().v4();
    try {
      iosInfo = await _deviceInfoPlugin.iosInfo;
      osVersion = iosInfo.systemVersion;
      devModel = iosInfo.modelName.replaceAll(' ', '');
    } catch (e) {
      osVersion = '';
      devModel = '';
    }
    try {
      batteryLevel = await _battery.batteryLevel;
    } catch (e) {
      batteryLevel = null;
    }
    try {
      batteryStatus = await _battery.onBatteryStateChanged.first;
    } catch (e) {
      batteryStatus = null;
    }
    try {
      timeZone = await FlutterNativeTimezone.getLocalTimezone();
    } catch (e) {
      timeZone = '';
    }

    _deviceData = {
      'uid': uid,
      'osVersion': osVersion,
      'devModel': devModel,
      'battery_level': batteryLevel != null ? batteryLevel.toString() : '',
      'battery_status': batteryStatus != null ? batteryStatus.toString() : '',
      'tz': timeZone,
    };

    deviceInfo =
        _deviceData.entries.map((e) => '${e.key}=${e.value}').join('&');

    final base64Info = base64.encode(utf8.encode(deviceInfo));

    return base64Info;
  }
}
