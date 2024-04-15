import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifications/extension/sized_box_extension.dart';

class SelectIconWidget extends StatefulWidget {
  const SelectIconWidget({
    Key? key,
    required this.callBack,
  }) : super(key: key);

  final Function(String icon, Color color) callBack;
  @override
  State<SelectIconWidget> createState() => _SelectIconWidgetState();
}

class _SelectIconWidgetState extends State<SelectIconWidget> {
  final List<Color> _colorsIcons = [
    const Color(0xffF1F4FF),
    const Color(0xffFFF1F1),
    const Color(0xffFFFEF1),
    const Color(0xffF5F1FF),
    const Color(0xffFFF1FF),
  ];

  final List<String> _selectIcons = [
    "business_icon.svg",
    "list_icon.svg",
    "person_check.svg",
    "notifications_icon.svg",
    "error_icon.svg",
  ];
  int _selectedColorIndex = 0;
  int _selectedIconsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.65,
      height: 473,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000),
            blurRadius: 15,
            offset: Offset(5, 10), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Icon style',
                style: TextStyle(
                  color: Color(0xff1A1717),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: const Color(0xff6A4DBA),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.clear,
                    size: 22.0,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ],
          ),
          16.0.hsb,
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xffF3F3F4),
          ),
          16.0.hsb,
          const Text(
            'Background colors',
            style: TextStyle(
              color: Color(0xff747377),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          11.0.hsb,
          SizedBox(
            height: 70,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _colorsIcons.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedColorIndex = index;
                    });
                  },
                  child: Container(
                    width: 63,
                    height: 63,
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedColorIndex == index
                            ? const Color(0xff6A4DBA)
                            : const Color(0xffFFFFFF),
                        width: 2,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _colorsIcons[index],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffE6E6E6),
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          16.0.hsb,
          const Text(
            'Select icons',
            style: TextStyle(
              color: Color(0xff747377),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          11.0.hsb,
          SizedBox(
            height: 70,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _colorsIcons.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIconsIndex = index;
                    });
                  },
                  child: Container(
                    width: 63,
                    height: 63,
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedIconsIndex == index
                            ? const Color(0xff6A4DBA)
                            : const Color(0xffFFFFFF),
                        width: 2,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffE6E6E6),
                          width: 1.5,
                        ),
                      ),
                      child: SvgPicture.asset("assets/images/${_selectIcons[index]}"),
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              widget.callBack(
                _selectIcons[_selectedIconsIndex],
                _colorsIcons[_selectedColorIndex],
              );
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 34),
              alignment: Alignment.center,
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xff6A4DBA),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Save changes",
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
