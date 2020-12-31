import 'package:flutter/material.dart';
import 'package:menuapp/Provider/appstate.dart';
import 'package:menuapp/constants.dart';
import 'package:menuapp/data/outlets.dart';
import 'package:menuapp/widgets/outlet_tab_button.dart';
import 'package:menuapp/widgets/menu.dart';
import 'package:provider/provider.dart';

class OutletsTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
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
              child: Center(child: Text(appState.restaurantName ?? "",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize:16),)),
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
