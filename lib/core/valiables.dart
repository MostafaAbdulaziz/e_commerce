import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Scale of email and password
String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String validationName = r'^[a-z A-Z]+$';
String baseUrl = 'https://fakestoreapi.com';

// controller of email and password in login screen
var emailLoginController = TextEditingController();
var passwordLoginController = TextEditingController();

// controller of email and password in SignUp screen
var emailSignUpController = TextEditingController();
var passwordSignUpController = TextEditingController();
var nameSignUpController = TextEditingController();

// controller of email and password in Forget password screen
var emailForgetPasswordController = TextEditingController();

//controller of carouselController
CarouselController carouselController=CarouselController();
PageController pageController=PageController();

//variable of firebase
var googleSignIn=GoogleSignIn();
var disPlayaName='';

//controller of search
var searchController = TextEditingController();
bool isDark=true;
bool? cacheMode;
Widget? widget;
String? userId;
String costUrl='https://fakestoreapi.com';

