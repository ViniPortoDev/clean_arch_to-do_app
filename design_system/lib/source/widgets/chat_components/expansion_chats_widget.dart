import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class ExpansionWidget extends StatelessWidget {
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
  // usar value notifier
  @override
  Widget build(BuildContext context) {
    var turns = 0.0;
    final ValueNotifier isExpanded = ValueNotifier<bool>(isOpen ?? false);
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRect(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  isExpanded.value = !isExpanded.value;
                },
                child: SizedBox(
                  height: constraints.maxWidth * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: textStyleTheme.expansionTitleStyle,
                      ),
                      ValueListenableBuilder(
                        valueListenable: isExpanded,
                        builder: (_, isExpanded, __) {
                          late IconData iconArrow;
                          if (isExpanded) {
                            iconArrow = Icons.keyboard_arrow_up_rounded;
                            turns = 1;
                          } else {
                            turns = 2;
                            iconArrow = Icons.keyboard_arrow_down_rounded;
                          }
                          return AnimatedRotation(
                            turns: turns,
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              iconArrow,
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
              ValueListenableBuilder(
                valueListenable: isExpanded,
                builder: (_, isExpanded, __) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: isExpanded
                        ? constraints.maxWidth * 0.285 * itemCount
                        : 0,
                    child: ClipRect(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: itemCount,
                        itemBuilder: (context, index) => child,
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
