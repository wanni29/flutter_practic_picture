import 'package:flutter/material.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/home_screen.dart';
import 'package:flutter_practice_picture/screen/practice1/screen/home/widgets/home_screen_mid_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreenMid extends StatelessWidget {
  const HomeScreenMid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeScreenMidButton(
          chooseColor: Colors.red,
          iconName: FontAwesomeIcons.chair,
          itemCount: 10,
        ),
        HomeScreenMidButton(
          chooseColor: Colors.green,
          iconName: FontAwesomeIcons.couch,
          itemCount: 12,
        ),
        HomeScreenMidButton(
          chooseColor: Colors.yellow,
          iconName: FontAwesomeIcons.desktop,
          itemCount: 8,
        ),
        HomeScreenMidButton(
          chooseColor: Colors.purple,
          iconName: FontAwesomeIcons.bath,
          itemCount: 15,
        ),
        HomeScreenMidButton(
          chooseColor: Colors.black,
          iconName: FontAwesomeIcons.sliders,
        ),
      ],
    );
  }
}
