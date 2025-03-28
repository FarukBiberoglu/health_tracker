// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_serving_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodServingModelAdapter extends TypeAdapter<FoodServingModel> {
  @override
  final int typeId = 8;

  @override
  FoodServingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodServingModel(
      id: fields[0] as String?,
      description: fields[1] as String?,
      url: fields[2] as String?,
      metricServingAmount: fields[3] as double?,
      metricServingUnit: fields[4] as String?,
      numberOfUnits: fields[5] as double?,
      measurementDescription: fields[6] as String?,
      calories: fields[7] as double?,
      carbohydrate: fields[8] as double?,
      protein: fields[9] as double?,
      fat: fields[10] as double?,
      saturatedFat: fields[11] as double?,
      polyunsaturatedFat: fields[12] as double?,
      monounsaturatedFat: fields[13] as double?,
      cholesterol: fields[14] as double?,
      sodium: fields[15] as double?,
      potassium: fields[16] as double?,
      fiber: fields[17] as double?,
      sugar: fields[18] as double?,
      addedSugars: fields[19] as double?,
      vitaminA: fields[20] as double?,
      vitaminC: fields[21] as double?,
      vitaminD: fields[22] as double?,
      calcium: fields[23] as double?,
      iron: fields[24] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodServingModel obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.metricServingAmount)
      ..writeByte(4)
      ..write(obj.metricServingUnit)
      ..writeByte(5)
      ..write(obj.numberOfUnits)
      ..writeByte(6)
      ..write(obj.measurementDescription)
      ..writeByte(7)
      ..write(obj.calories)
      ..writeByte(8)
      ..write(obj.carbohydrate)
      ..writeByte(9)
      ..write(obj.protein)
      ..writeByte(10)
      ..write(obj.fat)
      ..writeByte(11)
      ..write(obj.saturatedFat)
      ..writeByte(12)
      ..write(obj.polyunsaturatedFat)
      ..writeByte(13)
      ..write(obj.monounsaturatedFat)
      ..writeByte(14)
      ..write(obj.cholesterol)
      ..writeByte(15)
      ..write(obj.sodium)
      ..writeByte(16)
      ..write(obj.potassium)
      ..writeByte(17)
      ..write(obj.fiber)
      ..writeByte(18)
      ..write(obj.sugar)
      ..writeByte(19)
      ..write(obj.addedSugars)
      ..writeByte(20)
      ..write(obj.vitaminA)
      ..writeByte(21)
      ..write(obj.vitaminC)
      ..writeByte(22)
      ..write(obj.vitaminD)
      ..writeByte(23)
      ..write(obj.calcium)
      ..writeByte(24)
      ..write(obj.iron);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodServingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
