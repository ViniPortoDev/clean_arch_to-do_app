// ignore_for_file: prefer_int_literals

import 'dart:math';
import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class ExpansionWidget extends StatefulWidget {
  final String title;
  final double childHeight;
  final Widget? child;
  final int itemCount;
  final bool? isOpen;

  const ExpansionWidget({
    Key? key,
    required this.title,
    required this.childHeight,
    this.child,
    required this.itemCount,
    this.isOpen,
  }) : super(key: key);

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget>
    with SingleTickerProviderStateMixin {
  late final Animation animationRotation;
  late final Animation animationContainer;

  late final AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    animationRotation = Tween(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    animationContainer =
        Tween(begin: 0.0, end: widget.childHeight * widget.itemCount).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRect(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  final status = animationController.status;
                  if (status == AnimationStatus.completed) {
                    animationController.reverse();
                  } else if (status == AnimationStatus.dismissed) {
                    animationController.forward();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: textStyleTheme.expansionTitleStyle,
                    ),
                    AnimatedBuilder(
                      animation: animationController,
                      builder: (buildContext, child) {
                        return Transform.rotate(
                          angle: animationRotation.value,
                          child: Icon(
                            Icons.keyboard_arrow_up_rounded,
                            size: constraints.maxWidth * 0.064,
                            color: colorsTheme.primaryColor,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: animationController,
                builder: (buildContext, child) {
                  return SizedBox(
                    height: animationContainer.value,
                    child: child,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
