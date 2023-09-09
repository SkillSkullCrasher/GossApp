// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gosapp/common/extension/custom_theme_extension.dart';
// import 'package:gosapp/common/utils/widgets/custom_icon_button.dart';
// import 'package:gosapp/feature/auth/controller/auth_controller.dart';
// import 'package:gosapp/feature/auth/widgets/custom_text_field.dart';

// class VerificationPage extends ConsumerWidget {
//   const VerificationPage(
//       {super.key, required this.smsCodeId, required this.phoneNumber});
//   final String smsCodeId;
//   final String phoneNumber;
//   // void verifySmsCode(BuildContext context, WidgetRef ref, String smsCode) {
//   //   ref.read(AuthControllerProvider).verifySmsCode(
//   //       context: context,
//   //       smsCodeId: smsCodeId,
//   //       smsCode: smsCode,
//   //       mounted: true);
//   // }

//   // @override
//   // State<VerificationPage> createState() => _VerificationPageState();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(appBar:AppBar(backgroundColor: Theme.of(context).),)
// //     // TODO: implement build
// //     throw UnimplementedError();
// //   }
// // }
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     // TODO: implement build
// //     throw UnimplementedError();
// //   }
// // }

// // class _VerificationPageState extends State<VerificationPage> {
// //   late TextEditingController codeController;
// //   @override
// //   void initState() {
// //     codeController = TextEditingController();
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     codeController.dispose();
// //     super.dispose();
// //   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).backgroundColor,
//         elevation: 0,
//         title: Text(
//           'Verify your number',
//           style: TextStyle(color: context.theme.authAppbarTextColor),
//         ),
//         centerTitle: true,
//         actions: [CustomIconButton(onTap: () {}, icon: Icons.more_vert)],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                       style: TextStyle(color: context.theme.greyColor),
//                       children: [
//                         TextSpan(
//                             text:
//                                 "You have tried to register +7302416699 before requesting an SMS or call with your code.\n "),
//                         TextSpan(
//                             text: 'Wrong number?',
//                             style: TextStyle(color: context.theme.blueColor))
//                       ])),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 80),
//               child: CustomTextField(
//                 // controller: codeController,
//                 hintText: '-----',
//                 fontSize: 30,
//                 keyboardType: TextInputType.number,
//                 onChanged: (value) {
//                   // if (value.length == 6) {
//                   //   return verifySmsCode(context, ref, value);
//                   // }
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Enter 6-digit code',
//               style: TextStyle(color: context.theme.greyColor),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Row(
//               children: [
//                 Icon(
//                   Icons.message,
//                   color: context.theme.greyColor,
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   'Resend SMS',
//                   style: TextStyle(
//                     color: context.theme.greyColor,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Divider(
//               color: context.theme.blueColor!.withOpacity(0.2),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gosapp/common/extension/custom_theme_extension.dart';
import 'package:gosapp/common/utils/widgets/custom_icon_button.dart';
import 'package:gosapp/feature/auth/controller/auth_controller.dart';
import 'package:gosapp/feature/auth/widgets/custom_text_field.dart';

class VerificationPage extends ConsumerWidget {
  const VerificationPage({
    super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });
  final String smsCodeId;
  final String phoneNumber;
  // @override
  void verifySmsCode(
    BuildContext context,
    WidgetRef ref,
    //  String smsCodeId,
    String smsCode,
  ) {
    // var smsCode;
    ref.read(AuthControllerProvider).verifySmsCode(
        context: context,
        // phoneNumber:phoneNumber,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          'verify your number',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: (Icons.more_vert),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style:
                        TextStyle(color: context.theme.greyColor, height: 1.5),
                    children: [
                      TextSpan(
                          text: "You've tried to register +91 7302416699 "),
                      TextSpan(
                          text: 'Wrong number',
                          style: TextStyle(color: context.theme.blueColor))
                    ])),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                // controller: codeController,
                hintText: '------',
                fontSize: 30,
                autofocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    return verifySmsCode(context, ref, value);
                  }
                },
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            'Enter 6-digit code',
            style: TextStyle(color: context.theme.greyColor),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Icon(
                Icons.message,
                color: context.theme.greyColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Resend SMS',
                style: TextStyle(color: context.theme.greyColor),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: context.theme.blueColor!.withOpacity(0.2),
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: context.theme.greyColor,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'call me',
                style: TextStyle(color: context.theme.greyColor),
              )
            ],
          )
        ]),
      ),
    );
  }
}
