import 'package:flutter/material.dart';
import 'package:practice_1/design/practice_one_colors.dart';

class AppBarItems extends StatelessWidget {
  const AppBarItems({super.key, required this.storeName});
  final String storeName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 45, 16, 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.black12,
              image: const DecorationImage(image: AssetImage('assets/images/saitama.png')),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Expanded(
            child: Text(
              storeName,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          ContainerIcon(
            margin: const EdgeInsets.only(right: 12),
            iconButton: IconButton(
              icon: const Icon(Icons.notifications, color: PracticeOneColors.brandPrimaryColor),
              onPressed: () => print('Press Icon'),
            ),
          ),
          ContainerIcon(
            iconButton: IconButton(
              icon: const Icon(Icons.more_vert, color: PracticeOneColors.brandPrimaryColor),
              onPressed: () => print('Press Icon'),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerIcon extends StatelessWidget {
  const ContainerIcon({super.key, required this.iconButton, this.margin});
  final IconButton iconButton;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final colorList = [
      Colors.blue.shade800,
      Colors.blue.shade400,
    ];
    return Container(
      width: 40,
      height: 40,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(color: PracticeOneColors.brandLightColorBorder),
        borderRadius: BorderRadius.circular(8),
        // TODO: to look how to do this
        // gradient: const LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     Colors.blue,
        //     Colors.red,
        //   ],
        // ),
      ),
      child: iconButton,
    );
  }
}
