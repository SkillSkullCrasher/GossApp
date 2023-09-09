import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gosapp/common/extension/custom_theme_extension.dart';
import 'package:gosapp/common/routes/routes.dart';
import 'package:gosapp/common/theme/dark_theme.dart';
import 'package:gosapp/common/theme/light_theme.dart';
import 'package:gosapp/feature/auth/controller/auth_controller.dart';
import 'package:gosapp/feature/auth/pages/login_page.dart';
import 'package:gosapp/feature/contact/pages/contact_pages.dart';
import 'package:gosapp/feature/home/pages/home_page.dart';
import 'package:gosapp/feature/welcome/pages/welcome.dart';
import 'package:gosapp/firebase_options.dart';

import 'feature/auth/pages/verification_page.dart';
import 'feature/welcome/pages/user_info_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GossAPP',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.blue,
      // ),
      // home: const ContactPage(),
      home: ref.watch(userInfoAuthProvider).when(data: (user) {
        if (user == null) return const WelcomePage();
        return HomePage();
      }, error: (error, trace) {
        return Scaffold(
          body: Center(
            child: Text('Something wrong happened!'),
          ),
        );
        return null;
      }, loading: () {
        return Scaffold(
          body: Center(
              child: Icon(
            Icons.whatsapp, size: 30,
            // color: context.theme.authAppbarTextColor,
          )),
        );
      }),
      onGenerateRoute: Routes.onGenerateRoute,
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



//3:11
