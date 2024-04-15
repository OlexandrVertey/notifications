import 'package:flutter/material.dart';
import 'package:notifications/extension/sized_box_extension.dart';

class EnterTimeWidget extends StatefulWidget {
  const EnterTimeWidget({Key? key,
    required this.codeController,
    // required this.viewInsetsBottom,
    this.timeError,
    required this.callBack
  }) : super(key: key);

  final TextEditingController codeController;
  final bool? timeError;
  final Function callBack;

  @override
  State<EnterTimeWidget> createState() => _EnterTimeWidgetState();
}

class _EnterTimeWidgetState extends State<EnterTimeWidget> {

  List<String> _otpCodes = [' ', ' ', ' ', ' '];
  List<bool> _showDot = [false, false, false, false];
  bool _viewInsetsBottom = false;

  @override
  Widget build(BuildContext context) {
    if(widget.codeController.text.length == 4) {
      _otpCodes[0] = widget.codeController.text.substring(0, 1);
      _otpCodes[1] = widget.codeController.text.substring(1, 2);
      _otpCodes[2] = widget.codeController.text.substring(2, 3);
      _otpCodes[3] = widget.codeController.text.substring(3, 4);

      _showDot[0] = false;
      _showDot[1] = false;
      _showDot[2] = false;
      _showDot[3] = false;
    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          children: [
            _otpCodeFieldWidget(0, _showDot[0]),
            12.0.wsb,
            _otpCodeFieldWidget(1, _showDot[1]),
            11.0.wsb,
            const Text(
              ":",
              style: TextStyle(
                color: Color(0xffB9B9B9),
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            11.0.wsb,
            _otpCodeFieldWidget(2, _showDot[2]),
            12.0.wsb,
            _otpCodeFieldWidget(3, _showDot[3]),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          width: 280,
          height: 48,
          child: TextField(
            enableInteractiveSelection: false,
            onTap: () {
              if (widget.codeController.text.isEmpty) {
                _otpCodes = [' ', ' ', ' ', ' '];
                _showDot = [true, false, false, false];
                _viewInsetsBottom = true;
                setState(() {});
              }
            },
            onChanged: (text) {
              setState(() {});
              if(widget.codeController.text.isEmpty) {
                _otpCodes[0] = ' ';
                _otpCodes[1] = ' ';
                _otpCodes[2] = ' ';
                _otpCodes[3] = ' ';

                _showDot[0] = true;
                _showDot[1] = false;
                _showDot[2] = false;
                _showDot[3] = false;
              } else if(widget.codeController.text.length == 1) {
                _otpCodes[0] = text.substring(0, 1);
                _otpCodes[1] = ' ';
                _otpCodes[2] = ' ';
                _otpCodes[3] = ' ';

                _showDot[0] = false;
                _showDot[1] = true;
                _showDot[2] = false;
                _showDot[3] = false;
              } else if(widget.codeController.text.length == 2) {
                _otpCodes[1] = text.substring(1, 2);
                _otpCodes[2] = ' ';
                _otpCodes[3] = ' ';

                _showDot[0] = false;
                _showDot[1] = false;
                _showDot[2] = true;
                _showDot[3] = false;
              } else if(widget.codeController.text.length == 3) {
                _otpCodes[2] = text.substring(2, 3);
                _otpCodes[3] = ' ';

                _showDot[0] = false;
                _showDot[1] = false;
                _showDot[2] = false;
                _showDot[3] = true;
              } else if(widget.codeController.text.length == 4) {
                _otpCodes[0] = text.substring(0, 1);
                _otpCodes[1] = text.substring(1, 2);
                _otpCodes[2] = text.substring(2, 3);
                _otpCodes[3] = text.substring(3, 4);

                _showDot[0] = false;
                _showDot[1] = false;
                _showDot[2] = false;
                _showDot[3] = false;
                FocusManager.instance.primaryFocus?.unfocus();
              }
              widget.callBack();
            },
            showCursor: false,
            scrollController: ScrollController(),
            controller: widget.codeController,
            maxLength: 4,
            keyboardType: TextInputType.number,
            style: const TextStyle(
              color: Colors.transparent,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
              counterText: '',
              isDense: true,
              border: InputBorder.none,
              hintText: "",
              contentPadding: EdgeInsets.all(0.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _otpCodeFieldWidget(int index, bool showDot) {
    return Container(
      padding: EdgeInsets.only(bottom: _otpCodes[index] != ' ' ? 0 : 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: widget.timeError != null && widget.timeError! && !_viewInsetsBottom
              ? const Color(0xffF43528)
              : showDot
              ? const Color(0xff6A4DBA)
              : const Color(0xffE6E6E6),
          width: 1,
        ),
      ),
      width: 44,
      height: 48,
      child: !showDot
          ? Text(
        _otpCodes[index],
        style: const TextStyle(
          color: Color(0xff1A1717),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),      )
          : const Text(
        '|',
        style: TextStyle(
          color: Color(0xff1A1717),
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
