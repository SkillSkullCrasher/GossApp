import 'package:flutter/cupertino.dart';
import 'package:gosapp/common/extension/custom_theme_extension.dart';

import '../../../common/utils/coloors.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Read out ',
              style: TextStyle(color: context.theme.greyColor, height: 1.5),
              children: [
                TextSpan(
                    text: 'Privacy Policy. ',
                    style: TextStyle(color: context.theme.blueColor)),
                TextSpan(
                  text: 'Tap "Agree and continue" to accept the ',
                ),
                TextSpan(
                    text: 'Terms of Services. ',
                    style: TextStyle(color: context.theme.blueColor)),
              ])),
    );
  }
}
