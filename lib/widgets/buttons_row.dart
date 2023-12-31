import 'package:flutter/material.dart';
import 'package:practice_1/design/gastos_texts.dart';
import 'package:practice_1/design/practice_one_colors.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow(
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
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: GastosColors.brandLightColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
              style: categorieBtnStyle,
              onPressed: categoriesBtnAction,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Text(
                  GastosTexts.categories,
                  style: const TextStyle(color: GastosColors.brandDarkColor, fontSize: 14),
                ),
              )),
          ElevatedButton(
              style: recentTransactionsBtnStyle,
              onPressed: recentBtnAction,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: Text(
                  GastosTexts.recentTrx,
                  style: const TextStyle(color: GastosColors.brandLigthDarkColor, fontSize: 14),
                ),
              )),
        ],
      ),
    );
  }
}
