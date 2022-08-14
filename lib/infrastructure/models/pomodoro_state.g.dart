// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PomodoroStateAdapter extends TypeAdapter<PomodoroState> {
  @override
  final int typeId = 2;

  @override
  PomodoroState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PomodoroState(
      todo: fields[0] as Todo,
      state: fields[1] as String,
      secondsLeft: fields[2] as int,
      running: fields[3] as bool,
      pomodoroCount: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PomodoroState obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.todo)
      ..writeByte(1)
      ..write(obj.state)
      ..writeByte(2)
      ..write(obj.secondsLeft)
      ..writeByte(3)
      ..write(obj.running)
      ..writeByte(4)
      ..write(obj.pomodoroCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PomodoroStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
