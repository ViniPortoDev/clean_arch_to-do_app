import 'package:design_system/source/widgets/profile_components/profile_skills_widget.dart';
import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';
import '../buttons/profile_button_widget.dart';
import 'avatar_widget.dart';
import 'name_widget.dart';

class ProfileContainerInfoWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;

  final String name;
  final String description1;
  final String description2;
  final String imageNetworkAvatar;

  const ProfileContainerInfoWidget({
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
    required this.name,
    required this.description1,
    required this.description2,
    required this.imageNetworkAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: width ?? constraints.maxWidth,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: colorsTheme.backgroundInfoColor,
            borderRadius: BorderRadius.circular(
              borderRadius ?? constraints.maxWidth * 0.085,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  AvatarWidet(
                    radius: constraints.maxWidth * 0.08,
                    imageNetwork: imageNetworkAvatar,
                  ),
                  SizedBox(width: constraints.maxWidth * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NameWidget(
                        name: name,
                        isOnline: true,
                        statusHeight: constraints.maxWidth * 0.026,
                        statusWidth: constraints.maxWidth * 0.026,
                        textSize: textStyleTheme.nameBigStyle.fontSize,
                      ),
                      SizedBox(height: constraints.maxWidth * 0.01),
                      Text(
                        '86 9 9489-4600',
                        style: textStyleTheme.profileContainerInfoNumberStyle,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: constraints.maxWidth * 0.01),
              SizedBox(height: constraints.maxWidth * 0.037),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileButtonWidget(
                    iconSize: constraints.maxWidth * 0.096,
                    height: constraints.maxWidth * 0.16,
                    width: constraints.maxWidth * 0.16,
                    borderRadius: constraints.maxWidth * 0.053,
                    icon: Icons.phone_in_talk,
                    avaliable: true,
                  ),
                  ProfileButtonWidget(
                    iconSize: constraints.maxWidth * 0.096,
                    height: constraints.maxWidth * 0.16,
                    width: constraints.maxWidth * 0.16,
                    borderRadius: constraints.maxWidth * 0.053,
                    icon: Icons.videocam_outlined,
                    avaliable: true,
                  ),
                  ProfileButtonWidget(
                    iconSize: constraints.maxWidth * 0.096,
                    height: constraints.maxWidth * 0.16,
                    width: constraints.maxWidth * 0.16,
                    borderRadius: constraints.maxWidth * 0.053,
                    icon: Icons.volume_off_sharp,
                    avaliable: true,
                  ),
                  ProfileButtonWidget(
                    iconSize: constraints.maxWidth * 0.096,
                    height: constraints.maxWidth * 0.16,
                    width: constraints.maxWidth * 0.16,
                    borderRadius: constraints.maxWidth * 0.053,
                    icon: Icons.mail,
                    avaliable: false,
                  )
                ],
              ),
              SizedBox(height: constraints.maxWidth * 0.068),
              Text(
                description1,
                style: textStyleTheme.profileContainerInfoDescriptionStyle,
              ),
              Text(
                description2,
                style: textStyleTheme.profileContainerInfoDescriptionStyle,
              ),
              SizedBox(height: constraints.maxWidth * 0.068),
              Wrap(
                spacing: constraints.maxWidth * 0.032,
                runSpacing: constraints.maxWidth * 0.036,
                children: [
                  ProfileSkillsWidget(
                    borderRadius: constraints.maxWidth * 0.026,
                    colors: colorsTheme.skillColor[0],
                    text: 'UI/UX Designer',
                  ),
                  ProfileSkillsWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.032,
                      vertical: constraints.maxWidth * 0.021,
                    ),
                    borderRadius: constraints.maxWidth * 0.026,
                    colors: colorsTheme.skillColor[2],
                    text: 'QA',
                  ),
                  ProfileSkillsWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.032,
                      vertical: constraints.maxWidth * 0.021,
                    ),
                    borderRadius: constraints.maxWidth * 0.026,
                    colors: colorsTheme.skillColor[1],
                    text: 'Project Manager',
                  ),
                  ProfileSkillsWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.032,
                      vertical: constraints.maxWidth * 0.021,
                    ),
                    borderRadius: constraints.maxWidth * 0.026,
                    colors: colorsTheme.skillColor[4],
                    text: 'Java Script Developer',
                  ),
                  ProfileSkillsWidget(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.032,
                      vertical: constraints.maxWidth * 0.021,
                    ),
                    borderRadius: constraints.maxWidth * 0.026,
                    colors: colorsTheme.skillColor[3],
                    text: 'SEO',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
