// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_suggested_serving_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodSuggestedServingModelAdapter
    extends TypeAdapter<FoodSuggestedServingModel> {
  @override
  final int typeId = 9;

  @override
  FoodSuggestedServingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodSuggestedServingModel(
      servingId: fields[0] as int?,
      servingDescription: fields[1] as String?,
      metricServingDescription: fields[2] as String?,
      metricMeasureAmount: fields[3] as double?,
      numberOfUnits: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodSuggestedServingModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.servingId)
      ..writeByte(1)
      ..write(obj.servingDescription)
      ..writeByte(2)
      ..write(obj.metricServingDescription)
      ..writeByte(3)
      ..write(obj.metricMeasureAmount)
      ..writeByte(4)
      ..write(obj.numberOfUnits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodSuggestedServingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
