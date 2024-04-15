import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifications/constants/text_fonts.dart';
import 'package:notifications/extension/sized_box_extension.dart';
import 'package:notifications/models/notifications_model.dart';
import 'package:notifications/models/recurring_model.dart';
import 'package:notifications/ui/pages/add_new_notification/select_icon_widget.dart';
import 'package:notifications/ui/pages/home_page/home_provider.dart';
import 'package:notifications/ui/pages/home_page/recurring_widget/recurring_provider.dart';
import 'package:notifications/ui/pages/login_page/enter_time_widget.dart';
import 'package:provider/provider.dart';

class AddNewNotification extends StatefulWidget {
  const AddNewNotification({
    Key? key,
    required this.changeNotification,
    required this.oneTime,
    this.oneTimeNotificationsModel,
    this.listRecurringNotificationsModel,
    this.repeatTime,
  }) : super(key: key);

  final bool changeNotification;
  final bool oneTime;
  final OneTimeNotificationsModel? oneTimeNotificationsModel;
  final RecurringModel? listRecurringNotificationsModel;
  final String? repeatTime;

  @override
  State<AddNewNotification> createState() => _AddNewNotificationState();
}

class _AddNewNotificationState extends State<AddNewNotification> {
  TextEditingController _messageController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  OneTimeNotificationsModel? _oneTimeNotificationsModel;
  RecurringModel? _listRecurringNotificationsModel;

  String _icon = "main_icon.svg";
  Color _color = const Color(0xffFFFFFF);
  DateTime now = DateTime.now();
  int _id = 0;
  bool _messageError = false;
  bool _timeError = false;

  @override
  void initState() {
    if(widget.changeNotification) {
      if(widget.oneTimeNotificationsModel != null){
        _messageController.text =  widget.oneTimeNotificationsModel!.message;
        _timeController.text =  widget.oneTimeNotificationsModel!.time;
      }
      if(widget.listRecurringNotificationsModel != null){
        _messageController.text =  widget.listRecurringNotificationsModel!.message;
      }
      if(widget.oneTimeNotificationsModel != null
          && widget.oneTimeNotificationsModel!.icon.isNotEmpty
          && widget.oneTimeNotificationsModel!.backColorIcon.isNotEmpty) {
        _icon = widget.oneTimeNotificationsModel!.icon;
        int value = int.parse(widget.oneTimeNotificationsModel!.backColorIcon.split('(0x')[1].split(')')[0], radix: 16);
        _color = Color(value);
      }
      if(widget.listRecurringNotificationsModel != null
          && widget.listRecurringNotificationsModel!.icon.isNotEmpty
          && widget.listRecurringNotificationsModel!.backColorIcon.isNotEmpty) {
        _icon = widget.listRecurringNotificationsModel!.icon;
        int value = int.parse(widget.listRecurringNotificationsModel!.backColorIcon.split('(0x')[1].split(')')[0], radix: 16);
        _color = Color(value);
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
              widget.changeNotification ? "Change Notification" : "Add new notificaiton",
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              26.0.hsb,
              const Text(
                "Message",
                style: TextStyle(
                  fontFamily: NotificationsAppFonts.RobotoMedium,
                  color: Color(0xff1A1717),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              6.0.hsb,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: !_messageError ? const Color(0xffB9B9B9) : const Color(0xffF43528),
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: _messageController,
                  maxLines: 10,
                  cursorColor: const Color(0xff1A1717),
                  onChanged: (text) {
                      setState(() {
                        _messageError = false;
                      });
                  },
                  textInputAction: TextInputAction.go,
                  style: const TextStyle(
                    color: Color(0xff1A1717),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: "Enter message",
                    hintStyle: TextStyle(
                      fontFamily: NotificationsAppFonts.RobotoRegular,
                      color: Color(0xffB9B9B9),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              if(widget.oneTime)
              24.0.hsb,
              if(widget.oneTime)
              const Text(
                "Type time",
                style: TextStyle(
                  fontFamily: NotificationsAppFonts.RobotoMedium,
                  color: Color(0xff1A1717),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              if(widget.oneTime)
              6.0.hsb,
              if(widget.oneTime)
              EnterTimeWidget(
                codeController: _timeController,
                timeError: _timeError,
                callBack: () {
                  if(_timeController.text.isNotEmpty) {
                    setState(() {
                      _timeError = false;
                    });
                  }
                },
              ),
              24.0.hsb,
              const Text(
                "Icon",
                style: TextStyle(
                  fontFamily: NotificationsAppFonts.RobotoMedium,
                  color: Color(0xff1A1717),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              6.0.hsb,
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: _color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xffB9B9B9),
                        width: 1,
                      ),
                    ),
                    child: SvgPicture.asset("assets/images/$_icon"),
                  ),
                  16.0.wsb,
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        barrierColor: const Color(0xffFFFFFF).withOpacity(0),
                        builder: (BuildContext context) {
                          return SelectIconWidget(
                            callBack: (String icon, Color color) {
                              print('------icon = ${icon}');
                              print('------color = ${color}');
                              setState(() {
                                _icon = icon;
                                _color = color;
                              });
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xff6A4DBA),
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        'Select icon',
                        style: TextStyle(
                          fontFamily: NotificationsAppFonts.RobotoBold,
                          color: Color(0xff6A4DBA),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              20.0.hsb,
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 91,
        child: InkWell(
          onTap: () async {
            if(_messageController.text.isEmpty) {
              setState(() {
                _messageError = true;
              });
            }
            if(widget.oneTime && _timeController.text.isEmpty) {
              setState(() {
                _timeError = true;
              });
            }
            if(widget.oneTime && _messageController.text.isNotEmpty && _timeController.text.isNotEmpty) {
              _id = int.parse(now.hour.toString() + now.minute.toString() + now.second.toString());
              print("-------_id = ${_id}");
              _oneTimeNotificationsModel = widget.changeNotification
                  ? OneTimeNotificationsModel(
                      id: widget.oneTimeNotificationsModel!.id,
                      time: _timeController.text,
                      message: _messageController.text,
                      icon: _icon == "main_icon.svg" ? '' : _icon,
                      backColorIcon: _color.toString(),
                    )
                  : OneTimeNotificationsModel(
                      id: _id,
                      time: _timeController.text,
                      message: _messageController.text,
                      icon: _icon == "main_icon.svg" ? '' : _icon,
                      backColorIcon: _color.toString(),
                    );
              print("------add new notifications onTap:");
              widget.changeNotification
                  ? context.read<HomeProvider>().updateOneTimeDB(
                oneTimeNotificationsModel: _oneTimeNotificationsModel!,
              )
                  : context.read<HomeProvider>().createOneTimeDB(
                oneTimeNotificationsModel: _oneTimeNotificationsModel!,
              );
              Navigator.of(context).pop();
            }

            if(!widget.oneTime && _messageController.text.isNotEmpty) {
              _id = int.parse(now.hour.toString() + now.minute.toString() + now.second.toString());
              _listRecurringNotificationsModel = widget.changeNotification
                  ? RecurringModel(
                      id: widget.listRecurringNotificationsModel!.id,
                      time: widget.repeatTime!,
                      message: _messageController.text,
                      icon: _icon == "main_icon.svg" ? '' : _icon,
                      backColorIcon: _color.toString(),
                    )
                  : RecurringModel(
                      id: _id,
                      time: widget.repeatTime!,
                      message: _messageController.text,
                      icon: _icon == "main_icon.svg" ? '' : _icon,
                      backColorIcon: _color.toString(),
                    );
              widget.changeNotification
                  ? context.read<RecurringProvider>().updateRecurringDB(recurringModel: _listRecurringNotificationsModel!, repeatTime: widget.repeatTime!)
                  : context.read<RecurringProvider>().createRecurringDB(recurringModel: _listRecurringNotificationsModel!, repeatTime: widget.repeatTime!);
              Navigator.of(context).pop();
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 35, left: 15, right: 15),
            alignment: Alignment.center,
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              color: (!widget.oneTime && _messageController.text.isNotEmpty) || (widget.oneTime && _messageController.text.isNotEmpty && _timeController.text.isNotEmpty) ? const Color(0xff6A4DBA) : const Color(0xffB9B9B9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Confirm",
              style: TextStyle(
                  fontFamily: NotificationsAppFonts.RobotoBold,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
