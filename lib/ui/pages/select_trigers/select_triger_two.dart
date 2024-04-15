// import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notifications/constants/text_fonts.dart';
// import 'dart:math' as math;

import 'package:notifications/extension/sized_box_extension.dart';

class SelectTrigerTwo extends StatefulWidget {
  const SelectTrigerTwo({Key? key}) : super(key: key);

  @override
  State<SelectTrigerTwo> createState() => _SelectTrigerTwoState();
}

class _SelectTrigerTwoState extends State<SelectTrigerTwo> with TickerProviderStateMixin {

  bool _selectedAllTrigers = false;

  Animation<double>? _animationSport;
  AnimationController? _controllerShowSport;
  AnimationController? _controllerRotationSport;
  bool _selectedAllSport = false;
  bool _rotationSport = false;

  Animation<double>? _animationMorning;
  AnimationController? _controllerShowMorning;
  AnimationController? _controllerRotationMorning;
  bool _selectedAllMorning = false;
  bool _rotationMorning = false;

  Animation<double>? _animationBikingRunning;
  AnimationController? _controllerShowBikingRunning;
  bool _selectedBiking = false;

  bool _selectedRunning = false;

  Animation<double>? _animationEvening;
  AnimationController? _controllerShowEvening;
  AnimationController? _controllerRotationEvening;
  bool _selectedALLEvening = false;
  bool _rotationEvening = false;
  bool _selectedPingPong = false;
  bool _selectedVolleyball = false;

  bool _selectedALLBoxing = false;

  bool _selectedALLFootball = false;

  Animation<double>? _animationWork;
  AnimationController? _controllerShowWork;
  AnimationController? _controllerRotationWork;
  bool _selectedAllWork = false;
  bool _rotationWork = false;

  bool _selectedMeeting = false;

  bool _selectedPrintDocument = false;

  bool _selectedAllAlarm = false;

  bool _selectedAllParty = false;

  bool _selectedAllDinner = false;




  @override
  void initState() {
    super.initState();
    _controllerShowSport = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _controllerRotationSport = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    _animationSport = CurvedAnimation(
      parent: _controllerShowSport!,
      curve: Curves.linear,
    );

    _controllerShowMorning = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _controllerRotationMorning = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    _animationMorning = CurvedAnimation(
      parent: _controllerShowMorning!,
      curve: Curves.linear,
    );

    _controllerShowBikingRunning = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animationBikingRunning = CurvedAnimation(
      parent: _controllerShowBikingRunning!,
      curve: Curves.linear,
    );

    _controllerShowEvening = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _controllerRotationEvening = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    _animationEvening = CurvedAnimation(
      parent: _controllerShowEvening!,
      curve: Curves.linear,
    );

    _controllerShowWork = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _controllerRotationWork = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    _animationWork = CurvedAnimation(
      parent: _controllerShowWork!,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllerShowSport!.dispose();
    _controllerRotationSport!.dispose();

    _controllerShowMorning!.dispose();
    _controllerRotationMorning!.dispose();


  }

  _showSport() {
    if (_animationSport!.status != AnimationStatus.completed) {
      _controllerShowSport!.forward();
    } else {
      _controllerShowSport!.animateBack(
        0,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  _showMorning() {
    if (_animationMorning!.status != AnimationStatus.completed) {
      _controllerShowMorning!.forward();
    } else {
      _controllerShowMorning!.animateBack(
        0,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  _showEvening() {
    if (_animationEvening!.status != AnimationStatus.completed) {
      _controllerShowEvening!.forward();
    } else {
      _controllerShowEvening!.animateBack(
        0,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  _showWork() {
    if (_animationWork!.status != AnimationStatus.completed) {
      _controllerShowWork!.forward();
    } else {
      _controllerShowWork!.animateBack(
        0,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("---MediaQuery.of(context).size 2 = ${MediaQuery.of(context).size.width}");
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
              "Select triger 2",
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //All Trigers
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Trigers",
                        style: TextStyle(
                          fontFamily: NotificationsAppFonts.RobotoBold,
                          color: Color(0xff1B1717),
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedAllTrigers = !_selectedAllTrigers;
                          });
                        },
                        child: Container(
                          child: _selectedAllTrigers
                              ? SvgPicture.asset("assets/images/circle_full.svg")
                              : SvgPicture.asset("assets/images/circle_empty.svg"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffE6E6E6),
                  height: 1,
                  width: double.infinity,
                ),
              ],
            ),

            //Sport
            InkWell(
              onTap: () {
                setState(() {
                  if (_rotationSport) {
                    _controllerRotationSport!..forward(from: 0.0);
                  } else {
                    _controllerRotationSport!..reverse(from: 0.5);
                  }
                  _rotationSport = !_rotationSport;
                  _showSport();
                });
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23, top: 13.0, bottom: 13, right: 16),
                    child: Row(
                      children: [
                        RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0).animate(_controllerRotationSport!),
                          child: SvgPicture.asset("assets/images/arrow.svg")
                        ),
                        19.0.wsb,
                        Text(
                          "Sport",
                          style: TextStyle(
                            fontFamily: NotificationsAppFonts.RobotoBold,
                            color: Color(0xff1B1717),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _selectedAllSport = !_selectedAllSport;
                            });
                          },
                          child: _selectedAllSport
                              ? SvgPicture.asset("assets/images/circle_full.svg")
                              : SvgPicture.asset("assets/images/circle_empty.svg"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: _rotationSport ? 52 : 0),
                    color: Color(0xffF3F3F4),
                    height: !_rotationSport ? 0 : 1,
                    width: double.infinity,
                  ),
                ],
              ),
            ),

            //Morning
            SizeTransition(
              sizeFactor: _animationSport!,
              axis: Axis.vertical,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (_rotationMorning) {
                      _controllerRotationMorning!..forward(from: 0.0);
                    } else {
                      _controllerRotationMorning!..reverse(from: 0.5);
                    }
                    _rotationMorning = !_rotationMorning;
                    _showMorning();
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 19),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 1,
                                height: 25,
                                color: const Color(0xffF3F3F4),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 7,
                                    height: 1,
                                  ),
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: const Color(0xffF3F3F4),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 7,
                                    height: 1,
                                    color: const Color(0xffF3F3F4),
                                    // color:  Colors.red,
                                  ),
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 19,
                                color: const Color(0xffF3F3F4),
                              ),
                            ],
                          ),
                          19.4.wsb,
                          RotationTransition(
                              turns: Tween(begin: 0.0, end: 1.0).animate(_controllerRotationMorning!),
                              child: SvgPicture.asset("assets/images/arrow.svg")
                          ),
                          19.0.wsb,
                          Text(
                            "Morning",
                            style: TextStyle(
                              fontFamily: NotificationsAppFonts.RobotoBold,
                              color: Color(0xff1B1717),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                _selectedAllMorning = !_selectedAllMorning;
                              });
                            },
                            child: _selectedAllMorning
                                ? SvgPicture.asset("assets/images/circle_full.svg")
                                : SvgPicture.asset("assets/images/circle_empty.svg"),
                          ),
                          16.0.wsb,
                        ],
                      ),
                      ///TODO:
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.5),
                            color: Color(0xffF3F3F4),
                            // color: Colors.teal,
                            height: 1,
                            width: 1,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 70),
                            color: Color(0xffF3F3F4),
                            // color: Colors.red,
                            height: 1,
                            width: double.infinity,
                          ),
                        ],
                      ),

                      //Biking Running
                      InkWell(
                        onTap: () {},
                        child: SizeTransition(
                          sizeFactor: _animationMorning!,
                          axis: Axis.vertical,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    22.0.wsb,
                                    Container(
                                        width: 1,
                                        height: 100,
                                        // color: const Color(0xffF3F3F4),
                                        color: Colors.red,
                                        // color: Colors.orange,
                                    ),
                                  ],
                                ),
                              ),
                              15.0.wsb,
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 1,
                                      height: 23,
                                      // color: Colors.blue,
                                      color: const Color(0xffF3F3F4),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 1,
                                        ),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: const Color(0xffF3F3F4),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 7,
                                          height: 1,
                                          color: const Color(0xffF3F3F4),
                                          // color:  Colors.red,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 1,
                                      height: MediaQuery.of(context).size.width > 400 ? 43 : 40,
                                      color: const Color(0xffF3F3F4),
                                      // color: Colors.red,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 1,
                                        ),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: const Color(0xffF3F3F4),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 7,
                                          height: 1,
                                          color: const Color(0xffF3F3F4),
                                          // color:  Colors.red,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              11.5.wsb,
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      // Spacer(),
                                      12.0.hsb,
                                      Row(
                                        children: [
                                          Text(
                                            "🚴 Biking",
                                            style: TextStyle(
                                              fontFamily: NotificationsAppFonts.RobotoRegular,
                                              color: Color(0xff1B1717),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              setState(() {
                                                _selectedBiking = !_selectedBiking;
                                              });
                                            },
                                            child: _selectedBiking
                                                ? SvgPicture.asset("assets/images/circle_full.svg")
                                                : SvgPicture.asset("assets/images/circle_empty.svg"),
                                          ),
                                          16.0.wsb,
                                        ],
                                      ),
                                      12.0.hsb,
                                      // Spacer(),
                                      Container(
                                        color: Color(0xffF3F3F4),
                                        // color: Colors.purpleAccent,
                                        height: 1,
                                        width: double.infinity,
                                        // width: 300,
                                      ),
                                      12.0.hsb,
                                      Row(
                                        children: [
                                          Text(
                                            "🏃 Running",
                                            style: TextStyle(
                                              fontFamily: NotificationsAppFonts.RobotoRegular,
                                              color: Color(0xff1B1717),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              setState(() {
                                                _selectedRunning = !_selectedRunning;
                                              });
                                            },
                                            child: _selectedRunning
                                                ? SvgPicture.asset("assets/images/circle_full.svg")
                                                : SvgPicture.asset("assets/images/circle_empty.svg"),
                                          ),
                                          16.0.wsb,
                                        ],
                                      ),
                                      12.0.hsb,
                                      Container(
                                        color: Color(0xffE6E6E6),
                                        // color: Colors.blue,
                                        height: 1,
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
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

            //Evening
            SizeTransition(
              sizeFactor: _animationSport!,
              axis: Axis.vertical,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (_rotationEvening) {
                      _controllerRotationEvening!..forward(from: 0.0);
                    } else {
                      _controllerRotationEvening!..reverse(from: 0.5);
                    }
                    _rotationEvening = !_rotationEvening;
                    _showEvening();
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 19),
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 1,
                                height: 17,
                                // color: const Color(0xffF3F3F4),
                                color: Colors.blue,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 7,
                                    height: 1,
                                  ),
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: const Color(0xffF3F3F4),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 7,
                                    height: 1,
                                    color: const Color(0xffF3F3F4),
                                    // color:  Colors.red,
                                  ),
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 21,
                                color: const Color(0xffF3F3F4),
                              ),
                            ],
                          ),
                          19.4.wsb,
                          RotationTransition(
                              turns: Tween(begin: 0.0, end: 1.0).animate(_controllerRotationEvening!),
                              child: SvgPicture.asset("assets/images/arrow.svg")
                          ),
                          19.0.wsb,
                          Text(
                            "Evening",
                            style: TextStyle(
                              fontFamily: NotificationsAppFonts.RobotoBold,
                              color: Color(0xff1B1717),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                _selectedALLEvening = !_selectedALLEvening;
                              });
                            },
                            child: _selectedALLEvening
                                ? SvgPicture.asset("assets/images/circle_full.svg")
                                : SvgPicture.asset("assets/images/circle_empty.svg"),
                          ),
                          16.0.wsb,
                        ],
                      ),
                      ///TODO:
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.5),
                            // color: Color(0xffF3F3F4),
                            color: Colors.teal,
                            height: 1,
                            width: 1,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 70),
                            // color: Color(0xffF3F3F4),
                            color: Colors.red,
                            height: 1,
                            width: double.infinity,
                          ),
                        ],
                      ),

                      //Ping Pong Volleyball
                      InkWell(
                        onTap: () {},
                        child: SizeTransition(
                          sizeFactor: _animationEvening!,
                          axis: Axis.vertical,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    22.0.wsb,
                                    Container(
                                      width: 1,
                                      height: 100,
                                      // color: const Color(0xffF3F3F4),
                                      color: Colors.orange,
                                    ),
                                  ],
                                ),
                              ),
                              15.0.wsb,
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 1,
                                      height: 18,
                                      color: const Color(0xffF3F3F4),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 1,
                                        ),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: const Color(0xffF3F3F4),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 7,
                                          height: 1,
                                          color: const Color(0xffF3F3F4),
                                          // color:  Colors.red,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 1,
                                      height: MediaQuery.of(context).size.width > 400 ? 43 : 40,
                                      color: const Color(0xffF3F3F4),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 1,
                                        ),
                                        Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              color: const Color(0xffF3F3F4),
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 7,
                                          height: 1,
                                          color: const Color(0xffF3F3F4),
                                          // color:  Colors.red,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              11.5.wsb,
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      10.0.hsb,
                                      Row(
                                        children: [
                                          Text(
                                            "🏓 Ping Pong",
                                            style: TextStyle(
                                              fontFamily: NotificationsAppFonts.RobotoRegular,
                                              color: Color(0xff1B1717),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              setState(() {
                                                _selectedPingPong = !_selectedPingPong;
                                              });
                                            },
                                            child: _selectedPingPong
                                                ? SvgPicture.asset("assets/images/circle_full.svg")
                                                : SvgPicture.asset("assets/images/circle_empty.svg"),
                                          ),
                                          16.0.wsb,
                                        ],
                                      ),
                                      13.0.hsb,
                                      // Spacer(),
                                      Container(
                                        color: Color(0xffF3F3F4),
                                        // color: Colors.purpleAccent,
                                        height: 1,
                                        width: double.infinity,
                                        // width: 300,
                                      ),
                                      10.0.hsb,
                                      Row(
                                        children: [
                                          Text(
                                            "🏐 Volleyball",
                                            style: TextStyle(
                                              fontFamily: NotificationsAppFonts.RobotoRegular,
                                              color: Color(0xff1B1717),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              setState(() {
                                                _selectedVolleyball = !_selectedVolleyball;
                                              });
                                            },
                                            child: _selectedVolleyball
                                                ? SvgPicture.asset("assets/images/circle_full.svg")
                                                : SvgPicture.asset("assets/images/circle_empty.svg"),
                                          ),
                                          16.0.wsb,
                                        ],
                                      ),
                                      16.0.hsb,
                                      Container(
                                        color: Color(0xffE6E6E6),
                                        // color: Colors.blue,
                                        height: 1,
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
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

            //Boxing
            SizeTransition(
              sizeFactor: _animationSport!,
              axis: Axis.vertical,
              child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 19),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 1,
                                height: 20,
                                // color: const Color(0xffF3F3F4),
                                color: Colors.blue,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 7,
                                    height: 1,
                                  ),
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: const Color(0xffF3F3F4),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 7,
                                    height: 1,
                                    color: const Color(0xffF3F3F4),
                                    // color:  Colors.red,
                                  ),
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 20,
                                color: const Color(0xffF3F3F4),
                              ),
                            ],
                          ),
                          19.4.wsb,
                          Text(
                            "🥊 Boxing",
                            style: TextStyle(
                              fontFamily: NotificationsAppFonts.RobotoRegular,
                              color: Color(0xff1B1717),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                _selectedALLBoxing = !_selectedALLBoxing;
                              });
                            },
                            child: _selectedALLBoxing
                                ? SvgPicture.asset("assets/images/circle_full.svg")
                                : SvgPicture.asset("assets/images/circle_empty.svg"),
                          ),
                          16.0.wsb,
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.5),
                            color: Color(0xffF3F3F4),
                            // color: Colors.teal,
                            height: 1,
                            width: 1,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 40),
                            color: Color(0xffF3F3F4),
                            // color: Colors.red,
                            height: 1,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Football
            SizeTransition(
              sizeFactor: _animationSport!,
              axis: Axis.vertical,
              child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 19),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 1,
                                height: 20,
                                // color: const Color(0xffF3F3F4),
                                color: Colors.blue,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 7,
                                    height: 1,
                                  ),
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: const Color(0xffF3F3F4),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 7,
                                    height: 1,
                                    color: const Color(0xffF3F3F4),
                                    // color:  Colors.red,
                                  ),
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 21,
                                color: Colors.transparent,
                              ),
                            ],
                          ),
                          19.4.wsb,
                          Text(
                            "⚽ Football",
                            style: TextStyle(
                              fontFamily: NotificationsAppFonts.RobotoRegular,
                              color: Color(0xff1B1717),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                _selectedALLFootball = !_selectedALLFootball;
                              });
                            },
                            child: _selectedALLFootball
                                ? SvgPicture.asset("assets/images/circle_full.svg")
                                : SvgPicture.asset("assets/images/circle_empty.svg"),
                          ),
                          16.0.wsb,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              color: Color(0xffE6E6E6),
              height: 1,
              width: double.infinity,
            ),

            //Work
            InkWell(
              onTap: () {
                setState(() {
                  if (_rotationWork) {
                    _controllerRotationWork!..forward(from: 0.0);
                  } else {
                    _controllerRotationWork!..reverse(from: 0.5);
                  }
                  _rotationWork = !_rotationWork;
                  _showWork();
                });
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23, top: 13.0, bottom: 13, right: 16),
                    child: Row(
                      children: [
                        RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0).animate(_controllerRotationWork!),
                            child: SvgPicture.asset("assets/images/arrow.svg")
                        ),
                        19.0.wsb,
                        Text(
                          "Work",
                          style: TextStyle(
                            fontFamily: NotificationsAppFonts.RobotoBold,
                            color: Color(0xff1B1717),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _selectedAllWork = !_selectedAllWork;
                            });
                          },
                          child: _selectedAllWork
                              ? SvgPicture.asset("assets/images/circle_full.svg")
                              : SvgPicture.asset("assets/images/circle_empty.svg"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: _rotationWork ? 52 : 0),
                    color: Color(0xffF3F3F4),
                    // color: Colors.red,
                    height: _rotationWork ? 1 : 0,
                    width: double.infinity,
                  ),
                ],
              ),
            ),

            //Meeting Print document
            SizeTransition(
              sizeFactor: _animationWork!,
              axis: Axis.vertical,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.0.wsb,
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 1,
                          height: 20,
                          // color: const Color(0xffF3F3F4),
                          color: Colors.blue,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 7,
                              height: 1,
                            ),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: const Color(0xffF3F3F4),
                                  width: 1,
                                ),
                              ),
                            ),
                            Container(
                              width: 7,
                              height: 1,
                              color: const Color(0xffF3F3F4),
                              // color:  Colors.red,
                            ),
                          ],
                        ),
                        Container(
                          width: 1,
                          height: MediaQuery.of(context).size.width > 400 ? 47 : 40,
                          color: const Color(0xffF3F3F4),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 7,
                              height: 1,
                            ),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: const Color(0xffF3F3F4),
                                  width: 1,
                                ),
                              ),
                            ),
                            Container(
                              width: 7,
                              height: 1,
                              color: const Color(0xffF3F3F4),
                              // color:  Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  11.5.wsb,
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          11.0.hsb,
                          Row(
                            children: [
                              Text(
                                "🗓️ Meeting",
                                style: TextStyle(
                                  fontFamily: NotificationsAppFonts.RobotoRegular,
                                  color: Color(0xff1B1717),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    _selectedMeeting = !_selectedMeeting;
                                  });
                                },
                                child: _selectedMeeting
                                    ? SvgPicture.asset("assets/images/circle_full.svg")
                                    : SvgPicture.asset("assets/images/circle_empty.svg"),
                              ),
                              16.0.wsb,
                            ],
                          ),
                          11.0.hsb,
                          Container(
                            color: Color(0xffF3F3F4),
                            // color: Colors.purpleAccent,
                            height: 1,
                            width: double.infinity,
                            // width: 300,
                          ),
                          11.0.hsb,
                          Row(
                            children: [
                              Text(
                                "🖨️ Print document",
                                style: TextStyle(
                                  fontFamily: NotificationsAppFonts.RobotoRegular,
                                  color: Color(0xff1B1717),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    _selectedPrintDocument = !_selectedPrintDocument;
                                  });
                                },
                                child: _selectedPrintDocument
                                    ? SvgPicture.asset("assets/images/circle_full.svg")
                                    : SvgPicture.asset("assets/images/circle_empty.svg"),
                              ),
                              16.0.wsb,
                            ],
                          ),
                          16.0.hsb,
                          // Container(
                          //   // color: Color(0xffE6E6E6),
                          //   color: Colors.blue,
                          //   height: 1,
                          //   width: double.infinity,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Alarm
            Column(
              children: [
                Container(
                  color: Color(0xffE6E6E6),
                  // color: Colors.red,
                  height: 1,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Text(
                        "⏰ Alarm",
                        style: TextStyle(
                          fontFamily: NotificationsAppFonts.RobotoRegular,
                          color: Color(0xff1B1717),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _selectedAllAlarm = !_selectedAllAlarm;
                          });
                        },
                        child: _selectedAllAlarm
                            ? SvgPicture.asset("assets/images/circle_full.svg")
                            : SvgPicture.asset("assets/images/circle_empty.svg"),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffE6E6E6),
                  // color: Colors.red,
                  height: 1,
                  width: double.infinity,
                ),
              ],
            ),

            //Party
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Text(
                        "🎉 Party",
                        style: TextStyle(
                          fontFamily: NotificationsAppFonts.RobotoRegular,
                          color: Color(0xff1B1717),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _selectedAllParty = !_selectedAllParty;
                          });
                        },
                        child: _selectedAllParty
                            ? SvgPicture.asset("assets/images/circle_full.svg")
                            : SvgPicture.asset("assets/images/circle_empty.svg"),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffE6E6E6),
                  // color: Colors.red,
                  height: 1,
                  width: double.infinity,
                ),
              ],
            ),

            //Dinner
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Row(
                    children: [
                      Text(
                        "🍜 Dinner",
                        style: TextStyle(
                          fontFamily: NotificationsAppFonts.RobotoRegular,
                          color: Color(0xff1B1717),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _selectedAllDinner = !_selectedAllDinner;
                          });
                        },
                        child: _selectedAllDinner
                            ? SvgPicture.asset("assets/images/circle_full.svg")
                            : SvgPicture.asset("assets/images/circle_empty.svg"),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Color(0xffE6E6E6),
                  // color: Colors.red,
                  height: 1,
                  width: double.infinity,
                ),
              ],
            ),

            40.0.hsb,
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 116,
        child: InkWell(
          onTap: () {
              Navigator.of(context).pop();
            },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0, -7),
                    ),
                  ],
                ),
                height: 16,
              ),
              Container(
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 35, left: 15, right: 15),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xff6A4DBA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontFamily: NotificationsAppFonts.RobotoBold,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
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
