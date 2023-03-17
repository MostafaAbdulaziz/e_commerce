import 'package:bloc/bloc.dart';
import 'package:e_commerce/presentation_layer/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/routes/routes_screens.dart';
import '../../../../core/valiables.dart';
import '../../../screens/main_screen.dart';
import '../shared_prefrances.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isNotVisible = true;
  IconData iconPassword = Icons.visibility_off_sharp;

  //function of change icon of password
  void changeIconOfPassword() {
    isNotVisible = !isNotVisible;
    iconPassword = isNotVisible ? Icons.visibility_off_sharp : Icons.visibility;
    emit(ChangeIconOfPassword());
  }

  //function of change of check button
  bool isNotCheck = true;
  dynamic checkIconConditions = null;
  void checkConditions() {
    isNotCheck = !isNotCheck;
    checkIconConditions = isNotCheck ? null : Icons.check;
    emit(CheckIconConditionState());
  }

  //function of login with email and password of user
  void loginWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) {
    if (checkIconConditions == Icons.check) {
      emit(LoginWithEmAndPassLoadingState());
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Fluttertoast.showToast(
            msg: 'login done',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        CacheHelper.saveData(key: 'userId', value: value.user!.uid);
        print(value.user!.uid);
        emailLoginController.text='';
        passwordLoginController.text='';
        pushAndRemove(context, const MainScreen());
        emit(LoginWithEmAndPassSuccessState());
      }).catchError((error) {
        print(error.toString());
        if (error.toString() ==
            '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.') {
          Fluttertoast.showToast(
              msg: 'please connect with network',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          Fluttertoast.showToast(
              msg: error.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        emit(LoginWithEmAndPassErrorState(error.toString()));
      });
    } else {
      Fluttertoast.showToast(
          msg: 'accord in the Conditions',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void forgetPasswordOfEmail(
      {required String email, required BuildContext context}) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      Fluttertoast.showToast(
          msg: 'send notification to your gmail is done',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      routeScreen(context: context, screen: const LoginScreen());
      emit(ForgetPasswordSuccessState());
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(ForgetPasswordErrorState(error.toString()));
    });
  }

  Future<UserCredential> loginUsingGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
