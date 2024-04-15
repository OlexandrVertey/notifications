import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notifications/db/recurring_db.dart';
import 'package:notifications/models/recurring_model.dart';
import 'package:notifications/service/notification_service.dart';

class RecurringProvider extends ChangeNotifier {
  RecurringProvider({
    required this.recurringDB,
  });

  final RecurringDB recurringDB;
  RecurringState recurringState = RecurringState();
  int _interval = 0;

  Future<void> getNotifications({required String repeatTime}) async {
    try{
      recurringState.listRecurringNotificationsModel = await recurringDB.getRecurringDB();
        recurringState.listRecurringNotificationsModel =
            recurringState.listRecurringNotificationsModel.where((element) => element.time == repeatTime).toList();
    } catch(e) {
      recurringState.errorMessage = "Упс щось пішло не так:)";
    }
    notifyListeners();
  }

  Future<void> createRecurringDB({required RecurringModel recurringModel, required String repeatTime}) async {
    if(repeatTime == "1 Minute") {
      _interval = 60;
    } else if(repeatTime == "3 Minute") {
      _interval = 180;
    } else if(repeatTime == "5 Minute") {
      _interval = 300;
    }
    try{
      await recurringDB.createRecurringDB(recurringModel);
      NotificationService.showNotification(
        title: "noti",
        body: recurringModel.message,
        scheduled: true,
        interval: _interval,
        id: recurringModel.id!,
      );
      recurringState.listRecurringNotificationsModel = await recurringDB.getRecurringDB();
      recurringState.listRecurringNotificationsModel =
          recurringState.listRecurringNotificationsModel.where((element) => element.time == repeatTime).toList();
    } catch(e) {
      recurringState.errorMessage = "Упс щось пішло не так:)";
    }
    notifyListeners();
  }

  Future<void> updateRecurringDB({required RecurringModel recurringModel, required String repeatTime}) async {
    if(repeatTime == "1 Minute") {
      _interval = 60;
    } else if(repeatTime == "3 Minute") {
      _interval = 180;
    } else if(repeatTime == "5 Minute") {
      _interval = 300;
    }
    try{
      await AwesomeNotifications().cancel(recurringModel.id!);
      NotificationService.showNotification(
        title: "noti",
        body: recurringModel.message,
        scheduled: true,
        interval: _interval,
        id: recurringModel.id!,
      );
      await recurringDB.updateRecurringDB(recurringModel);
      recurringState.listRecurringNotificationsModel = await recurringDB.getRecurringDB();
      recurringState.listRecurringNotificationsModel =
          recurringState.listRecurringNotificationsModel.where((element) => element.time == repeatTime).toList();
    } catch(e) {
      recurringState.errorMessage = "Упс щось пішло не так:)";
    }
    notifyListeners();
  }

  Future<void> deleteItemRecurringDB({required int id, required String repeatTime}) async {
    try{
      await AwesomeNotifications().cancel(id);
      await recurringDB.deleteItem(id);
      recurringState.listRecurringNotificationsModel = await recurringDB.getRecurringDB();
      recurringState.listRecurringNotificationsModel =
          recurringState.listRecurringNotificationsModel.where((element) => element.time == repeatTime).toList();
    } catch(e) {
      recurringState.errorMessage = "Упс щось пішло не так:)";
    }
    notifyListeners();
  }

}

class RecurringState {
  List<RecurringModel> listRecurringNotificationsModel = [];
  String? errorMessage;
  bool isOneTime = true;
}
