//Property 분리
import 'package:flutter_ttoss/class/advanced/object_oriented_programming/solid/1_srp/player_game_property.dart';
import 'package:flutter_ttoss/class/advanced/object_oriented_programming/solid/1_srp/player_profile.dart';

class GamePlayer {
  GamePlayer(this.playerProfile, {required this.gameProperty});

  PlayerProfile playerProfile;
  PlayerGameProperty gameProperty;
}
