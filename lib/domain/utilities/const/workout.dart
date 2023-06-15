
import 'package:freezed_annotation/freezed_annotation.dart';

import 'body.dart';

part 'generated/workout.freezed.dart';
part 'generated/workout.g.dart';

class ConstWorkoutMenu {
  static String benchPressName = "ベンチプレス";
  static int benchPressId = 101;
  static String chestPressName = "チェストプレス";
  static int chestPressId = 102;
  static String dumbbellFlyName = "ダンベルフライ";
  static int dumbbellFlyId = 103;

  static String latPullDownName = "ラットプルダウン";
  static int latPullDownId = 201;
  static String deadLiftName = "デッドリフト";
  static int deadLiftId = 202;
  static String chinningName = "チンニング";
  static int chinningId = 203;

  static String sideRaiseName = "サイドレイズ";
  static int sideRaiseId = 301;
  static String shoulderPressName = "ショルダープレス";
  static int shoulderPressId = 302;
  static String frontRaiseName = "フロントレイズ";
  static int frontRaiseId = 303;

  static String armCurlName = "アームカール";
  static int armCurlId = 401;

  static String squatName = "スクワット";
  static int squatId = 501;
  static String legPressName = "レッグプレス";
  static int legPressId = 502;
  static String legExtensionName = "レッグエクステンション";
  static int legExtensionId = 503;

  static String crunchName = "クランチ";
  static int crunchId = 601;

  static String hipLiftName = "ヒップリフト";
  static int hipLiftId = 701;


  List<WorkoutMenuByPartOfBody> workoutMenuByPartOfBodyList = [
    WorkoutMenuByPartOfBody(
      partOfBodyId: PartOfBody.chestId,
      partOfBodyName: PartOfBody.chestName,
      workoutMenuMap: {
        ConstWorkoutMenu.benchPressId: ConstWorkoutMenu.benchPressName,
        ConstWorkoutMenu.chestPressId: ConstWorkoutMenu.chestPressName,
        ConstWorkoutMenu.dumbbellFlyId: ConstWorkoutMenu.dumbbellFlyName,
      },
    ),
    WorkoutMenuByPartOfBody(
      partOfBodyId: PartOfBody.backId,
      partOfBodyName: PartOfBody.backName,
      workoutMenuMap: {
        ConstWorkoutMenu.latPullDownId: ConstWorkoutMenu.latPullDownName,
        ConstWorkoutMenu.deadLiftId: ConstWorkoutMenu.deadLiftName,
        ConstWorkoutMenu.chinningId: ConstWorkoutMenu.chinningName,
      },
    ),
    WorkoutMenuByPartOfBody(
      partOfBodyId: PartOfBody.shoulderId,
      partOfBodyName: PartOfBody.shoulderName,
      workoutMenuMap: {
        ConstWorkoutMenu.sideRaiseId: ConstWorkoutMenu.sideRaiseName,
        ConstWorkoutMenu.shoulderPressId: ConstWorkoutMenu.shoulderPressName,
        ConstWorkoutMenu.frontRaiseId: ConstWorkoutMenu.frontRaiseName,
      },
    ),
    WorkoutMenuByPartOfBody(
      partOfBodyId: PartOfBody.armId,
      partOfBodyName: PartOfBody.armName,
      workoutMenuMap: {
        ConstWorkoutMenu.armCurlId: ConstWorkoutMenu.armCurlName,
      },
    ),
    WorkoutMenuByPartOfBody(
      partOfBodyId: PartOfBody.legId,
      partOfBodyName: PartOfBody.legName,
      workoutMenuMap: {
        ConstWorkoutMenu.squatId: ConstWorkoutMenu.squatName,
        ConstWorkoutMenu.legPressId: ConstWorkoutMenu.legPressName,
        ConstWorkoutMenu.legExtensionId: ConstWorkoutMenu.legExtensionName
      },
    ),
    WorkoutMenuByPartOfBody(
      partOfBodyId: PartOfBody.abdominalId,
      partOfBodyName: PartOfBody.abdominalName,
      workoutMenuMap: {
        ConstWorkoutMenu.crunchId: ConstWorkoutMenu.crunchName,
      },
    ),
    WorkoutMenuByPartOfBody(
      partOfBodyId: PartOfBody.hipId,
      partOfBodyName: PartOfBody.hipName,
      workoutMenuMap: {
        ConstWorkoutMenu.hipLiftId: ConstWorkoutMenu.hipLiftName,
      },
    ),
  ];


  Map<int, String> workoutMenuInfoMap = {
    ConstWorkoutMenu.benchPressId: ConstWorkoutMenu.benchPressName,
    ConstWorkoutMenu.chestPressId: ConstWorkoutMenu.chestPressName,
    ConstWorkoutMenu.dumbbellFlyId: ConstWorkoutMenu.dumbbellFlyName,

    ConstWorkoutMenu.latPullDownId: ConstWorkoutMenu.latPullDownName,
    ConstWorkoutMenu.deadLiftId: ConstWorkoutMenu.deadLiftName,
    ConstWorkoutMenu.chinningId: ConstWorkoutMenu.chinningName,

    ConstWorkoutMenu.sideRaiseId: ConstWorkoutMenu.sideRaiseName,
    ConstWorkoutMenu.shoulderPressId: ConstWorkoutMenu.shoulderPressName,
    ConstWorkoutMenu.frontRaiseId: ConstWorkoutMenu.frontRaiseName,

    ConstWorkoutMenu.armCurlId: ConstWorkoutMenu.armCurlName,

    ConstWorkoutMenu.squatId: ConstWorkoutMenu.squatName,
    ConstWorkoutMenu.legPressId: ConstWorkoutMenu.legPressName,
    ConstWorkoutMenu.legExtensionId: ConstWorkoutMenu.legExtensionName,

    ConstWorkoutMenu.crunchId: ConstWorkoutMenu.crunchName,

    ConstWorkoutMenu.hipLiftId: ConstWorkoutMenu.hipLiftName,
  };
}

@freezed
class WorkoutMenuByPartOfBody with _$WorkoutMenuByPartOfBody {
  const factory WorkoutMenuByPartOfBody({
    required int partOfBodyId,
    required String partOfBodyName,
    required Map<int, String> workoutMenuMap,
  }) = _WorkoutMenuByPartOfBody;

  factory WorkoutMenuByPartOfBody.fromJson(Map<String, dynamic> json) => _$WorkoutMenuByPartOfBodyFromJson(json);
}