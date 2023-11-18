import 'package:flutter/material.dart';
import 'package:practice_1/design/colors.dart';

class MidHomePageBody extends StatelessWidget {
  const MidHomePageBody(
      {super.key,
      required this.categorieBtnStyle,
      required this.recentTransactionsBtnStyle,
      required this.categoriesBtnAction,
      required this.recentBtnAction});
  final ButtonStyle categorieBtnStyle;
  final ButtonStyle recentTransactionsBtnStyle;
  final void Function()? categoriesBtnAction;
  final void Function()? recentBtnAction;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: 104,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: PracticeOneColors.brandLightColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
                style: categorieBtnStyle,
                onPressed: categoriesBtnAction,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  child: Text(
                    'Categories',
                    style: TextStyle(color: PracticeOneColors.brandDarkColor, fontSize: 14),
                  ),
                )),
            ElevatedButton(
                style: recentTransactionsBtnStyle,
                onPressed: recentBtnAction,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Text(
                    'Recent transaction',
                    style: TextStyle(color: PracticeOneColors.brandLigthDarkColor, fontSize: 14),
                  ),
                )),
          ],
        ));
  }
}
