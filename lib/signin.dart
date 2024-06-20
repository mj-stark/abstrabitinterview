import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin:
              EdgeInsets.all(8.0), // Add margin to shrink the touch area a bit
          decoration: BoxDecoration(
            color: Colors.lightBlue[100], // Light blue background
            shape: BoxShape.circle, // Circular shape
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.purple), // Purple icon
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Welcome Back!',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent, // Make the app bar transparent
      ),
      // Use SafeArea to avoid overlap with system UI (like the keyboard)
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Enter the required details to access your account and find the right tutor for you.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                'Username/Email',
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Changes position of shadow
                    ),
                  ],
                  borderRadius:
                      BorderRadius.circular(12), // Border radius for container
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your username or email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          12.r), // Border radius for input border
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password
                    print("Forgot Password tapped");
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: Container(
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
                            return HomePage();
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
              ),
              SizedBox(height: 230.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle "Don't have an account" action
                    print("Don't have an account tapped");
                  },
                  child: Text(
                    "I don't have an account",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h), // Adding extra space at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
