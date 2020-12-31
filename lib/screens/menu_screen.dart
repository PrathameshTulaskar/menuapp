import 'package:flutter/material.dart';
import 'package:menuapp/Provider/appstate.dart';
import 'package:menuapp/constants.dart';
import 'package:menuapp/widgets/screen_top_bar.dart';
import 'package:menuapp/widgets/outlets_tab_view.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  final String id;
  MenuScreen({Key key,this.id});
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    appState.restaurantNameSetter = this.id;
    return Scaffold(
      backgroundColor: kThemeColorYellow,
      // appBar: null,
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
