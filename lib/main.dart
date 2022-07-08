import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/controllers/auth_controller.dart';
import 'package:my_app/app/routes/app_pages.dart';
import 'package:my_app/app/routes/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(
      'Handling background message => This is when the application paused/closed.');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    print(message);

    // if (message.data['type'] == 'chat') {
    //   Navigator.pushNamed(context, '/chat',
    //     arguments: ChatArguments(message),
    //   );
    // }
  }

  // final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Push Notification',
      initialRoute: Routes.PUSH_NOTIFICATION,
      getPages: AppPages.routes,
    );

    // return GetMaterialApp(
    //   title: 'File Upload',
    //   initialRoute: Routes.FILE_UPLOAD,
    //   getPages: AppPages.routes,
    // );

    // return GetMaterialApp(
    //   title: 'Storage',
    //   initialRoute: Routes.STORE,
    //   getPages: AppPages.routes,
    // );

    /**
     * This is for QUERY DB
     */
    // return GetMaterialApp(
    //   title: 'Query',
    //   initialRoute: Routes.QUERY,
    //   getPages: AppPages.routes,
    // );

    /**
     * This is DB
     */
    // return StreamBuilder<User?>(
    //   stream: authC.streamAuthStatus,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       print(snapshot.data);
    //       return GetMaterialApp(
    //         title: 'Application',
    //         initialRoute:
    //             snapshot.data != null && snapshot.data!.emailVerified == true
    //                 ? Routes.HOME
    //                 : Routes.LOGIN,
    //         getPages: AppPages.routes,
    //       );
    //     }
    //     return LoadingView();
    //   },
    // );
  }
}
