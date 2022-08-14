import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:red_pandadoro/infrastructure/models/last_button_pressed.dart';

class MainButtonRow extends StatefulWidget {
  const MainButtonRow({
    Key? key,
    required this.lastButtonPressedBox,
    required this.notifyParent,
    required this.backgroundColor,
    required this.timerIsRunning,
  }) : super(key: key);

  final Box lastButtonPressedBox;
  final Function() notifyParent;
  final Color backgroundColor;
  final bool timerIsRunning;

  @override
  State<MainButtonRow> createState() => _MainButtonRowState();
}

class _MainButtonRowState extends State<MainButtonRow> {
  @override
  Widget build(BuildContext context) {
    return !widget.timerIsRunning
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  widget.lastButtonPressedBox.put("lastButtonPressed",
                      LastButtonPressed(buttonName: "start_pause"));
                  widget.notifyParent();
                },
                tooltip: 'Play',
                backgroundColor: widget.backgroundColor,
                child: const Icon(
                  Icons.play_arrow,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(left: 80, right: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "Rewind",
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Are you sure you want to reset?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              widget.lastButtonPressedBox.put(
                                  "lastButtonPressed",
                                  LastButtonPressed(buttonName: "rewind"));
                              Navigator.pop(context, 'Yes');

                              widget.notifyParent();
                            },
                            child: Text(
                              'Yes',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontSize: 20),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'No');
                            },
                            child: Text(
                              'No',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  tooltip: 'Rewind',
                  backgroundColor: widget.backgroundColor,
                  child: const Icon(
                    Icons.replay,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  heroTag: "Pause",
                  onPressed: () {
                    widget.lastButtonPressedBox.put("lastButtonPressed",
                        LastButtonPressed(buttonName: "start_pause"));
                    widget.notifyParent();
                  },
                  tooltip: 'Pause',
                  backgroundColor: widget.backgroundColor,
                  child: const Icon(
                    Icons.pause,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  heroTag: "Forward",
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Are you sure you want to skip?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              widget.lastButtonPressedBox.put(
                                  "lastButtonPressed",
                                  LastButtonPressed(buttonName: "forward"));
                              Navigator.pop(context, 'Yes');

                              widget.notifyParent();
                            },
                            child: Text(
                              'Yes',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontSize: 20),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'No');
                            },
                            child: Text(
                              'No',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  tooltip: 'Forward',
                  backgroundColor: widget.backgroundColor,
                  child: const Icon(
                    Icons.fast_forward,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
  }
}
