import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifications/constants/text_fonts.dart';
import 'package:notifications/ui/pages/home_page/recurring_widget/recurring_item_page.dart';

class RecurringWidget extends StatefulWidget {
  const RecurringWidget({Key? key}) : super(key: key);

  @override
  State<RecurringWidget> createState() => _RecurringWidgetState();
}

class _RecurringWidgetState extends State<RecurringWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _minutesWidget("1"),
        _minutesWidget("3"),
        _minutesWidget("5"),
      ],
    );
  }

  Widget _minutesWidget(String minutes) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecurringItemPage(
              repeatTime: "$minutes Minute",
            ),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$minutes Minute",
                  style: const TextStyle(
                    fontFamily: NotificationsAppFonts.RobotoBold,
                    color: Color(0xff1A1717),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SvgPicture.asset("assets/images/right.svg"),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xffE6E6E6),
          ),
        ],
      ),
    );
  }
}
