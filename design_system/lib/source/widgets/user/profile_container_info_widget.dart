import 'package:design_system/source/widgets/user/profile_skills_widget.dart';
import 'package:flutter/material.dart';

import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';
import '../buttons/profile_button_widget.dart';
import 'avatar_widget.dart';
import 'name_widget.dart';

class ProfileContainerInfoWidget extends StatelessWidget {
  final String imageNetworkAvatar;
  final String name;
  final String description1;
  final String description2;

  const ProfileContainerInfoWidget({
    Key? key,
    required this.imageNetworkAvatar,
    required this.name,
    required this.description1,
    required this.description2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return Container(
      height: size.width * 1.162,
      width: size.width,
      decoration: BoxDecoration(
        color: colorsTheme.backgroundInfoColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: size.width * 0.138),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.064),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
                AvatarWidet(
                  radius: size.width * 0.109,
                  imageNetwork: imageNetworkAvatar,
                ),
                Icon(
                  Icons.more_horiz,
                  size: size.width * 0.085,
                ),
              ],
            ),
          ),
          SizedBox(height: size.width * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NameWidget(
                name: name,
                isOnline: true,
                textSize: textStyleTheme.nameBigStyle.fontSize,
              ),
            ],
          ),
          SizedBox(height: size.width * 0.01),
          Text(
            '86 9 9489-4600',
            style: textStyleTheme.profileContainerInfoNumberStyle,
          ),
          SizedBox(height: size.width * 0.037),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.112),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ProfileButtonWidget(icon: Icons.phone_in_talk, avaliable: true),
                ProfileButtonWidget(
                  icon: Icons.videocam_outlined,
                  avaliable: true,
                ),
                ProfileButtonWidget(
                  icon: Icons.volume_off_sharp,
                  avaliable: true,
                ),
                ProfileButtonWidget(icon: Icons.mail, avaliable: false)
              ],
            ),
          ),
          SizedBox(height: size.width * 0.026),
          Text(
            description1,
            style: textStyleTheme.profileContainerInfoDescriptionStyle,
          ),
          Text(
            description2,
            style: textStyleTheme.profileContainerInfoDescriptionStyle,
          ),
          SizedBox(height: size.width * 0.032),
          Wrap(
            children: [
              ProfileSkillsWidget(
                colors: colorsTheme.skillColor[0],
                text: 'UI/UX Designer',
              ),
              SizedBox(width: size.width * 0.021),
              ProfileSkillsWidget(
                colors: colorsTheme.skillColor[1],
                text: 'Project Manager',
              ),
              ProfileSkillsWidget(
                colors: colorsTheme.skillColor[2],
                text: 'QA',
              ),
              const SizedBox(width: 6),
              ProfileSkillsWidget(
                colors: colorsTheme.skillColor[3],
                text: 'SEO',
              ),
              const SizedBox(width: 6),
              ProfileSkillsWidget(
                colors: colorsTheme.skillColor[4],
                text: 'Java Script Developer',
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ProfileSkillsWidget(
          //       colors: colorsTheme.skillColor[0],
          //       text: 'UI/UX Designer',
          //     ),
          //     SizedBox(width: size.width * 0.021),
          //     ProfileSkillsWidget(
          //       colors: colorsTheme.skillColor[1],
          //       text: 'Project Manager',
          //     ),
          //   ],
          // ),
          // SizedBox(height: size.width * 0.021),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ProfileSkillsWidget(
          //       colors: colorsTheme.skillColor[2],
          //       text: 'QA',
          //     ),
          //     const SizedBox(width: 6),
          //     ProfileSkillsWidget(
          //       colors: colorsTheme.skillColor[3],
          //       text: 'SEO',
          //     ),
          //     const SizedBox(width: 6),
          //     ProfileSkillsWidget(
          //       colors: colorsTheme.skillColor[4],
          //       text: 'Java Script Developer',
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
