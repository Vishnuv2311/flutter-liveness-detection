import 'package:camera/camera.dart';
import 'package:flutter_liveness_detection_plugin/src/models/liveness_detection_label_model.dart';
import 'package:flutter_liveness_detection_plugin/src/models/liveness_detection_theme.dart';

class LivenessDetectionConfig {
  final bool startWithInfoScreen;
  final int? durationLivenessVerify;
  final bool showDurationUiText;
  final bool useCustomizedLabel;
  final LivenessDetectionLabelModel? customizedLabel;
  final bool isEnableMaxBrightness;
  final int imageQuality;
  final ResolutionPreset cameraResolution;
  final bool enableCooldownOnFailure;
  final int maxFailedAttempts;
  final int cooldownMinutes;
  @Deprecated(
    'No longer used. The plugin does not show a SnackBar; show one from your '
    'app based on the result of livenessDetection().',
  )
  final bool isEnableSnackBar;
  final bool shuffleListWithSmileLast;
  final bool showCurrentStep;
  final bool isDarkMode;
  final LivenessDetectionTheme? theme;

  LivenessDetectionConfig({
    this.startWithInfoScreen = false,
    this.durationLivenessVerify = 45,
    this.showDurationUiText = false,
    this.useCustomizedLabel = false,
    this.customizedLabel,
    this.isEnableMaxBrightness = true,
    this.imageQuality = 100,
    this.cameraResolution = ResolutionPreset.high,
    this.enableCooldownOnFailure = true,
    this.maxFailedAttempts = 3,
    this.cooldownMinutes = 10,
    @Deprecated(
      'No longer used. The plugin does not show a SnackBar; show one from your '
      'app based on the result of livenessDetection().',
    )
    this.isEnableSnackBar = false,
    this.shuffleListWithSmileLast = true,
    this.showCurrentStep = false,
    this.isDarkMode = true,
    this.theme,
  }) : assert(
         !useCustomizedLabel || customizedLabel != null,
         'customizedLabel must not be null when useCustomizedLabel is true',
       );
}
