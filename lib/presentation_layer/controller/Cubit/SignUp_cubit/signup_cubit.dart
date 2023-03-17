import 'package:bloc/bloc.dart';
import 'package:e_commerce/presentation_layer/controller/Cubit/SignUp_cubit/signup_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/routes/routes_screens.dart';
import '../../../screens/main_screen.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(InitialSignUpState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  bool isNotVisible = true;
  IconData iconPassword = Icons.visibility_off_sharp;
  void changeIconOfPassword() {
    isNotVisible = !isNotVisible;
    iconPassword = isNotVisible ? Icons.visibility : Icons.visibility_off_sharp;
    emit(ChangeIconOfPassword());
  }

  bool isNotCheck = true;
  dynamic checkIconConditions = null;
  void checkConditions() {
    isNotCheck = !isNotCheck;
    checkIconConditions = isNotCheck ? null : Icons.check;
    emit(CheckIconConditionState());
  }

  void createAccount(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) {
    //if(checkIconConditions==Icons.check){
      emit(CreateUserAccountLoadingState());
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Fluttertoast.showToast(
            msg: 'your Account Created',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        pushAndRemove(context,const MainScreen());
        emit(CreateUserAccountSuccessState());
      }).catchError((error) {
        Fluttertoast.showToast(
            msg: error.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        print('error :${error.toString()}');
        emit(CreateUserAccountErrorState(error.toString()));
      });
    // }else{
    //   Fluttertoast.showToast(
    //       msg: 'accord in the conditions',
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.orange,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );    }
  }
}
