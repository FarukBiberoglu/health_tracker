// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_image_recognition_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodImageRecognitionModelAdapter
    extends TypeAdapter<FoodImageRecognitionModel> {
  @override
  final int typeId = 1;

  @override
  FoodImageRecognitionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodImageRecognitionModel(
      foodId: fields[0] as int?,
      foodName: fields[1] as String?,
      eaten: fields[2] as FoodEatenModel?,
      suggestedServing: fields[3] as FoodSuggestedServingModel?,
      food: fields[4] as FoodModel?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodImageRecognitionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.foodId)
      ..writeByte(1)
      ..write(obj.foodName)
      ..writeByte(2)
      ..write(obj.eaten)
      ..writeByte(3)
      ..write(obj.suggestedServing)
      ..writeByte(4)
      ..write(obj.food);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodImageRecognitionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
