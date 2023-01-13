import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice_tracking_flutter/data/datasources/local/local.datasource.dart';
import 'package:invoice_tracking_flutter/presentation/controllers/profile.controller.dart';

final notificationServiceProvider =
    StateNotifierProvider<NotificationService, AsyncValue<String?>>((ref) {
  return NotificationService(ref);
});

class NotificationService extends StateNotifier<AsyncValue<String?>> {
  final Ref ref;
  NotificationService(this.ref) : super(const AsyncData(null));

  Future<void> initialize() async {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint('onMessageOpenedApp: $event');
    });

    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        debugPrint('onMessageOpenedApp: $value');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('onMessageOpenedApp: $message');
      state = AsyncData(message.data.toString());
    });

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    FirebaseMessaging.onBackgroundMessage(messageBackgroundHandler);
  }

  Future<void> updateUserTokenDevice(BuildContext context) async {
    FirebaseMessaging.instance.getToken().then((value) async {
      if (ref.read(localDataSourceProvider).deviceToken == '') {
        ref.read(profileControllerProvider.notifier).updateProfile(context,
            formData: {'deviceToken': value}, image: null);
        ref
            .read(localDataSourceProvider)
            .storeDeviceToken(deviceToken: value ?? '');
      }
    });
  }
}

Future<void> messageBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('BackgroundEvent: $message');
}
