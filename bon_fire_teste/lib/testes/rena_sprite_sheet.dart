import 'package:bonfire/bonfire.dart';

class RenaSpritSheet {
  static get idleRight => SpriteAnimation.load(
        'teste/dab2.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(28, 28),
          texturePosition: Vector2(0, 0),
        ),
      );
  static get runRight => SpriteAnimation.load(
        'teste/dab2.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(28, 28),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get dieRight => SpriteAnimation.load(
        'teste/dab2.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.3,
          textureSize: Vector2(28, 28),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get reciveDamageRight => SpriteAnimation.load(
        'teste/dab2.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.3,
          textureSize: Vector2(28, 28),
          texturePosition: Vector2(0, 0),
        ),
      );
  static get reciveDamageLeft => SpriteAnimation.load(
        'teste/dab2.png',
        SpriteAnimationData.variable(
          amount: 1,
          stepTimes: [0.3,0.3,0.3,0.3],
          textureSize: Vector2(28, 28),
          texturePosition: Vector2(0, 0),
        ),
      );
}
