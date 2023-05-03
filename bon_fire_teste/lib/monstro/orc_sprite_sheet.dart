import 'package:bonfire/bonfire.dart';

class OrcSpritSheet {
  static get idleRight => SpriteAnimation.load(
        'monstros/orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 0),
        ),
      );
  static get runRight => SpriteAnimation.load(
        'monstros/orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32),
        ),
      );

  static get dieRight => SpriteAnimation.load(
        'monstros/orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.3,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 224),
        ),
      );

  static get reciveDamageRight => SpriteAnimation.load(
        'monstros/orc_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.3,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 192),
        ),
      );
  static get reciveDamageLeft => SpriteAnimation.load(
        'monstros/orc_.png',
        SpriteAnimationData.variable(
          amount: 4,
          stepTimes: [0.3,0.3,0.3,0.3],
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 192),
        ),
      );
}
