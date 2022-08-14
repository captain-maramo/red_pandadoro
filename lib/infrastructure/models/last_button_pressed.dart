import 'package:hive/hive.dart';

part 'last_button_pressed.g.dart';

@HiveType(typeId: 3)
class LastButtonPressed {
  LastButtonPressed({
    required this.buttonName,
  });
  @HiveField(0)
  String buttonName;
}
