// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gosapp/common/helper/show_alert_dialog.dart';

// import '../../../common/routes/routes.dart';

// final AuthRepositoryProvider = Provider(
//   (ref) {
//     return AuthRepository(
//         auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
//   },
// );

// class AuthRepository {
//   final FirebaseAuth auth;
//   final FirebaseFirestore firestore;

//   AuthRepository({
//     required this.auth,
//     required this.firestore,
//   });
//   void verifySmsCode({
//     required BuildContext context,
//     required String smsCodeId,
//     required String smsCode,
//     required bool mounted,
//   }) async {
//     try {
//       final credential = PhoneAuthProvider.credential(
//         verificationId: smsCode,
//         smsCode: smsCode,
//       );
//       await auth.signInWithCredential(credential);
//       if (!mounted) return;
//       Navigator.of(context)
//           .pushNamedAndRemoveUntil(Routes.userInfo, (route) => false);
//     } on FirebaseAuth catch (e) {
//       showAlertDialog(context: context, message: e.toString());
//     }
//   }

//   void sendSmsCode(
//       {required BuildContext context, required String phoneNumber}) async {
//     try {
//       await auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await auth.signInWithCredential(credential);
//         },
//         verificationFailed: (e) {
//           showAlertDialog(context: context, message: e.toString());
//         },
//         codeSent: (smsCodeId, resendSmsCodeId) {
//           Navigator.of(context).pushNamedAndRemoveUntil(
//             // context,
//             Routes.verification,
//             (route) => false,
//             arguments: {
//               'phoneNumber': phoneNumber,
//               'smsCodeId': smsCodeId,
//             },
//           );
//         },
//         codeAutoRetrievalTimeout: (String smsCodeId) {},
//       );
//     } on FirebaseAuth catch (e) {
//       // Navigator.pop(context);
//       showAlertDialog(context: context, message: e.toString());
//     }
//   }
// }

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gosapp/common/helper/show_alert_dialog.dart';
import 'package:gosapp/common/helper/show_loading_dialog.dart';
import 'package:gosapp/common/models/user_model.dart';
import 'package:gosapp/common/repository/firebase_storage_repository.dart';
import 'package:gosapp/common/routes/routes.dart';
import 'package:gosapp/feature/auth/pages/verification_page.dart';

final AuthRepositoryProvider = Provider((ref) {
  return AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
});

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({required this.auth, required this.firestore});

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user;
    final UserInfo =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();
    if (UserInfo.data() == null) return user;
    user = UserModel.fromMap(UserInfo.data()!);
    return user;
  }

  void saveUserInfoToFirestore({
    required String username,
    required var profileImage,
    required ProviderRef ref,
    required BuildContext context,
    required bool mounted,
  }) async {
    try {
      showLoadingDialog(context: context, message: 'Saving user info.....');
      String uid = auth.currentUser!.uid;
      String profileImageurl = profileImage is String ? profileImage : '';
      if (profileImage != null && profileImage is! String) {
        profileImageurl = await ref
            .read(FirebaseStorageRepositoryProvider)
            .storeFileToFirebase('profileImage/$uid', profileImage);
      }
      UserModel user = UserModel(
          username: username,
          uid: uid,
          profileImageUrl: profileImageurl,
          active: true,
          phoneNumber: auth.currentUser!.phoneNumber!,
          groupId: []);
      await firestore.collection('users').doc(uid).set(user.toMap());
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    } catch (e) {
      Navigator.pop(context);

      showAlertDialog(context: context, message: e.toString());
    }
  }

  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      showLoadingDialog(context: context, message: 'Verifying code.....');
      final Credential = PhoneAuthProvider.credential(
          verificationId: smsCodeId, smsCode: smsCode);
      await auth.signInWithCredential(Credential);
      UserModel? user = await getCurrentUserInfo();
      if (!mounted) return;
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.userInfo, (route) => false,
          arguments: user?.profileImageUrl);
    } on FirebaseAuth catch (e) {
      Navigator.pop(context);

      showAlertDialog(context: context, message: e.toString());
    }
  }

  void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      showLoadingDialog(
          context: context,
          message: 'Sending a verification code to $phoneNumber');
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showAlertDialog(context: context, message: e.toString());
        },
        codeSent: (smsCodeId, resendSmsCodeId) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.verification,
            (route) => false,
            arguments: {
              'phoneNumber': phoneNumber,
              'smsCodeId': smsCodeId,
            },
          );
        },
        codeAutoRetrievalTimeout: (String smsCodeId) {},
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showAlertDialog(context: context, message: e.toString());
    }
  }
}
