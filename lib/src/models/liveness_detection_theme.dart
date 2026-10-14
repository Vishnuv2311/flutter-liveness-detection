import 'package:flutter/material.dart';

/// Optional styling for the liveness detection screen so host apps can match
/// their own design. Every field is optional; anything left null falls back to
/// the default look driven by [LivenessDetectionConfig.isDarkMode].
class LivenessDetectionTheme {
  /// Background colour of the detection screen.
  final Color? backgroundColor;

  /// Widget shown in place of the default 'Back' text. Tapping it pops the
  /// screen, so it should not handle taps itself (e.g. use an [Icon]).
  final Widget? backButton;

  /// Colour used for all default texts (back, timer, step counter, status,
  /// challenge) when no specific text style overrides it.
  final Color? textColor;

  /// Style of the 'User Face Found' / 'User Face Not Found...' status text.
  final TextStyle? statusTextStyle;

  /// Style of the current challenge text (e.g. 'Blink 2-3 Times').
  final TextStyle? stepTextStyle;

  /// Text shown when a face is detected. Defaults to 'User Face Found'.
  final String? faceFoundText;

  /// Text shown when no face is detected. Defaults to 'User Face Not Found...'.
  final String? faceNotFoundText;

  const LivenessDetectionTheme({
    this.backgroundColor,
    this.backButton,
    this.textColor,
    this.statusTextStyle,
    this.stepTextStyle,
    this.faceFoundText,
    this.faceNotFoundText,
  });
}
