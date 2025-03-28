// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodModelAdapter extends TypeAdapter<FoodModel> {
  @override
  final int typeId = 0;

  @override
  FoodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodModel(
      subCategories: (fields[4] as List).cast<String>(),
      allergens: (fields[6] as List).cast<FoodAllergenModel>(),
      preferences: (fields[7] as List).cast<FoodPreferenceModel>(),
      servings: (fields[8] as List).cast<FoodServingModel>(),
      id: fields[0] as String?,
      name: fields[1] as String?,
      brandName: fields[2] as String?,
      type: fields[3] as String?,
      url: fields[5] as String?,
      imageUrl: fields[9] as String?,
      amount: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FoodModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.brandName)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.subCategories)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.allergens)
      ..writeByte(7)
      ..write(obj.preferences)
      ..writeByte(8)
      ..write(obj.servings)
      ..writeByte(9)
      ..write(obj.imageUrl)
      ..writeByte(10)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
