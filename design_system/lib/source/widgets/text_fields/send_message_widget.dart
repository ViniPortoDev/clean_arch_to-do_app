import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SendMessageWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? selectedItemheight;
  final double? selectedItemWidth;

  final double? iconsSize;
  final double? borderRadius;

  const SendMessageWidget({
    Key? key,
    this.height,
    this.width,
    this.iconsSize,
    this.selectedItemWidth,
    this.selectedItemheight,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.021),
          height: height ?? constraints.maxWidth * 0.16,
          width: width ?? constraints.maxWidth * 0.906,
          decoration: BoxDecoration(
            color: colorsTheme.secundaryColor,
            borderRadius: BorderRadius.circular(
              borderRadius ?? constraints.maxWidth * 0.048,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.59,
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.add_reaction_outlined,
                      color: HexDarkColors.primaryGrey,
                      size: iconsSize ?? constraints.maxWidth * 0.064,
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: HexDarkColors.primaryGrey,
                      size: iconsSize ?? constraints.maxWidth * 0.064,
                    ),
                    Icon(
                      Icons.image,
                      color: HexDarkColors.primaryGrey,
                      size: iconsSize ?? constraints.maxWidth * 0.064,
                    ),
                    Icon(
                      Icons.link,
                      color: HexDarkColors.primaryGrey,
                      size: iconsSize ?? constraints.maxWidth * 0.064,
                    ),
                    SelectedButtonWidget(
                      height:
                          selectedItemheight ?? constraints.maxWidth * 0.104,
                      width: selectedItemWidth ?? constraints.maxWidth * 0.104,
                      borderRadius:
                          borderRadius ?? constraints.maxWidth * 0.037,
                      padding: 0,
                      child: Icon(
                        Icons.send_rounded,
                        size: iconsSize ?? constraints.maxWidth * 0.064,
                        color: colorsTheme.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
