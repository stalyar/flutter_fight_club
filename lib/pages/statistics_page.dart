import 'package:flutter/material.dart';
import 'package:flutter_fight_club/pages/fight_page.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/action_button.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StatisticsPageContent();
  }
}

class _StatisticsPageContent extends StatelessWidget {
  const _StatisticsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FightClubColors.background,
      body: SafeArea(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 24, left: 16, right: 16),
            child: Text(
              "Statistics",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: FightClubColors.darkGreyText,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<int?>(
                    future: SharedPreferences.getInstance().then((
                        sharedPreferences) =>
                        sharedPreferences.getInt("stats_won")),
                    builder: (context, snapshot) {
                      int wonCount = 0;
                      if (snapshot.hasData && snapshot.data != null) {
                        wonCount = snapshot.data!;
                      }
                      return Text("Won: $wonCount", style: TextStyle(
                          fontSize: 16, color: FightClubColors.darkGreyText),);
                    }
                ),
                FutureBuilder<int?>(
                    future: SharedPreferences.getInstance().then((
                        sharedPreferences) =>
                        sharedPreferences.getInt("stats_draw")),
                    builder: (context, snapshot) {
                      int drawCount = 0;
                      if (snapshot.hasData && snapshot.data != null) {
                        drawCount = snapshot.data!;
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text("Draw: $drawCount", style: TextStyle(
                            fontSize: 16,
                            color: FightClubColors.darkGreyText),),
                      );
                    }
                ),
                FutureBuilder<int?>(
                    future: SharedPreferences.getInstance().then((
                        sharedPreferences) =>
                        sharedPreferences.getInt("stats_lost")),
                    builder: (context, snapshot) {
                      int lostCount = 0;
                      if (snapshot.hasData && snapshot.data != null) {
                        lostCount = snapshot.data!;
                      }
                      return Text("Lost: $lostCount", style: TextStyle(
                          fontSize: 16, color: FightClubColors.darkGreyText),
                      );
                    }
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: SecondaryActionButton(
                text: "Back",
                onTap: () {
                  Navigator.of(context).pop();
                }),
          ),
        ]),
      ),
    );
  }


}
