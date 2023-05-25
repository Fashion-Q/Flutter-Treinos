import 'package:bonfire/bonfire.dart';

class MyPlayerSpritSheet {
  static get attack => SpriteAnimation.load(
        'player/run/m_run.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(96, 80),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get die => SpriteAnimation.load(
        'player/die/m_die.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(80, 64),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get idleRight => SpriteAnimation.load(
        'player/idle/m_idleRight.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(80, 80),
          texturePosition: Vector2(0, 0),
        ),
      );
  static get idleLeft => SpriteAnimation.load(
        'player/idle/m_idleLeft.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2(80, 80),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get runUpJumpRight => SpriteAnimation.load(
        'player/jump/m_jump_upRight.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.4,
          textureSize: Vector2(80, 80),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get runUpJumpLeft => SpriteAnimation.load(
        'player/jump/m_jump_upLeft.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.4,
          textureSize: Vector2(80, 80),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get runDownJumpRight => SpriteAnimation.load(
        'player/jump/m_jump_downRight.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.4,
          textureSize: Vector2(80, 80),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get runDownJumpLeft => SpriteAnimation.load(
        'player/jump/m_jump_downLeft.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.4,
          textureSize: Vector2(80, 80),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get runRight => SpriteAnimation.load(
        'player/run/m_run.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(80, 80),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get runDownLeft => SpriteAnimation.load(
        'player/run/m_run_down_left.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(80, 80),
          texturePosition: Vector2(0, 0),
        ),
      );

  static get runDownRight => SpriteAnimation.load(
        'player/run/m_run_down_right.png',
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(80, 80),
          texturePosition: Vector2(0, 0),
        ),
      );

  static Future<Sprite> get buttonRight => Sprite.load(
        'player/run/m_run_right.png',
        srcPosition: Vector2(0, 0),
        srcSize: Vector2(64, 64),
      );

  static Future<Sprite> get buttonLeft => Sprite.load(
        'player/run/m_run_left.png',
        srcPosition: Vector2(0, 0),
        srcSize: Vector2(64, 64),
      );
}
