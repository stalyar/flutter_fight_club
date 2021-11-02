import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/resources/fight_club_images.dart';

import '../fight_result.dart';

class FightResultWidget extends StatelessWidget {
  final FightResult fightResult;

  const FightResultWidget({Key? key, required this.fightResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ColoredBox(
                color: Colors.white,
              )),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white, FightClubColors.darkPurple]),
                  ),
                ),
              ),
              Expanded(
                  child: ColoredBox(
                color: FightClubColors.darkPurple,
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "You",
                    style: TextStyle(color: FightClubColors.darkGreyText),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    FightClubImages.youAvatar,
                    height: 92,
                    width: 92,
                  )
                ],
              ),
              Container(
                height: 44,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: _calculateColor(),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    child: Center(
                      child: Text(
                        fightResult.result.toLowerCase(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Enemy",
                    style: TextStyle(color: FightClubColors.darkGreyText),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    FightClubImages.enemyAvatar,
                    height: 92,
                    width: 92,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _calculateColor() {
    switch (fightResult){
      case FightResult.draw:
        return FightClubColors.blueButton;
      case FightResult.won:
        return FightClubColors.greenButton;
      case FightResult.lost:
        return FightClubColors.redButton;
      default: return FightClubColors.blueButton;
    }
  }
}
