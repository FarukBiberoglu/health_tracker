// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_allergen_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodAllergenModelAdapter extends TypeAdapter<FoodAllergenModel> {
  @override
  final int typeId = 2;

  @override
  FoodAllergenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodAllergenModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      value: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodAllergenModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodAllergenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
