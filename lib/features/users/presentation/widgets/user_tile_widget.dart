import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:userdatabase/features/core/utils/extensions.dart';

import '../../domain/entities/user_entity.dart';

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({required this.userInfo, Key? key}) : super(key: key);
  final UserEntity userInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 30,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.color.tertiary7, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      leading: TextAvatar(
        shape: Shape.Circular,
        numberLetters: 2,
        upperCase: true,
        text: userInfo.name,
      ),
      title: Text(userInfo.name),
    );
  }
}
