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
    // var appState = Provider.of<AppState>(context);

    return Center(child:Text(
          'Menu App',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 30.0,
          ),
        ));
  }
}
