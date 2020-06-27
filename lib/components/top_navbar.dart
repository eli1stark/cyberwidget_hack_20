import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// TopAppBar must be wraped with PreferredSize widget
/// Example:
/// appBar: PreferredSize(
///   child: TopAppBar(
///     iconLeft: Icons.arrow_back,
///     iconRight: FontAwesomeIcons.trashAlt,
///     fontAwesomeLeft: false,
///     fontAwesomeRight: true,
///     onTapLeft: () {},
///     onTapRight: () {},
///   ),
///   preferredSize: Size.fromHeight(kToolbarHeight),
/// ),
class TopNavBar extends StatelessWidget {
  TopNavBar({
    this.iconLeft,
    this.iconRight,
    this.fontAwesomeLeft,
    this.fontAwesomeRight,
    this.onTapLeft,
    this.onTapRight,
    this.textButton,
    this.onTapText,
    this.textButtonVisibility = false,
    this.textString,
  });

  final IconData iconLeft;
  final IconData iconRight;

  final String textString;
  final FlatButton textButton;
  final Function onTapText;
  final bool textButtonVisibility;

  /// If you want to add Font Awesome icon to the left then fontAwesome must be true
  /// If material icon then fontAwesome must be false
  /// the value must be specified
  final bool fontAwesomeLeft;

  /// If you want to add Font Awesome icon to the right then fontAwesome must be true
  /// If material icon then fontAwesome must be false
  /// the value must be specified
  final bool fontAwesomeRight;

  final Function onTapLeft;
  final Function onTapRight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: fontAwesomeLeft
            ? FaIcon(
                iconLeft,
                color: Colors.white,
                size: 35.0,
              )
            : Icon(
                iconLeft,
                color: Colors.white,
                size: 35.0,
              ),
        onPressed: onTapLeft,
      ),
      actions: <Widget>[
        IconButton(
          icon: fontAwesomeRight
              ? FaIcon(
                  iconRight,
                  color: Colors.white,
                  size: 35.0,
                )
              : Icon(
                  iconRight,
                  color: Colors.white,
                  size: 35.0,
                ),
          onPressed: onTapRight,
        ),
        Visibility(
          visible: textButtonVisibility,
          child: FlatButton(
            onPressed: onTapText,
            child: Text(
              "$textString",
              style: TextStyle(
                color: Color(0xffF1009C),
                fontSize: 21,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
