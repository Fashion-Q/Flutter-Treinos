import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class LightingDecoration extends GameDecoration with Lighting {
  LightingDecoration(Vector2 position)
      : super(
          position: position,
          size: Vector2(24, 24),
        ) {
    setupLighting(
      LightingConfig(
          radius: 35,
          color: Colors.orange.withOpacity(0.3),
          blurBorder: 5,
          withPulse: true,
          pulseVariation: 0.1,
          pulseSpeed: 1.5,
          pulseCurve: Curves.decelerate),
    );
  }
}
