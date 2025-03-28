// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_search_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeSearchModelAdapter extends TypeAdapter<RecipeSearchModel> {
  @override
  final int typeId = 12;

  @override
  RecipeSearchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeSearchModel(
      recipes: (fields[1] as List).cast<RecipeModel>(),
      pageNumber: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeSearchModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pageNumber)
      ..writeByte(1)
      ..write(obj.recipes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeSearchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
