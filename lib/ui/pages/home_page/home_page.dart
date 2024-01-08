import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifications/constants/text_fonts.dart';
import 'package:notifications/extension/sized_box_extension.dart';
import 'package:notifications/ui/pages/home_page/home_provider.dart';
import 'package:notifications/ui/pages/home_page/one_time_widget/one_time_widget.dart';
import 'package:notifications/ui/pages/home_page/recurring_widget/recurring_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeProvider>().getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: const Color(0xffFFFFFF),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(0xff1A1717),
            automaticallyImplyLeading: false,
            title: const Text(
              "Notifications",
              style: TextStyle(
                fontFamily: NotificationsAppFonts.RobotoBold,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: const Color(0xff1A1717),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xffF3F3F4),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xffE6E6E6),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => context.read<HomeProvider>().selectNotifications(isOneTime: true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: value.homeState.isOneTime
                                  ? const Color(0xff6A4DBA)
                                  : const Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/one_time.svg",
                                  color: value.homeState.isOneTime
                                      ? const Color(0xffFFFFFF)
                                      : const Color(0xff1A1717),
                                ),
                                5.0.wsb,
                                Text(
                                  'One-time',
                                  style: TextStyle(
                                    fontFamily: NotificationsAppFonts.RobotoBold,
                                    color: value.homeState.isOneTime
                                        ? const Color(0xffFFFFFF)
                                        : const Color(0xff1A1717),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => context.read<HomeProvider>().selectNotifications(isOneTime: false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: value.homeState.isOneTime
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xff6A4DBA),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/recurring.svg",
                                  color: value.homeState.isOneTime
                                      ?  const Color(0xff1A1717)
                                      : const Color(0xffFFFFFF),
                                ),
                                5.0.wsb,
                                Text(
                                  'Recurring',
                                  style: TextStyle(
                                    fontFamily: NotificationsAppFonts.RobotoBold,
                                    color: value.homeState.isOneTime
                                        ?  const Color(0xff1A1717)
                                        : const Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              value.homeState.isOneTime
                ? OneTimeWidget(listOneTimeNotificationsModel: value.homeState.listOneTimeNotificationsModel)
                : RecurringWidget(),
            ],
          ),
        );
      },
    );
  }
}
