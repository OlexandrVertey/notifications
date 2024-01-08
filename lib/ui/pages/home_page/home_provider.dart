import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notifications/db/one_time_db.dart';
import 'package:notifications/models/notifications_model.dart';
import 'package:notifications/service/notification_service.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({
    required this.oneTimeDB,
  });

  final OneTimeDB oneTimeDB;
  HomeState homeState = HomeState();

  Future<void> selectNotifications({required bool isOneTime}) async {
    homeState.isOneTime = isOneTime;
    notifyListeners();
  }

  Future<void> getNotifications() async {
    print("------getNotifications provider");
    try{
      homeState.listOneTimeNotificationsModel = await oneTimeDB.getOneTimeDB();
    } catch(e) {
      homeState.errorMessage = "Упс щось пішло не так:)";
    }
    notifyListeners();
  }

  Future<void> createOneTimeDB({required OneTimeNotificationsModel oneTimeNotificationsModel}) async {
    print("------createOneTimeDB provider");
    try{
      await oneTimeDB.createOneTimeDB(oneTimeNotificationsModel);
      NotificationService.showNotification(
        title: "noti",
        body: oneTimeNotificationsModel.message,
        scheduled: false,
        // interval: 60,
        hour: int.parse(oneTimeNotificationsModel.time.substring(0, 2)),
        minute: int.parse(oneTimeNotificationsModel.time.substring(2, 4)),
        id: oneTimeNotificationsModel.id!,
      );
      homeState.listOneTimeNotificationsModel = await oneTimeDB.getOneTimeDB();
    } catch(e) {
      homeState.errorMessage = "Упс щось пішло не так:)";
    }
    notifyListeners();
  }

  Future<void> updateOneTimeDB({required OneTimeNotificationsModel oneTimeNotificationsModel}) async {
    print("------getNotifications provider");
    try{
      await AwesomeNotifications().cancel(oneTimeNotificationsModel.id!);
      NotificationService.showNotification(
        title: "noti",
        body: oneTimeNotificationsModel.message,
        scheduled: false,
        // interval: 60,
        hour: int.parse(oneTimeNotificationsModel.time.substring(0, 2)),
        minute: int.parse(oneTimeNotificationsModel.time.substring(2, 4)),
        id: oneTimeNotificationsModel.id!,
      );
      await oneTimeDB.updateOneTimeDB(oneTimeNotificationsModel);
      homeState.listOneTimeNotificationsModel = await oneTimeDB.getOneTimeDB();
    } catch(e) {
      homeState.errorMessage = "Упс щось пішло не так:)";
    }
    notifyListeners();
  }

  Future<void> deleteItemOneTimeDB({required int id}) async {
    print("------getNotifications provider");
    try{
      await AwesomeNotifications().cancel(id);
      await oneTimeDB.deleteItem(id);
      homeState.listOneTimeNotificationsModel = await oneTimeDB.getOneTimeDB();
    } catch(e) {
      homeState.errorMessage = "Упс щось пішло не так:)";
    }
    notifyListeners();
  }

}

class HomeState {
  List<OneTimeNotificationsModel> listOneTimeNotificationsModel = [];
  String? errorMessage;
  bool isOneTime = true;
}
