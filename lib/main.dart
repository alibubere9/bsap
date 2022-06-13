import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/theme/bloc/theme_bloc.dart';
import 'package:classified_app/global/theme/theme_info.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/article_list/bloc/article_list_bloc.dart';
import 'package:classified_app/ui/article_profile/bloc/article_profile_bloc.dart';
import 'package:classified_app/ui/carousel/bloc/carousel_bloc.dart';
import 'package:classified_app/ui/categories_list/bloc/category_list_bloc.dart';
import 'package:classified_app/ui/classifield_list/bloc/classified_list_bloc.dart';
import 'package:classified_app/ui/classifield_profile/bloc/classified_profile_bloc.dart';
import 'package:classified_app/ui/faqs/bloc/faqs_bloc.dart';
import 'package:classified_app/ui/get_best_deal/bloc/bestdeal_bloc.dart';
import 'package:classified_app/ui/banner-ad/bloc/banner_bloc.dart';
import 'package:classified_app/ui/home/bloc/home_bloc.dart';
import 'package:classified_app/ui/notifications/bloc/notification_bloc.dart';
import 'package:classified_app/ui/review/bloc/review_bloc.dart';
import 'package:classified_app/ui/settings/bloc/settings_bloc.dart';
import 'package:classified_app/ui/sub_categories_list/bloc/sub_category_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;
import 'ui/user/bloc/user_bloc.dart';
import 'services/interfaces/i_theme_service.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // getLoggedInUser();
  // await di.initDI();
  // di.sl<FirebaseApp>();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "B-Sap",
      home: Scaffold(
          body: Center(
              child: Text(
        "B-Sap",
        style: TextStyle(fontSize: 122, color: Theme.of(context).primaryColor),
      ))),
    );

    //MultiBlocProvider(providers: providers(), child: buildMaterialApp());
  }

  Widget buildMaterialApp() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: ConstantStrings.appName,
          navigatorKey: NavRouter.navKey,
          themeMode: state.themeMode,
          theme: Themes.lightThemeData,
          darkTheme: Themes.darkThemeData,
          initialRoute: RouteStrings.Home,
          onGenerateRoute: (settings) => NavRouter.onGenerateRoute(settings),
        );
      },
    );
  }

  List<BlocProvider> providers() {
    bool isDarkTheme = di.sl<IThemeService>().isDark;
    return [
      BlocProvider<HomeBloc>(
          create: (context) => di.sl<HomeBloc>()..add(LoadHome())),
      BlocProvider<CategoryListBloc>(
          create: (context) =>
              di.sl<CategoryListBloc>()..add(LoadCategories())),
      BlocProvider<ClassifiedProfileBloc>(
          create: (context) => di.sl<ClassifiedProfileBloc>()),
      BlocProvider<FaqsBloc>(create: (context) => di.sl<FaqsBloc>()),
      BlocProvider<BestDealBloc>(create: (context) => di.sl<BestDealBloc>()),
      BlocProvider<ArticleProfileBloc>(
          create: (context) => di.sl<ArticleProfileBloc>()),
      BlocProvider<NotificationBloc>(
          create: (context) => di.sl<NotificationBloc>()),
      BlocProvider<ClassifiedListBloc>(
          create: (context) => di.sl<ClassifiedListBloc>()),
      BlocProvider<ArticleListBloc>(
          create: (context) => di.sl<ArticleListBloc>()),
      BlocProvider<AuthenticationBloc>(
          create: (context) => di.sl<AuthenticationBloc>()..add(AppStarted())),
      BlocProvider<UserBloc>(
          create: (context) => di.sl<UserBloc>()..add(CheckUserEvent())),
      BlocProvider<ReviewBloc>(create: (context) => di.sl<ReviewBloc>()),
      BlocProvider<ThemeBloc>(
          create: (context) =>
              di.sl<ThemeBloc>()..add(ThemeEvent(isDarkTheme))),
      BlocProvider<BannerBloc>(create: (context) => di.sl<BannerBloc>()),
      BlocProvider<SubCategoryBloc>(
        create: (context) => di.sl<SubCategoryBloc>(),
      ),
      BlocProvider<SettingsBloc>(
        create: (context) => di.sl<SettingsBloc>()..add(LoadSettings()),
      ),
      BlocProvider<CarouselBloc>(
        create: (context) => di.sl<CarouselBloc>()..add(LoadCarousels()),
      ),
    ];
  }
}
