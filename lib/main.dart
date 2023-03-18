import 'package:e_commerce/core/valiables.dart';
import 'package:e_commerce/presentation_layer/screens/favorites_screen.dart';
import 'package:e_commerce/presentation_layer/screens/main_screen.dart';
import 'package:e_commerce/presentation_layer/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/colors_app.dart';
import 'presentation_layer/controller/Cubit/main_cubit/main_cubit.dart';
import 'presentation_layer/controller/Cubit/main_cubit/main_states.dart';
import 'presentation_layer/controller/Cubit/shared_prefrances.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  //cacheMode = CacheHelper.getData(key: 'isDark') as bool;
  userId = CacheHelper.getData(key: 'userId');
  if (userId != null) {
    widget = const MainScreen();
  } else {
    widget = const WelcomeScreen();
  }
  runApp(MyApp(
    startScreen: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startScreen;
  MyApp({this.startScreen});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainCubit()
        ..modeApp()
        ..getProductsFromAApi(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'MoApp',
              home: FavoriteScreen(),
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    centerTitle: true,
                    elevation: 0.0,
                    shadowColor: Colors.white,
                    backgroundColor: ColorsApp.mainColor,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: ColorsApp.darkGreyClr,
                        statusBarIconBrightness: Brightness.light),
                  )),
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: ColorsApp.darkGreyClr,
                  appBarTheme: const AppBarTheme(
                    centerTitle: true,
                    elevation: 0.0,
                    shadowColor: ColorsApp.darkGreyClr,
                    backgroundColor: ColorsApp.darkGreyClr,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: ColorsApp.darkGreyClr,
                        statusBarIconBrightness: Brightness.light),
                  )),
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light);
        },
      ),
    );
  }
}
