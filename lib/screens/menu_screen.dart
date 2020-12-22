import 'package:flutter/material.dart';
import 'package:menuapp/constants.dart';
import 'package:menuapp/widgets/screen_top_bar.dart';
import 'package:menuapp/widgets/outlets_tab_view.dart';

class MenuScreen extends StatelessWidget {
  static final String id = 'menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeColorYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: ScreenTopBar(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: OutletsTabView(),
            ),
          ],
        ),
      ),
    );
  }
}
