import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_liveness_detection_plugin_method_channel.dart';

abstract class FlutterLivenessDetectionPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterLivenessDetectionPluginPlatform.
  FlutterLivenessDetectionPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLivenessDetectionPluginPlatform _instance = MethodChannelFlutterLivenessDetectionPlugin();

  /// The default instance of [FlutterLivenessDetectionPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLivenessDetectionPlugin].
  static FlutterLivenessDetectionPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLivenessDetectionPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterLivenessDetectionPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
