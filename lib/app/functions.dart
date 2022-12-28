import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_application_sample/domain/model/model.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = "Unknown";
  String identifier = "Unknown";
  String version = "Unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      // return android info
      var build = await deviceInfoPlugin.androidInfo;
      name = build.brand + " " + build.model;
      identifier = build.id;
      version = build.version.codename;
    } else if (Platform.isIOS) {
      // return ios info
      var build = await deviceInfoPlugin.iosInfo;
      name = "${build.name} ${build.model}";
      identifier = build.identifierForVendor!;
      version = build.systemVersion!;
    }
  } on PlatformException {
    // return default data
    return DeviceInfo(name, identifier, version);
  }
  return DeviceInfo(name, identifier, version);
}
