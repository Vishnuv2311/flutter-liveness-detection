# Flutter Liveness Detection Randomized Plugin

## Installation

**Option 1 — Git dependency**

```yaml
dependencies:
  flutter_liveness_detection_plugin:
    git:
      url: https://github.com/Vishnuv2311/flutter-liveness-detection.git
      ref: master
```

**Option 2 — Local path dependency**

```yaml
dependencies:
  flutter_liveness_detection_plugin:
    path: ../flutter-liveness-detection
```

### Android

Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.CAMERA"/>
```

### iOS

Add to `ios/Runner/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>Camera access required for liveness detection</string>
```

## Usage

```dart
final String? response = await FlutterLivenessDetectionPlugin.instance.livenessDetection(
  context: context,
  config: LivenessDetectionConfig(
    cameraResolution: ResolutionPreset.medium,
    imageQuality: 100,
    isEnableMaxBrightness: true,
    durationLivenessVerify: 60,
    showDurationUiText: false,
    startWithInfoScreen: true,
    isDarkMode: false,
    showCurrentStep: true,
    isEnableSnackBar: true,
    shuffleListWithSmileLast: true,
    useCustomizedLabel: false,
    customizedLabel: LivenessDetectionLabelModel(
      blink: '',
      lookDown: '',
      lookLeft: null,
      lookRight: 'Turn Right',
      lookUp: 'Look Up Please',
      smile: null,
    ),
    enableCooldownOnFailure: true,
    maxFailedAttempts: 3,
    cooldownMinutes: 10,
  ),
);
```

## Configuration Parameters

### Camera & Image Settings
- `cameraResolution`: Camera quality (ResolutionPreset.low/medium/high)
- `imageQuality`: Output image quality 0-100 (default: 100)
- `isEnableMaxBrightness`: Auto brightness adjustment (default: true)

### Detection Settings
- `durationLivenessVerify`: Detection timeout in seconds (default: 45)
- `showDurationUiText`: Show countdown timer (default: false)
- `startWithInfoScreen`: Show tutorial before detection (default: false)

### UI Settings
- `isDarkMode`: Dark theme mode (default: true)
- `showCurrentStep`: Show current step number (default: false)
- `isEnableSnackBar`: Show success/failure notifications (default: true)
- `shuffleListWithSmileLast`: Randomize challenges with smile at end (default: true)

### Customization
- `useCustomizedLabel`: Enable custom challenge labels (default: false)
- `customizedLabel`: Custom labels — empty string `''` skips challenge, `null` uses default

### Security Features
- `enableCooldownOnFailure`: Enable cooldown after failed attempts (default: true)
- `maxFailedAttempts`: Number of failures before cooldown (default: 3)
- `cooldownMinutes`: Cooldown duration in minutes (default: 10)

## Complete Example

```dart
import 'package:flutter_liveness_detection_plugin/index.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final result = await FlutterLivenessDetectionPlugin.instance.livenessDetection(
                context: context,
                config: LivenessDetectionConfig(
                  startWithInfoScreen: true,
                  isDarkMode: false,
                  showCurrentStep: true,
                  isEnableSnackBar: true,
                ),
              );

              if (result != null) {
                print('Face captured: $result');
              } else {
                print('Detection failed');
              }
            },
            child: Text('Start Liveness Detection'),
          ),
        ),
      ),
    );
  }
}
```
