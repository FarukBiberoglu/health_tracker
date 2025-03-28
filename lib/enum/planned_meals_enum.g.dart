// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planned_meals_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlannedMealsEnumAdapter extends TypeAdapter<PlannedMealsEnum> {
  @override
  final int typeId = 13;

  @override
  PlannedMealsEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PlannedMealsEnum.breakfast;
      case 1:
        return PlannedMealsEnum.lunch;
      case 2:
        return PlannedMealsEnum.dinner;
      case 3:
        return PlannedMealsEnum.snacks;
      default:
        return PlannedMealsEnum.breakfast;
    }
  }

  @override
  void write(BinaryWriter writer, PlannedMealsEnum obj) {
    switch (obj) {
      case PlannedMealsEnum.breakfast:
        writer.writeByte(0);
        break;
      case PlannedMealsEnum.lunch:
        writer.writeByte(1);
        break;
      case PlannedMealsEnum.dinner:
        writer.writeByte(2);
        break;
      case PlannedMealsEnum.snacks:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlannedMealsEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
