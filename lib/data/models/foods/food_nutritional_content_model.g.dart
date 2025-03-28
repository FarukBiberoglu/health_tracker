// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_nutritional_content_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodNutritionalContentModelAdapter
    extends TypeAdapter<FoodNutritionalContentModel> {
  @override
  final int typeId = 5;

  @override
  FoodNutritionalContentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodNutritionalContentModel(
      calories: fields[0] as double?,
      carbohydrate: fields[1] as double?,
      protein: fields[2] as double?,
      fat: fields[3] as double?,
      saturatedFat: fields[4] as double?,
      polyunsaturatedFat: fields[5] as double?,
      monounsaturatedFat: fields[6] as double?,
      cholesterol: fields[7] as double?,
      sodium: fields[8] as double?,
      potassium: fields[9] as double?,
      fiber: fields[10] as double?,
      sugar: fields[11] as double?,
      vitaminA: fields[12] as double?,
      vitaminC: fields[13] as double?,
      calcium: fields[14] as double?,
      iron: fields[15] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodNutritionalContentModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.calories)
      ..writeByte(1)
      ..write(obj.carbohydrate)
      ..writeByte(2)
      ..write(obj.protein)
      ..writeByte(3)
      ..write(obj.fat)
      ..writeByte(4)
      ..write(obj.saturatedFat)
      ..writeByte(5)
      ..write(obj.polyunsaturatedFat)
      ..writeByte(6)
      ..write(obj.monounsaturatedFat)
      ..writeByte(7)
      ..write(obj.cholesterol)
      ..writeByte(8)
      ..write(obj.sodium)
      ..writeByte(9)
      ..write(obj.potassium)
      ..writeByte(10)
      ..write(obj.fiber)
      ..writeByte(11)
      ..write(obj.sugar)
      ..writeByte(12)
      ..write(obj.vitaminA)
      ..writeByte(13)
      ..write(obj.vitaminC)
      ..writeByte(14)
      ..write(obj.calcium)
      ..writeByte(15)
      ..write(obj.iron);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodNutritionalContentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
