import 'package:flutter/material.dart';

class ButtonTable extends StatefulWidget {
  final Color color;
  final IconData icon;
  final Function() onPressed;

  const ButtonTable({
    super.key,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<ButtonTable> createState() => _ButtonTableState();
}

class _ButtonTableState extends State<ButtonTable> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(3),
        child: InkWell(
          onTap: widget.onPressed,
          child: Icon(
            widget.icon,
            color: Colors.white,
          ),
        ),
      ),
    );
    ;
  }
}
