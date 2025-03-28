// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_nutrition_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeNutritionModelAdapter extends TypeAdapter<RecipeNutritionModel> {
  @override
  final int typeId = 11;

  @override
  RecipeNutritionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeNutritionModel(
      calories: fields[0] as int?,
      carbohydrates: fields[1] as double?,
      fat: fields[2] as double?,
      protein: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeNutritionModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.calories)
      ..writeByte(1)
      ..write(obj.carbohydrates)
      ..writeByte(2)
      ..write(obj.fat)
      ..writeByte(3)
      ..write(obj.protein);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeNutritionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
