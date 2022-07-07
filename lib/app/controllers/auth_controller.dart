import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/app/routes/routes.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String emailAddress, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: "Verification Email",
            middleText: 'Kamu perlu email verification dulu.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void signup(String emailAddress, String password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: "Verification Email",
          middleText:
              'Kami telah mengirimkan email verification ke $emailAddress.',
          textConfirm: 'Check Email',
          onConfirm: () {
            Get.back();
            Get.back();
          });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void resetPassword(String emailAddress) async {
    if (emailAddress != '' && GetUtils.isEmail(emailAddress)) {
      try {
        await auth.sendPasswordResetEmail(email: emailAddress);
        Get.defaultDialog(
          title: "Berhasil",
          middleText: 'Kami telah mengirimkan reset password ke $emailAddress',
          textConfirm: 'Ak mengerti',
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      } catch (e) {
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: 'Tidak dapat mengirimkan reset password',
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: 'Email tidak valid.',
      );
    }
  }
}
