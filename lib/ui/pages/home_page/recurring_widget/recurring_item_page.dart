import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifications/constants/text_fonts.dart';
import 'package:notifications/extension/sized_box_extension.dart';
import 'package:notifications/ui/pages/add_new_notification/add_new_notification.dart';
import 'package:notifications/ui/pages/home_page/recurring_widget/recurring_provider.dart';
import 'package:provider/provider.dart';

class RecurringItemPage extends StatefulWidget {
  const RecurringItemPage({
    Key? key,
    required this.repeatTime,
  }) : super(key: key);

  final String repeatTime;

  @override
  State<RecurringItemPage> createState() => _RecurringItemPageState();
}

class _RecurringItemPageState extends State<RecurringItemPage> {
  Color _backColorIcon = const Color(0xffFFFFFF);

  @override
  void initState() {
    context.read<RecurringProvider>().getNotifications(repeatTime: widget.repeatTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecurringProvider>(
    builder: (context, value, child) {
      return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xff1A1717),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/images/left.svg"),
                ),
              ),
              const Spacer(),
              Text(
                widget.repeatTime,
                style: const TextStyle(
                  fontFamily: NotificationsAppFonts.RobotoBold,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.68,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: value.recurringState.listRecurringNotificationsModel.length,
                    itemBuilder: (context, index) {
                      if (value.recurringState.listRecurringNotificationsModel[index].backColorIcon.isNotEmpty) {
                        int colorValue = int.parse(
                            value.recurringState.listRecurringNotificationsModel[index].backColorIcon
                                .split('(0x')[1]
                                .split(')')[0],
                            radix: 16);
                        _backColorIcon = Color(colorValue);
                      }
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddNewNotification(
                                changeNotification: true,
                                listRecurringNotificationsModel:
                                  value.recurringState.listRecurringNotificationsModel[index],
                                oneTime: false,
                                repeatTime: widget.repeatTime,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color(0xffF8FAFB),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xff6A4DBA),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  if (value.recurringState.listRecurringNotificationsModel[index].icon
                                      .isNotEmpty)
                                    Container(
                                      height: 30,
                                      width: 30,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: _backColorIcon,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xffB9B9B9),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                          "assets/images/${value.recurringState.listRecurringNotificationsModel[index].icon}"),
                                    ),
                                  if (value.recurringState.listRecurringNotificationsModel[index].icon
                                      .isNotEmpty)
                                    InkWell(
                                      onTap: () => context
                                          .read<RecurringProvider>()
                                          .deleteItemRecurringDB(
                                            id: value.recurringState.listRecurringNotificationsModel[index].id!,
                                            repeatTime: widget.repeatTime,
                                          ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                        child: SvgPicture.asset("assets/images/delete.svg"),
                                      ),
                                    ),
                                ],
                              ),
                              if (value.recurringState.listRecurringNotificationsModel[index].icon
                                  .isNotEmpty)
                              10.0.hsb,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Time:',
                                        style: TextStyle(
                                          fontFamily: NotificationsAppFonts.RobotoRegular,
                                          color: Color(0xff747377),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                      5.0.wsb,
                                      Text(
                                        value.recurringState.listRecurringNotificationsModel[index].time.toLowerCase(),
                                        style: const TextStyle(
                                          fontFamily: NotificationsAppFonts.RobotoBold,
                                          color: Color(0xff1A1717),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (value.recurringState.listRecurringNotificationsModel[index].icon.isEmpty)
                                    InkWell(
                                      onTap: () => context.read<RecurringProvider>().deleteItemRecurringDB(
                                            id: value.recurringState.listRecurringNotificationsModel[index].id!,
                                            repeatTime: widget.repeatTime,
                                          ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                        child: SvgPicture.asset("assets/images/delete.svg"),
                                      ),
                                    ),
                                ],
                              ),
                              10.0.hsb,
                              Row(
                                children: [
                                  const Text(
                                    'Message:',
                                    style: TextStyle(
                                      fontFamily: NotificationsAppFonts.RobotoRegular,
                                      color: Color(0xff747377),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  5.0.wsb,
                                  Text(
                                    value.recurringState.listRecurringNotificationsModel[index].message,
                                    style: const TextStyle(
                                      fontFamily: NotificationsAppFonts.RobotoBold,
                                      color: Color(0xff1A1717),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddNewNotification(
                            changeNotification: false,
                            oneTime: false,
                            repeatTime: widget.repeatTime,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 24),
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xff6A4DBA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/add.svg"),
                          10.0.wsb,
                          const Text(
                            "Add new notification",
                            style: TextStyle(
                              fontFamily: NotificationsAppFonts.RobotoBold,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
