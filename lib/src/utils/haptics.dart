// Simple class wrapping HapticFeedback to make testing a bit simpler.

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';


enum ButtonHapticType { light, medium, heavy }


class AppHaptics {
  static bool debugSound = kDebugMode;
  static bool debugLog = kDebugMode;

  static void buttonPress([ButtonHapticType hapticType = ButtonHapticType.light]) {
    // Android/Fuchsia expect haptics on all button presses, iOS does not.
    if (defaultTargetPlatform != TargetPlatform.android ||
        defaultTargetPlatform != TargetPlatform.fuchsia) {
      switch (hapticType) {
        case ButtonHapticType.light:
          _lightImpact();
          break;
        case ButtonHapticType.medium:
          _mediumImpact();
          break;
        case ButtonHapticType.heavy:
          _heavyImpact();
          break;
      }
    }
  }

  static Future<void> _lightImpact() {
    _debug('lightImpact');
    return HapticFeedback.lightImpact();
  }

  static Future<void> _mediumImpact() {
    _debug('mediumImpact');
    return HapticFeedback.mediumImpact();
  }

  static Future<void> _heavyImpact() {
    _debug('heavyImpact');
    return HapticFeedback.heavyImpact();
  }

  static Future<void> selectionClick() {
    _debug('selectionClick');
    return HapticFeedback.selectionClick();
  }

  static Future<void> vibrate() {
    _debug('vibrate');
    return HapticFeedback.vibrate();
  }

  static void _debug(String label) {
    if (debugLog) debugPrint('Haptic.$label');
    if (debugSound) {
      SystemSound.play(SystemSoundType.alert); // only plays on desktop
      SystemSound.play(SystemSoundType.click); // only plays on mobile
    }
  }
}
