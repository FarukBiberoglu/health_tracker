// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_preference_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodPreferenceModelAdapter extends TypeAdapter<FoodPreferenceModel> {
  @override
  final int typeId = 6;

  @override
  FoodPreferenceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodPreferenceModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      value: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodPreferenceModel obj) {
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
      other is FoodPreferenceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
