import 'package:flutter/material.dart';
import 'package:menuapp/constants.dart';
import 'package:menuapp/data/outlets.dart';
import 'package:menuapp/widgets/outlet_tab_button.dart';
import 'package:menuapp/widgets/menu.dart';

class OutletsTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabButtons = [];
    dOutlets.forEach((id, outlet) {
      tabButtons.add(OutletTabButton(
        id: id,
        text: outlet.name,
      ));
    });

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: Container(
        color: kThemeColorRed,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: tabButtons,
              ),
            ),
            Expanded(
              child: Menu(),
            ),
          ],
        ),
      ),
    );
  }
}
