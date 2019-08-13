import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:health_stats/health_stats.dart';

void main() {
  const MethodChannel channel = MethodChannel('health_stats');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await HealthStats.platformVersion, '42');
  });
}
