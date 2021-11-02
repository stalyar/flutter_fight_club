import 'package:flutter/material.dart';
import 'package:flutter_fight_club/fight_result.dart';
import 'package:flutter_fight_club/pages/fight_page.dart';
import 'package:flutter_fight_club/pages/statistics_page.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/action_button.dart';
import 'package:flutter_fight_club/widgets/fight_result_widget.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _MainPageContent();
  }
}

class _MainPageContent extends StatelessWidget {
  const _MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FightClubColors.background,
      body: SafeArea(
        child: Column(children: [
          const SizedBox(
            height: 24,
          ),
          Center(
            child: Text(
              "The\nFight\nClub".toUpperCase(),
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 30, color: FightClubColors.darkGreyText),
            ),
          ),
          Expanded(child: SizedBox()),
          FutureBuilder<String?>(
              future: SharedPreferences.getInstance().then(
                  (sharedPreferences) =>
                      sharedPreferences.getString("last_fight_result")),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return Column(
                    children: [
                      Center(
                        child: Text("no games"),
                      ),
                      FightResultWidget(fightResult: FightResult.draw)
                    ],
                  );
                } else {
                  late final FightResult fightResult;
                  switch (snapshot.data){
                    case "Draw":
                      fightResult = FightResult.draw;
                      break;
                    case "Won":
                      fightResult = FightResult.won;
                      break;
                    case "Lost":
                      fightResult = FightResult.lost;
                      break;
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Center(
                          child: Text(
                            "Last fight result",
                            style: TextStyle(
                              fontSize: 16,
                              color: FightClubColors.darkGreyText,
                            ),
                          ),
                        ),
                      ),
                      FightResultWidget(fightResult: fightResult)
                    ],
                  );
                }
              }),
          Expanded(child: SizedBox()),
          SecondaryActionButton(
            text: "Statistics",
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StatisticsPage()));
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ActionButton(
              text: "Start".toUpperCase(),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => FightPage()));
              },
              color: FightClubColors.blackButton),
          const SizedBox(
            height: 16,
          ),
        ]),
      ),
    );
  }
}
