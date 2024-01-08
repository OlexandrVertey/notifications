import 'package:flutter/material.dart';
import 'package:notifications/di/app_dependency_provider.dart';
import 'package:notifications/service/notification_service.dart';
import 'package:notifications/ui/pages/login_page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  runAppWithInjectedDependencies(app: const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'noti',
      home: const LoginPage(),
    );
  }
}
