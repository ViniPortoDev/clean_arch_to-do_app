// ignore_for_file: prefer_int_literals

import 'dart:math';
import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class ExpansionWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final int itemCount;
  final bool? isOpen;

  const ExpansionWidget({
    Key? key,
    required this.title,
    required this.child,
    required this.itemCount,
    this.isOpen,
  }) : super(key: key);

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget>
    with SingleTickerProviderStateMixin {
  late Animation animationRotation;
  late Animation animationContainer;

  late AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animationRotation = Tween(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    animationContainer =
        Tween(begin: 0.0, end: widget.itemCount * 100.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRect(
          child: Column(
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
                child: SizedBox(
                  height: constraints.maxWidth * 0.08,
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
              ),
              AnimatedBuilder(
                animation: animationController,
                builder: (buildContext, child) {
                  return SizedBox(
                    height: animationContainer.value,
                    child: ClipRect(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.itemCount,
                        itemBuilder: (context, index) => widget.child,
                      ),
                    ),
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
