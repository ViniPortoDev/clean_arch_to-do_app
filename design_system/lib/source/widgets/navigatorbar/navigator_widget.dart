import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../themes/extensions/colors_theme.dart';
import '../buttons/selected_button_widget.dart';

class BottomNavigationWidget extends StatelessWidget {
  final void Function()? onPressed;
  const BottomNavigationWidget({Key? key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Opacity(
          opacity: 0.97,
          child: Container(
            height: constraints.maxWidth * 0.276,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(constraints.maxWidth * 0.096),
                topRight: Radius.circular(constraints.maxWidth * 0.096),
              ),
              color: colorsTheme.secundaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.112,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    LineIcons.file,
                    size: constraints.maxWidth * 0.069,
                    color: colorsTheme.primaryColor,
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.account_box_outlined,
                      size: constraints.maxWidth * 0.069,
                      color: colorsTheme.primaryColor,
                    ),
                  ),
                  Icon(
                    Icons.analytics_outlined,
                    size: constraints.maxWidth * 0.069,
                    color: colorsTheme.primaryColor,
                  ),
                  SelectedButtonWidget(
                    borderRadius: constraints.maxWidth * 0.037,
                    padding: constraints.maxWidth * 0.032,
                    child: Icon(
                      LineIcons.comment,
                      size: constraints.maxWidth * 0.069,
                      color: colorsTheme.blackColor,
                    ),
                  ),
                  Icon(
                    Icons.grid_view_outlined,
                    size: constraints.maxWidth * 0.069,
                    color: colorsTheme.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
