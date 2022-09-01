import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PieProgressBar extends StatefulWidget {
  const PieProgressBar(
      {super.key,
      required this.total,
      required this.value,
      required this.label});

  final double total, value;
  final String label;

  @override
  State<PieProgressBar> createState() => _PieProgressBarState();
}

class _PieProgressBarState extends State<PieProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            setState(() {});
          })
          ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CircularProgressIndicator(
                  value:
                      (widget.value / widget.total) * animationController.value,
                  backgroundColor: Colors.white.withOpacity(.08),
                  color: const Color(0xFFFFF9AA),
                ),
              ),
              Center(
                child: Text(
                    widget.value.toString().replaceAll(RegExp(r"\..+"), ""),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        Text(widget.label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold))
      ],
    );
  }
}
