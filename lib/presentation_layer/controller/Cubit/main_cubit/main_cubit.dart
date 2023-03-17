import 'package:bloc/bloc.dart';
import 'package:e_commerce/services/api/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/lists.dart';
import '../../../../core/routes/routes_screens.dart';
import '../../../../core/valiables.dart';
import '../../../screens/login_screen.dart';
import '../shared_prefrances.dart';
import 'main_states.dart';


class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialMainState());
  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void navBetweenScreen(int index) {
    currentIndex = index;
    emit(NavBetweenScreenState());
  }

  //bool isDark=true;
  void changeMode() {
    isDark = !isDark;
    print(isDark);
    CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
      emit(ChangeModeState());
    });
  }

  void modeApp() {
    if (cacheMode != null)
    {
      isDark = cacheMode!;
    }else{
      isDark=true;
    }
  }

  void signUpWithEmailAndPass(BuildContext context) {
    FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.removeData(key: 'userId');
      pushAndRemove(context, const LoginScreen());
      emit(SignOutSuccessState());
    }).catchError((error) {
      emit(SignOutErrorState(error.toString()));
    });
  }

  void getProductsFromAApi() {
    emit(GetProductsLoadingState());
    DioHelper.getDataWithApi(base: '$costUrl/products').then((value) {
      value.data.forEach((element){
        products.add(element);
      });
      emit(GetProductsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductsErrorState(error.toString()));
    });
  }
  bool isFavourite=false;
  Widget iconFavourite=const Icon(Icons.favorite,color: Colors.black,) ;
  void addFavouriteProducts(int index)
  {
    isFavourite=!isFavourite;
    if(isFavourite==true)
      {
        favouriteProducts.add(products[index]);
        iconFavourite=const Icon(Icons.favorite,color: Colors.red,) ;
        print('add  to ${favouriteProducts.length}');
      }else{
      favouriteProducts.remove(products[index]);
      iconFavourite=const Icon(Icons.favorite,color: Colors.black,) ;
      print('remove  from ${favouriteProducts.length}');
    }
    print(favouriteProducts);
    emit(FavouriteProductsState());

  }
}
