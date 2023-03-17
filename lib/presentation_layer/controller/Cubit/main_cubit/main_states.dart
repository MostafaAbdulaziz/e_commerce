abstract class MainStates{}
class InitialMainState extends MainStates{}
//Nav between screens  of buttonNavigationBar
class NavBetweenScreenState extends MainStates{}

//change mode of app
class ChangeModeState extends MainStates{}

//sign out of account
class SignOutSuccessState extends MainStates{}
class SignOutErrorState extends MainStates{
  final String error;
  SignOutErrorState(this.error);
}

//get products from api
class GetProductsLoadingState extends MainStates{}
class GetProductsSuccessState extends MainStates{}
class GetProductsErrorState extends MainStates{
  final String error;
  GetProductsErrorState(this.error);
}

//favourite products state
class FavouriteProductsState extends MainStates{}
