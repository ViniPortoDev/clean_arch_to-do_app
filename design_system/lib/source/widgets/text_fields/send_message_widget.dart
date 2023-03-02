import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../buttons/selected_button_widget.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.only(left: 18),
        height: constraints.maxWidth * 0.16,
        width: constraints.maxWidth * 0.906,
        decoration: BoxDecoration(
          color: colorsTheme.secundaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              Icons.add_reaction,
              size: constraints.maxWidth * 0.064,
            ),
            Icon(
              Icons.attach_file_outlined,
              size: constraints.maxWidth * 0.064,
            ),
            SelectedButtonWidget(
              padding: constraints.maxWidth * 0.021,
              child: Icon(
                Icons.send_rounded,
                size: constraints.maxWidth * 0.064,
                color: colorsTheme.blackColor,
              ),
            )
          ],
        ),
      );
    });
  }
}
