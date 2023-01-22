import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';

class TextAvatarWidget extends StatelessWidget {
  const TextAvatarWidget({required this.avatarText, Key? key})
      : super(key: key);
  final String? avatarText;

  @override
  Widget build(BuildContext context) {
    return TextAvatar(
      size: 80,
      shape: Shape.Circular,
      text: avatarText,
      numberLetters: 2,
      fontSize: 30,
      upperCase: true,
    );
  }
}
