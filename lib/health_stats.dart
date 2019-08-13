import 'dart:async';

import 'package:flutter/services.dart';

class HealthStats {
  static const MethodChannel _channel =
      const MethodChannel('health_stats');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
