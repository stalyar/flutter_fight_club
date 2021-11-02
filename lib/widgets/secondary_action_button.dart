import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resources/fight_club_colors.dart';

class SecondaryActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SecondaryActionButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: FightClubColors.darkGreyText,
            width: 2,
          ),
        ),
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style:
          TextStyle(color: FightClubColors.darkGreyText, fontSize: 13, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}