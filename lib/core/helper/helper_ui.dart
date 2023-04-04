import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_ny_time/core/constants/color_constants.dart';
import 'package:sample_ny_time/core/constants/image_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelperUI {
  static Widget emptyContainer() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 0,
      height: 0,
    );
  }

  static Widget getProgressIndicator() {
    return Material(
      color: Colors.white.withOpacity(0.6),
      child: const Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            color: ColorsConstants.COLOR_APP_THEME,
          ),
        ),
      ),
    );
  }

  // static Widget getAppLogo() {
  //   return SvgPicture.asset(IMG_APP_LOGO);
  // }

  static toastMessage(message, {ToastGravity? gravity}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
}
