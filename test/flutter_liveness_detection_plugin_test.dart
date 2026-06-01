import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_liveness_detection_plugin/flutter_liveness_detection_plugin.dart';
import 'package:flutter_liveness_detection_plugin/flutter_liveness_detection_plugin_platform_interface.dart';
import 'package:flutter_liveness_detection_plugin/flutter_liveness_detection_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLivenessDetectionPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterLivenessDetectionPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLivenessDetectionPluginPlatform initialPlatform = FlutterLivenessDetectionPluginPlatform.instance;

  test('$MethodChannelFlutterLivenessDetectionPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLivenessDetectionPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterLivenessDetectionPlugin flutterLivenessDetectionRandomizedPlugin = FlutterLivenessDetectionPlugin.instance;
    MockFlutterLivenessDetectionPluginPlatform fakePlatform = MockFlutterLivenessDetectionPluginPlatform();
    FlutterLivenessDetectionPluginPlatform.instance = fakePlatform;

    expect(await flutterLivenessDetectionRandomizedPlugin.getPlatformVersion(), '42');
  });
}
