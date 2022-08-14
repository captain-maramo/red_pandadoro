// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_button_pressed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LastButtonPressedAdapter extends TypeAdapter<LastButtonPressed> {
  @override
  final int typeId = 3;

  @override
  LastButtonPressed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LastButtonPressed(
      buttonName: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LastButtonPressed obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.buttonName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastButtonPressedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
