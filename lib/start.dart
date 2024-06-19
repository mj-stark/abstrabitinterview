import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'signin.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _mentorGroupValue = 0;
  int _menteeGroupValue = 1;
  bool _isMentorSelected = false;
  bool _isMenteeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            const LogoWidget(),
            SizedBox(height: 20.h),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AnimatedSelectionWidget(
                    text: 'I am Mentor',
                    selectedColor: Colors.purple,
                    isSelected: _isMentorSelected,
                    onChanged: (selected) {
                      setState(() {
                        _isMentorSelected = selected;
                        if (_isMentorSelected) {
                          _isMenteeSelected = false;
                        }
                      });
                    },
                    groupValue: _mentorGroupValue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AnimatedSelectionWidget(
                    text: 'I am Mentee',
                    selectedColor: Colors.purple,
                    isSelected: _isMenteeSelected,
                    onChanged: (selected) {
                      setState(() {
                        _isMenteeSelected = selected;
                        if (_isMenteeSelected) {
                          _isMentorSelected = false;
                        }
                      });
                    },
                    groupValue: _menteeGroupValue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Container(
              height: 45.h,
              width: 350.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.purple, width: 1),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SigninPage();
                        },
                      ),
                    );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              height: 45.h,
              width: 350.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.purple, width: 1),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.purple,
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    
                  ),
                ),
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: 500.w,
      height: 200.h,
    );
  }
}

class AnimatedSelectionWidget extends StatefulWidget {
  final String text;
  final Color selectedColor;
  final bool isSelected;
  final ValueChanged<bool> onChanged;
  final int groupValue;

  const AnimatedSelectionWidget({
    Key? key,
    required this.text,
    required this.selectedColor,
    required this.isSelected,
    required this.onChanged,
    required this.groupValue,
  }) : super(key: key);

  @override
  _AnimatedSelectionWidgetState createState() => _AnimatedSelectionWidgetState();
}

class _AnimatedSelectionWidgetState extends State<AnimatedSelectionWidget> {
  late Color _backgroundColor;
  late Color _borderColor;
  late Color _textColor;

  @override
  void initState() {
    super.initState();
    _updateColors();
    _textColor = Colors.black; // Initial text color
  }

  void _updateColors() {
    _backgroundColor = widget.isSelected ? widget.selectedColor.withOpacity(0.1) : Colors.transparent;
    _borderColor = widget.isSelected ? widget.selectedColor : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.isSelected) {
          widget.onChanged(true);
          setState(() {
            _backgroundColor = widget.selectedColor.withOpacity(0.1);
            _borderColor = widget.selectedColor;
            _textColor = Colors.purple; // Change text color to turquoise
          });
          Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              _backgroundColor = Colors.transparent;
              _borderColor = Colors.purple;
              _textColor = Colors.purple; // Reset text color after animation
            });
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: _backgroundColor,
            border: Border.all(color: _borderColor, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Radio<int>(
                  value: widget.groupValue,
                  groupValue: widget.isSelected ? widget.groupValue : -1,
                  onChanged: (value) {
                    if (value != null && value != -1) {
                      widget.onChanged(true);
                      setState(() {
                        _backgroundColor = widget.selectedColor.withOpacity(0.1);
                        _borderColor = widget.selectedColor;
                        _textColor = Colors.purple; // Change text color to turquoise
                      });
                      Future.delayed(const Duration(milliseconds: 300), () {
                        setState(() {
                          _backgroundColor = Colors.transparent;
                          _borderColor = Colors.purple;
                          _textColor = Colors.black; // Reset text color after animation
                        });
                      });
                    }
                  },
                  activeColor: widget.selectedColor,
                ),
              ),
              Text(
                widget.text,
                style: TextStyle(color: _textColor), // Apply text color
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedSelectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateColors();
  }
}

