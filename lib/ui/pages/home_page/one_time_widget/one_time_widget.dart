import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifications/constants/text_fonts.dart';
import 'package:notifications/extension/sized_box_extension.dart';
import 'package:notifications/models/notifications_model.dart';
import 'package:notifications/ui/pages/add_new_notification/add_new_notification.dart';
import 'package:notifications/ui/pages/home_page/home_provider.dart';
import 'package:provider/provider.dart';

class OneTimeWidget extends StatefulWidget {
  const OneTimeWidget({
    Key? key,
    required this.listOneTimeNotificationsModel,
  }) : super(key: key);

  final List<OneTimeNotificationsModel> listOneTimeNotificationsModel;

  @override
  State<OneTimeWidget> createState() => _OneTimeWidgetState();
}

class _OneTimeWidgetState extends State<OneTimeWidget> {
  Color _backColorIcon = const Color(0xffFFFFFF);

  @override
  void initState() {
    Timer timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) async {
      DateTime now = DateTime.now();
      for(int i = 0; i < widget.listOneTimeNotificationsModel.length; i ++) {
        DateTime targetTime = DateTime(
          0,
          0,
          0,
          int.parse(widget.listOneTimeNotificationsModel[i].time.substring(0, 2)),
          int.parse(widget.listOneTimeNotificationsModel[i].time.substring(2, 4)),
        );
        if (now.hour >= targetTime.hour && now.minute >= targetTime.minute) {
          context.read<HomeProvider>().deleteItemOneTimeDB(id: widget.listOneTimeNotificationsModel[i].id!);
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                itemCount: widget.listOneTimeNotificationsModel.length,
                itemBuilder: (context, index) {
                  if(widget.listOneTimeNotificationsModel[index].backColorIcon.isNotEmpty) {
                    int value = int.parse(widget.listOneTimeNotificationsModel[index].backColorIcon.split('(0x')[1].split(')')[0], radix: 16);
                    _backColorIcon = Color(value);
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddNewNotification(
                            changeNotification: true,
                            oneTimeNotificationsModel: widget.listOneTimeNotificationsModel[index],
                            oneTime: true,
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
                              if(widget.listOneTimeNotificationsModel[index].icon.isNotEmpty)
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
                                child: SvgPicture.asset("assets/images/${widget.listOneTimeNotificationsModel[index].icon}"),
                              ),
                              if(widget.listOneTimeNotificationsModel[index].icon.isNotEmpty)
                              InkWell(
                                onTap: () => context.read<HomeProvider>().deleteItemOneTimeDB(id: widget.listOneTimeNotificationsModel[index].id!),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: SvgPicture.asset("assets/images/delete.svg"),
                                ),
                              ),
                            ],
                          ),
                          if(widget.listOneTimeNotificationsModel[index].icon.isNotEmpty)
                          10.0.hsb,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Time:',
                                    style: TextStyle(
                                      color: Color(0xff747377),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      fontFamily: NotificationsAppFonts.RobotoRegular,
                                    ),
                                  ),
                                  5.0.wsb,
                                  Text(
                                      "${widget.listOneTimeNotificationsModel[index].time.substring(0, 2)}:${widget.listOneTimeNotificationsModel[index].time.substring(2, 4)}",
                                    // widget.listOneTimeNotificationsModel[index].time,
                                    style: const TextStyle(
                                      fontFamily: NotificationsAppFonts.RobotoBold,
                                      color: Color(0xff1A1717),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              if(widget.listOneTimeNotificationsModel[index].icon.isEmpty)
                                InkWell(
                                  onTap: () => context.read<HomeProvider>().deleteItemOneTimeDB(id: widget.listOneTimeNotificationsModel[index].id!),
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
                                  fontFamily: NotificationsAppFonts.RobotoBold,
                                  color: Color(0xff747377),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              5.0.wsb,
                              Text(
                                widget.listOneTimeNotificationsModel[index].message,
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
                  print('------_Add new notification');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddNewNotification(
                        changeNotification: false,
                        oneTime: true,
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
    );
  }
}
