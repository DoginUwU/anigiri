import 'package:flutter/material.dart';

class SwitchOption extends StatefulWidget {
  final bool value;
  final Function(bool) onChange;
  final IconData? icon;
  final String title;

  const SwitchOption({
    Key? key,
    required this.onChange,
    required this.value,
    this.icon,
    required this.title,
  }) : super(key: key);

  @override
  _SwitchOptionState createState() => _SwitchOptionState();
}

class _SwitchOptionState extends State<SwitchOption> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: Switch(
              value: widget.value,
              onChanged: widget.onChange,
            ),
          ),
        )
      ],
    );
  }
}
