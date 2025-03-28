// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_eaten_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodEatenModelAdapter extends TypeAdapter<FoodEatenModel> {
  @override
  final int typeId = 4;

  @override
  FoodEatenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodEatenModel(
      singularDescription: fields[0] as String?,
      pluralDescription: fields[1] as String?,
      units: fields[2] as double?,
      metricDescription: fields[3] as String?,
      totalMetricAmount: fields[4] as double?,
      perUnitMetricAmount: fields[5] as double?,
      totalNutritionalContent: fields[6] as FoodNutritionalContentModel?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodEatenModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.singularDescription)
      ..writeByte(1)
      ..write(obj.pluralDescription)
      ..writeByte(2)
      ..write(obj.units)
      ..writeByte(3)
      ..write(obj.metricDescription)
      ..writeByte(4)
      ..write(obj.totalMetricAmount)
      ..writeByte(5)
      ..write(obj.perUnitMetricAmount)
      ..writeByte(6)
      ..write(obj.totalNutritionalContent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodEatenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
