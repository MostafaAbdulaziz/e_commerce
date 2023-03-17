//main classes states
abstract class LoginState{}
class InitialLoginState extends LoginState{}

//change icon of password state
class ChangeIconOfPassword extends LoginState{}

//check Icon Condition state
class CheckIconConditionState extends LoginState{}

//login with email and password
class LoginWithEmAndPassLoadingState extends LoginState{}
class LoginWithEmAndPassSuccessState extends LoginState{}
class LoginWithEmAndPassErrorState extends LoginState{
  final String error;
  LoginWithEmAndPassErrorState(this.error);
}

//forget password of email
class ForgetPasswordSuccessState extends LoginState{}
class ForgetPasswordErrorState extends LoginState{
  final String error;
  ForgetPasswordErrorState(this.error);
}

//login main screen with google Account
class LoginWithGoogleSuccessState extends LoginState{}
class LoginWithGoogleErrorState extends LoginState{
  final String error;
  LoginWithGoogleErrorState(this.error);
}



