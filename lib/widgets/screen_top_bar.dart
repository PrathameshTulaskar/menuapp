import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:menuapp/models/app_state.dart';
import 'package:menuapp/screens/cart_screen.dart';

/// An [AppBar]-like widget typically shown at the top of a screen.
///
/// Displays (optionally) a back button, app's brand name, and cart button.
class ScreenTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: Navigator.canPop(context),
          replacement: SizedBox(
            height: 30.0,
            width: 30.0,
          ),
          child: IconButton(
            iconSize: 30.0,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Text(
          'Menu App',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 30.0,
          ),
        ),
        GestureDetector(
          onTap: () {
            final String currentRoute = ModalRoute.of(context).settings.name;
            if (currentRoute != CartScreen.id)
              Navigator.pushNamed(context, CartScreen.id);
          },
          child: Badge(
            animationType: BadgeAnimationType.scale,
            badgeContent: Text("0"),
            // appState.getCartSize() > 0
            //     ? Text(
            //         appState.getCartSize().toString(),
            //         style: TextStyle(color: Colors.white),
            //       )
            //     : null,
            child: Icon(
              Icons.shopping_cart,
              size: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}
