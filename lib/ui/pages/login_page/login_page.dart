import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifications/constants/text_fonts.dart';
import 'package:notifications/extension/sized_box_extension.dart';
import 'package:notifications/ui/pages/home_page/home_page.dart';
import 'package:notifications/ui/pages/login_page/enter_time_widget.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _timeController = TextEditingController();
  DateTime now = DateTime.now();
  String _timeHour = '';
  String _timeMinutes = '';
  bool _showError = false;

  @override
  void initState() {
    _timeHour = DateFormat('HH').format(now);
    _timeMinutes = DateFormat('mm').format(now);
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
        title: const Text(
          "Log In",
          style: TextStyle(
            fontFamily: NotificationsAppFonts.RobotoBold,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              70.0.hsb,
              const Text(
                "Log In",
                style: TextStyle(
                  fontFamily: NotificationsAppFonts.RobotoBold,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff1A1717),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Enter current time in hh : mm format",
                style: TextStyle(
                  fontFamily: NotificationsAppFonts.RobotoRegular,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff747377),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "$_timeHour : $_timeMinutes",
                style: TextStyle(
                  fontFamily: NotificationsAppFonts.RobotoBold,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: Color(0xff1A1717),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EnterTimeWidget(
                    codeController: _timeController,
                    callBack: () {
                      setState(() {
                        _showError = false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: !_showError ? 91 : 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_showError)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: const Color(0xffF3F3F4),
                width: double.infinity,
                height: 50,
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/info.svg"),
                    10.0.wsb,
                    const Text(
                      "The time is wrong. Try again.",
                      style: TextStyle(
                        fontFamily: NotificationsAppFonts.RobotoMedium,
                          color: Color(0xffF43528),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            if (_showError) 30.0.hsb,
            InkWell(
              onTap: () {
                if (_timeController.text.length == 4) {
                  if (_timeController.text == _timeHour + _timeMinutes) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  } else {
                    setState(() {
                      _showError = true;
                    });
                  }
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 35, left: 15, right: 15),
                alignment: Alignment.center,
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: _timeController.text.length == 4 ? const Color(0xff6A4DBA) : const Color(0xffB9B9B9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                      fontFamily: NotificationsAppFonts.RobotoBold,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
