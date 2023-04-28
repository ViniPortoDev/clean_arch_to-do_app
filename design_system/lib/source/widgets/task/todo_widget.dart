import 'package:flutter/material.dart';

import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';
import '../buttons/selected_button_widget.dart';

class TodoWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool isDone;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Color overdueTask;
  final String? date;

  const TodoWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.isDone,
    required this.date,
    required this.overdueTask,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Container(
            height: constraints.maxWidth * 0.194,
            width: constraints.maxWidth * 0.906,
            padding:
                EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.032),
            decoration: BoxDecoration(
              color:
                  isDone ? colorsTheme.blackColor : colorsTheme.secundaryColor,
              borderRadius: BorderRadius.circular(constraints.maxWidth * 0.048),
            ),
            child: Row(
              children: [
                if (isDone)
                  SelectedButtonWidget(
                    width: constraints.maxWidth * 0.112,
                    height: constraints.maxWidth * 0.112,
                    borderRadius: constraints.maxWidth * 0.032,
                    padding: constraints.maxWidth * 0.0,
                    child: Icon(
                      Icons.done,
                      color: colorsTheme.blackColor,
                      size: constraints.maxWidth * 0.064,
                    ),
                  )
                else
                  Container(
                    height: constraints.maxWidth * 0.111,
                    width: constraints.maxWidth * 0.111,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colorsTheme.backgroundSelectedColor,
                      ),
                      borderRadius:
                          BorderRadius.circular(constraints.maxWidth * 0.032),
                    ),
                  ),
                SizedBox(width: constraints.maxWidth * 0.032),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.53,
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: title,
                              style: textStyleTheme.todoTitleStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.53,
                      child: RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: description,
                          style: textStyleTheme.todoDescriptionStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                Text(
                  date ?? '',
                  style: TextStyle(color: overdueTask),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
