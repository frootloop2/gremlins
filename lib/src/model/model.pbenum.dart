///
//  Generated code. Do not modify.
//  source: lib/src/model/model.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class SpotType extends $pb.ProtobufEnum {
  static const SpotType JAIL = const SpotType._(0, 'JAIL');
  static const SpotType INFERNO = const SpotType._(1, 'INFERNO');
  static const SpotType CASINO = const SpotType._(2, 'CASINO');
  static const SpotType COURT = const SpotType._(3, 'COURT');
  static const SpotType TREASURE = const SpotType._(4, 'TREASURE');
  static const SpotType ASTRAL_PLANE = const SpotType._(5, 'ASTRAL_PLANE');
  static const SpotType BANK = const SpotType._(6, 'BANK');
  static const SpotType OFFICE = const SpotType._(7, 'OFFICE');
  static const SpotType PLANT = const SpotType._(8, 'PLANT');
  static const SpotType DUMP = const SpotType._(9, 'DUMP');
  static const SpotType MARKETPLACE = const SpotType._(10, 'MARKETPLACE');
  static const SpotType INCOME = const SpotType._(11, 'INCOME');
  static const SpotType BRIBE = const SpotType._(12, 'BRIBE');
  static const SpotType RISK = const SpotType._(13, 'RISK');
  static const SpotType MISFORTUNE = const SpotType._(14, 'MISFORTUNE');
  static const SpotType TRIBUNE = const SpotType._(15, 'TRIBUNE');
  static const SpotType GAMBLE = const SpotType._(16, 'GAMBLE');
  static const SpotType POLICE = const SpotType._(17, 'POLICE');

  static const List<SpotType> values = const <SpotType> [
    JAIL,
    INFERNO,
    CASINO,
    COURT,
    TREASURE,
    ASTRAL_PLANE,
    BANK,
    OFFICE,
    PLANT,
    DUMP,
    MARKETPLACE,
    INCOME,
    BRIBE,
    RISK,
    MISFORTUNE,
    TRIBUNE,
    GAMBLE,
    POLICE,
  ];

  static final Map<int, SpotType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SpotType valueOf(int value) => _byValue[value];
  static void $checkItem(SpotType v) {
    if (v is! SpotType) $pb.checkItemFailed(v, 'SpotType');
  }

  const SpotType._(int v, String n) : super(v, n);
}

class Action_Type extends $pb.ProtobufEnum {
  static const Action_Type NONE = const Action_Type._(0, 'NONE');
  static const Action_Type MOVE = const Action_Type._(1, 'MOVE');
  static const Action_Type PLAY = const Action_Type._(2, 'PLAY');

  static const List<Action_Type> values = const <Action_Type> [
    NONE,
    MOVE,
    PLAY,
  ];

  static final Map<int, Action_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Action_Type valueOf(int value) => _byValue[value];
  static void $checkItem(Action_Type v) {
    if (v is! Action_Type) $pb.checkItemFailed(v, 'Action_Type');
  }

  const Action_Type._(int v, String n) : super(v, n);
}

