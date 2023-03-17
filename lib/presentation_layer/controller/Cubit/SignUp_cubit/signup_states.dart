//main classes states
abstract class SignUpState{}
class InitialSignUpState extends SignUpState{}

//change icon of password state
class ChangeIconOfPassword extends SignUpState{}

//check Icon Condition state
class CheckIconConditionState extends SignUpState{}

//firebase auth : Create Account with email and password

class CreateUserAccountLoadingState extends SignUpState{}
class CreateUserAccountSuccessState extends SignUpState{}
class CreateUserAccountErrorState extends SignUpState{
  final String error;
  CreateUserAccountErrorState(this.error);
}

