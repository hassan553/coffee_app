// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoffeeModelAdapter extends TypeAdapter<CoffeeModel> {
  @override
  final int typeId = 0;

  @override
  CoffeeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoffeeModel(
      title: fields[0] as String?,
      description: fields[1] as String?,
      ingredients: (fields[2] as List?)?.cast<String>(),
      image: fields[3] as String?,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CoffeeModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.ingredients)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoffeeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
