import 'package:flutter/material.dart';
import 'package:notifications/db/one_time_db.dart';
import 'package:notifications/db/recurring_db.dart';
import 'package:notifications/ui/pages/home_page/home_provider.dart';
import 'package:notifications/ui/pages/home_page/recurring_widget/recurring_provider.dart';
import 'package:provider/provider.dart';

void runAppWithInjectedDependencies({required Widget app}) async {
  final oneTimeDB = OneTimeDB.internal();
  final recurringDB = RecurringDB.internal();
  runApp(
    BaseDependenciesProvider(
      oneTimeDB: oneTimeDB,
      recurringDB: recurringDB,
      child: app,
    ),
  );
}

class BaseDependenciesProvider extends MultiProvider {
  BaseDependenciesProvider({
    Key? key,
    required OneTimeDB oneTimeDB,
    required RecurringDB recurringDB,
    required Widget child,
  }) : super(
          key: key,
          providers: [
            Provider<OneTimeDB>.value(value: oneTimeDB),
            Provider<RecurringDB>.value(value: recurringDB),
          ],
          child: BlocDependenciesProvider(
            oneTimeDB: oneTimeDB,
            recurringDB: recurringDB,
            child: child,
          ),
        );
}

class BlocDependenciesProvider extends StatelessWidget {
  const BlocDependenciesProvider({
    Key? key,
    this.child,
    required this.oneTimeDB,
    required this.recurringDB,
  }) : super(key: key);

  final Widget? child;
  final OneTimeDB oneTimeDB;
  final RecurringDB recurringDB;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(
            oneTimeDB: context.read<OneTimeDB>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => RecurringProvider(
            recurringDB: context.read<RecurringDB>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
