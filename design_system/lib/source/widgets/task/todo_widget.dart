import 'package:flutter/material.dart';

import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';
import '../buttons/selected_button_widget.dart';


class TodoWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool isDone;
  final void Function()? onTap;
  final String? dateAndTime;

  const TodoWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.isDone,
    this.dateAndTime,
    this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: size.width * 0.026),
        child: Container(
          height: size.width * 0.173,
          width: size.width * 0.906,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDone ? colorsTheme.blackColor : colorsTheme.secundaryColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              if (isDone)
                SelectedButtonWidget(
                  padding: size.width * 0.028,
                  child: Icon(
                    Icons.done,
                    color: colorsTheme.blackColor,
                    size: size.width * 0.064,
                  ),
                )
              else
                Container(
                  height: size.width * 0.122,
                  width: size.width * 0.122,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorsTheme.backgroundSelectedColor,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              SizedBox(width: size.width * 0.021),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.555,
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
                    width: size.width * 0.555,
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
              Text(dateAndTime ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
