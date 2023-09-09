// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gosapp/feature/auth/repository/auth_repository.dart';

// final authControllerProvider = Provider((ref) {
//   final authRepository = ref.watch(AuthRepositoryProvider);
//   return AuthController(authRepository: authRepository);
// });

// class AuthController {
//   final AuthRepository authRepository;

//   AuthController({required this.authRepository});
//   void verifySmsCode({
//     required BuildContext context,
//     required String smsCodeId,
//     required String smsCode,
//     required bool mounted,
//   }) {
//     authRepository.verifySmsCode(
//         context: context,
//         smsCodeId: smsCodeId,
//         smsCode: smsCode,
//         mounted: mounted);
//   }

//   void sendSmsCode(
//       {required BuildContext context, required String phoneNumber}) {
//     authRepository.sendSmsCode(context: context, phoneNumber: phoneNumber);
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gosapp/common/models/user_model.dart';
import 'package:gosapp/feature/auth/repository/auth_repository.dart';

final AuthControllerProvider = Provider((ref) {
  final AuthRepository = ref.watch(AuthRepositoryProvider);
  return AuthController(authRepository: AuthRepository, ref: ref);
});

final userInfoAuthProvider = FutureProvider((ref) {
  final AuthController = ref.watch(AuthControllerProvider);
  return AuthController.getCurrentUserInfo();
});

class AuthController {
  final AuthRepository authRepository;
  final ProviderRef ref;

  AuthController({required this.authRepository, required this.ref});

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user = await authRepository.getCurrentUserInfo();
    return user;
  }

  void saveUserInfoToFirestore({
    required String username,
    required var profileImage,
    required BuildContext context,
    required bool mounted,
  }) {
    authRepository.saveUserInfoToFirestore(
        username: username,
        profileImage: profileImage,
        ref: ref,
        context: context,
        mounted: mounted);
  }

  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) {
    authRepository.verifySmsCode(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: mounted);
  }

  void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
  }) {
    authRepository.sendSmsCode(
      context: context,
      phoneNumber: phoneNumber,
    );
  }
}
