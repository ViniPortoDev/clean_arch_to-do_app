import 'package:app/utils/hex_colors.dart';
import 'package:flutter/material.dart';

class LateralMenuWidget extends StatelessWidget {
  const LateralMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: HexColors.black,
        height: size.height - 95,
        width: size.width * 0.2,
        child: Column(
          children: [
            SizedBox(height: size.width * 0.032),
          ],
        ),
      );
    });
  }
}
