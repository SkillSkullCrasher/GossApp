import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gosapp/common/utils/coloors.dart';
import 'package:gosapp/common/extension/custom_theme_extension.dart';
import '../../../common/routes/routes.dart';
import '../../../common/utils/widgets/custom_elevated_button.dart';
import '../widgets/language_button.dart';
import '../widgets/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  navigateToLoginPage(context) {
    Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Coloors.backgroundDark,
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Image.asset(
                  'assets/circle.png',
                  color: context.theme.CircleImageColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                'Welcome to GossAPP',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const PrivacyAndTerms(),
              CustomElevatedButton(
                onPressed: () => navigateToLoginPage(context),
                text: 'AGREE AND CONTINUE',
                buttonWidth: 9,
              ),
              SizedBox(
                height: 50,
              ),
              LanguageButton(),
            ],
          ))
        ],
      ),
    );
  }
}

//6:08
