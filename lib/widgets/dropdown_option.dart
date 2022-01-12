import 'package:flutter/material.dart';

class DropDownOption extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final String? hintText;
  final Function(String?) onChange;
  final String title;

  const DropDownOption({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChange,
    required this.title,
    this.hintText,
  }) : super(key: key);

  @override
  _DropDownOptionState createState() => _DropDownOptionState();
}

class _DropDownOptionState extends State<DropDownOption> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: FormField(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                isEmpty: widget.selectedItem == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: widget.selectedItem,
                    onChanged: (value) {},
                    isDense: true,
                    items: widget.items.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
