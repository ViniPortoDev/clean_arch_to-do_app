import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class ExpansionWidget extends StatefulWidget {
  final String title;
  final double height;
  final bool isOpen;
  final void Function() onTap;
  final Widget child;
  const ExpansionWidget({
    Key? key,
    required this.title,
    required this.height,
    required this.isOpen,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  @override
  Widget build(BuildContext context) {
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    final size = MediaQuery.of(context).size;
    return ClipRect(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.042,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: widget.onTap,
              child: SizedBox(
                height: size.width * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: textStyleTheme.expansionTitleStyle,
                    ),
                    Icon(
                      widget.isOpen
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: size.width * 0.064,
                      color: colorsTheme.primaryColor,
                    )
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: widget.height,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: size.width * 0.053,
                    ),
                    child: SizedBox(
                      height: size.width * 0.186,
                      child: widget.child,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
