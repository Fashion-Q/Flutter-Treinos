import 'package:bonfire/bonfire.dart';

class PersonagemSpritSheet {
  static get idleRight => SpriteAnimation.load(
        'personagem/fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 0),
        ),
      );
  static get runRight => SpriteAnimation.load(
        'personagem/fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 48),
        ),
      );
  static get dieRight => SpriteAnimation.load(
        'personagem/fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 120),
        ),
      );
  static get dieLeft => SpriteAnimation.load(
        'personagem/fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(72, 120),
        ),
      );

        static get reciveDamageRight => SpriteAnimation.load(
        'personagem/fHero_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(24, 24),
          texturePosition: Vector2(0, 96),
        ),
      );

}
