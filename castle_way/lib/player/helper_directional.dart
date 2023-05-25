import 'package:bonfire/bonfire.dart';
import 'package:castle_way/player/player_sprite_sheet.dart';
import 'package:castle_way/share/widgets.dart';

mixin HelperDirectional<T extends SimplePlayer> on SimplePlayer {
  bool runningRight = false;
  bool runningLeft = false;
  bool jumping = false;
  int countJump = 0;

  bool test = true;
  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN) {
      runDirection(event);
      jumpDirection(event);
    } else if (event.event == ActionEvent.UP) {
      stopDirection(event);
      testeEvents(event);
    }
    super.joystickAction(event);
  }

  int count2 = 0;

  void jumpDirection(JoystickActionEvent event) {
    if ((event.id == 102 || event.id == 3) && floor && !jumping) {
      jumping = true;
      countJump = 0;
      falseFloor();
    }
  }

  void testeEvents(JoystickActionEvent event) {
    if (event.id == 1) {
      count = 0;
      canUpdate = true;
    } else if (event.id == 2) {
      animation?.runDownLeft = runDownJumpLeft;
      animation?.runDownRight = runDownJumpRight;
      animation?.runDown = runDownJumpRight;
      x = 14 * tiledSize;
      y = 0 * tiledSize;
      floor = false;
      canUpdate = false;
      canColision = true;
      jumping = false;
      count = 5;
      joystickChangeDirectional(
          JoystickDirectionalEvent(directional: JoystickMoveDirectional.IDLE));
    }
  }

  void stopDirection(JoystickActionEvent event) {
    if ((event.id == 11 || event.id == 97) && runningLeft && !runningRight) {
      animation?.runDown = floor ? runDownIdleLeft : runDownJumpLeft;
      if (jumping) {
        animation?.runUp = lastDirLeft() ? runUpJumpLeft : runUpJumpRight;
      }
      joystickChangeDirectional(JoystickDirectionalEvent(
          directional: !jumping
              ? JoystickMoveDirectional.MOVE_DOWN
              : JoystickMoveDirectional.MOVE_UP));
      runningLeft = false;
    } else if ((event.id == 12 || event.id == 100) &&
        runningRight &&
        runningLeft == false) {
      animation?.runDown = floor ? runDownIdleRight : runDownJumpRight;
      if (jumping) {
        animation?.runUp = lastDirLeft() ? runUpJumpLeft : runUpJumpRight;
      }
      joystickChangeDirectional(JoystickDirectionalEvent(
          directional: !jumping
              ? JoystickMoveDirectional.MOVE_DOWN
              : JoystickMoveDirectional.MOVE_UP));
      runningRight = false;
    }
  }

  void runDirection(JoystickActionEvent event) {
    if ((event.id == 11 || event.id == 97) && !runningRight && !runningLeft) {
      joystickChangeDirectional(!jumping
          ? JoystickDirectionalEvent(
              directional: JoystickMoveDirectional.MOVE_DOWN_LEFT)
          : JoystickDirectionalEvent(
              directional: JoystickMoveDirectional.MOVE_UP_LEFT));
      runningLeft = true;
    } else if ((event.id == 12 || event.id == 100) &&
        !runningLeft &&
        !runningRight) {
      joystickChangeDirectional(!jumping
          ? JoystickDirectionalEvent(
              directional: JoystickMoveDirectional.MOVE_DOWN_RIGHT)
          : JoystickDirectionalEvent(
              directional: JoystickMoveDirectional.MOVE_UP_RIGHT));
      runningRight = true;
    }
  }

  Future<void> awaitChangingDirection(String? texto) async {
    isIdle = false;
    joystickChangeDirectional(
        JoystickDirectionalEvent(directional: JoystickMoveDirectional.IDLE));
    for (int k = 0; !isIdle && k < 20; k++) {
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  void falseFloor() async {
    floor = false;
    canColision = false;
    fixSprites();
    if (jumping) {
      await jumpingTrue();
    } else {
      await jumpingFalse();
    }
    canColision = true;
  }

  void fixSprites() {
    animation?.runDownLeft = runDownJumpLeft;
    animation?.runDownRight = runDownJumpRight;
    animation?.runDown = lastDirLeft() ? runDownJumpLeft : runDownJumpRight;
    animation?.runUp = lastDirLeft() ? runUpJumpLeft : runUpJumpRight;
  }

  Future<void> jumpingFalse() async {
    await awaitChangingDirection("falseFloorIdle1");
    if (runningRight == false && runningLeft == false) {
      joystickChangeDirectional(JoystickDirectionalEvent(
          directional: JoystickMoveDirectional.MOVE_DOWN));
    } else if (runningLeft) {
      joystickChangeDirectional(JoystickDirectionalEvent(
          directional: JoystickMoveDirectional.MOVE_DOWN_LEFT));
    } else if (runningRight) {
      joystickChangeDirectional(JoystickDirectionalEvent(
          directional: JoystickMoveDirectional.MOVE_DOWN_RIGHT));
    }
  }

  Future<void> jumpingTrue() async {
    if (runningRight == false && runningLeft == false) {
      joystickChangeDirectional(JoystickDirectionalEvent(
          directional: JoystickMoveDirectional.MOVE_UP));
    } else {
      if (runningLeft) {
        joystickChangeDirectional(JoystickDirectionalEvent(
            directional: JoystickMoveDirectional.MOVE_UP_LEFT));
      } else if (runningRight) {
        joystickChangeDirectional(JoystickDirectionalEvent(
            directional: JoystickMoveDirectional.MOVE_UP_RIGHT));
      }
    }
  }

  void trueFloor() async {
    animation?.runDownLeft = runDownLeft;
    animation?.runDownRight = runDownRight;
    await awaitChangingDirection("trueFloorIdle1 ");
    animation?.runDown = lastDirLeft() ? runDownIdleLeft : runDownIdleRight;
    if (runningRight == false && runningLeft == false) {
      joystickChangeDirectional(JoystickDirectionalEvent(
          directional: JoystickMoveDirectional.MOVE_DOWN));
    } else if (runningLeft) {
      joystickChangeDirectional(JoystickDirectionalEvent(
          directional: JoystickMoveDirectional.MOVE_DOWN_LEFT));
    } else {
      joystickChangeDirectional(JoystickDirectionalEvent(
          directional: JoystickMoveDirectional.MOVE_DOWN_RIGHT));
    }

    floor = true;
    canUpdate = true;
  }

  bool lastDirLeft() {
    if (lastDirectionHorizontal == Direction.left ||
        lastDirectionHorizontal == Direction.upLeft ||
        lastDirectionHorizontal == Direction.downLeft) {
      return true;
    }
    return false;
  }

  int count = 0;
  bool canUpdate = true;
  bool floor = false;
  bool canColision = true;

  late final SpriteAnimation? runDownLeft;
  late final SpriteAnimation? runDownRight;

  late final SpriteAnimation? runDownJumpLeft;
  late final SpriteAnimation? runDownJumpRight;

  late final SpriteAnimation? runUpJumpLeft;
  late final SpriteAnimation? runUpJumpRight;

  late final SpriteAnimation? runDownIdleLeft;
  late final SpriteAnimation? runDownIdleRight;

  @override
  Future<void> onLoad() async {
    runDownLeft = await MyPlayerSpritSheet.runDownLeft;
    runDownRight = await MyPlayerSpritSheet.runDownRight;

    runDownJumpLeft = await MyPlayerSpritSheet.runDownJumpLeft;
    runDownJumpRight = await MyPlayerSpritSheet.runDownJumpRight;

    runUpJumpLeft = await MyPlayerSpritSheet.runUpJumpLeft;
    runUpJumpRight = await MyPlayerSpritSheet.runUpJumpRight;

    runDownIdleLeft = await MyPlayerSpritSheet.idleLeft;
    runDownIdleRight = await MyPlayerSpritSheet.idleRight;

    animation?.runDownLeft = runDownJumpLeft;
    animation?.runDownRight = runDownJumpRight;

    // Vector2 mapTiled = gameRef.map.size;

    return super.onLoad();
  }
}
