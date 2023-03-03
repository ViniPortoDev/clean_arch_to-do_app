import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../buttons/selected_button_widget.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.only(left: constraints.maxWidth * 0.021),
          height: constraints.maxWidth * 0.16,
          width: constraints.maxWidth * 0.906,
          decoration: BoxDecoration(
            color: colorsTheme.secundaryColor,
            borderRadius: BorderRadius.circular(constraints.maxWidth * 0.048),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.48,
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(
                Icons.add_reaction_outlined,
                color: HexColors.primaryGrey,
                size: constraints.maxWidth * 0.064,
              ),
              Icon(
                Icons.attach_file_outlined,
                color: HexColors.primaryGrey,
                size: constraints.maxWidth * 0.064,
              ),
              SelectedButtonWidget(
                height: constraints.maxWidth * 0.104,
                width: constraints.maxWidth * 0.104,
                borderRadius: constraints.maxWidth * 0.037,
                padding: constraints.maxWidth * 0.0,
                child: Icon(
                  Icons.send_rounded,
                  size: constraints.maxWidth * 0.064,
                  color: colorsTheme.blackColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
