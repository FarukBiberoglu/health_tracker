// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_search_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodSearchModelAdapter extends TypeAdapter<FoodSearchModel> {
  @override
  final int typeId = 7;

  @override
  FoodSearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodSearchModel(
      foods: (fields[1] as List).cast<FoodModel>(),
      pageNumber: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodSearchModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pageNumber)
      ..writeByte(1)
      ..write(obj.foods);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodSearchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
