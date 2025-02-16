// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DictionaryModelAdapter extends TypeAdapter<DictionaryModel> {
  @override
  final int typeId = 0;

  @override
  DictionaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DictionaryModel(
      uzbek: fields[0] as String,
      english: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DictionaryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.uzbek)
      ..writeByte(1)
      ..write(obj.english);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DictionaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
