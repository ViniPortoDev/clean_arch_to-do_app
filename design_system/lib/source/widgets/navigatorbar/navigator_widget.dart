import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../themes/extensions/colors_theme.dart';
import '../buttons/selected_button_widget.dart';




class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return Opacity(
      opacity: 0.97,
      child: Container(
        height: size.width * 0.282,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
            color: colorsTheme.secundaryColor,),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.112),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                LineIcons.file,
                size: size.width * 0.069,
                color: colorsTheme.primaryColor,
              ),
              Icon(
                Icons.account_box_outlined,
                size: size.width * 0.069,
                color: colorsTheme.primaryColor,
              ),
              Icon(
                Icons.analytics_outlined,
                size: size.width * 0.069,
                color: colorsTheme.primaryColor,
              ),
              SelectedButtonWidget(
                child: Icon(
                  LineIcons.comment,
                  size: size.width * 0.069,
                  color: colorsTheme.blackColor,
                ),
              ),
              Icon(
                Icons.grid_view_outlined,
                size: size.width * 0.069,
                color: colorsTheme.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
