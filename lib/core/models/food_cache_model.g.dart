// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodCacheModelAdapter extends TypeAdapter<FoodCacheModel> {
  @override
  final int typeId = 14;

  @override
  FoodCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodCacheModel(
      date: fields[0] as DateTime,
      foodEntries: (fields[1] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as PlannedMealsEnum, (v as List).cast<FoodModel>())),
    );
  }

  @override
  void write(BinaryWriter writer, FoodCacheModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.foodEntries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
