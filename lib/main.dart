import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/theme/bloc/theme_bloc.dart';
import 'package:classified_app/global/theme/theme_info.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/article_list/bloc/article_list_bloc.dart';
import 'package:classified_app/ui/article_profile/bloc/article_profile_bloc.dart';
import 'package:classified_app/ui/carousel/bloc/carousel_bloc.dart';
import 'package:classified_app/ui/categories_list/bloc/category_list_bloc.dart';
import 'package:classified_app/ui/challan_list/bloc/challan_bloc.dart';
import 'package:classified_app/ui/challan_list/challan_list.dart';
import 'package:classified_app/ui/classifield_list/bloc/classified_list_bloc.dart';
import 'package:classified_app/ui/classifield_profile/bloc/classified_profile_bloc.dart';
import 'package:classified_app/ui/company_selection/bloc/company_selection_bloc.dart';
import 'package:classified_app/ui/faqs/bloc/faqs_bloc.dart';
import 'package:classified_app/ui/get_best_deal/bloc/bestdeal_bloc.dart';
import 'package:classified_app/ui/banner-ad/bloc/banner_bloc.dart';
import 'package:classified_app/ui/home/bloc/home_bloc.dart';
import 'package:classified_app/ui/module_type/bloc/module_selection_bloc.dart';
import 'package:classified_app/ui/notifications/bloc/notification_bloc.dart';
import 'package:classified_app/ui/review/bloc/review_bloc.dart';
import 'package:classified_app/ui/role_selection/bloc/role_selection_bloc.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  //getLoggedInUser();
  await di.initDI();
  di.sl<FirebaseApp>();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: providers(), child: buildMaterialApp());
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
          home: ChallanList(),
          // initialRoute: RouteStrings.Home,
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
      BlocProvider<ChallanBloc>(
          create: (context) => di.sl<ChallanBloc>()
            //!Remove this initial call as soon as there is code on Dashboard linking with challlan list...
            ..add(LoadChallan())),
      // BlocProvider<NotificationBloc>(
      //     create: (context) => di.sl<NotificationBloc>()),
      BlocProvider<AuthenticationBloc>(
          create: (context) => di.sl<AuthenticationBloc>()..add(AppStarted())),
      BlocProvider<UserBloc>(
          create: (context) => di.sl<UserBloc>()..add(CheckUserEvent())),
      BlocProvider<CompanySelectionBloc>(
          create: (context) => di.sl<CompanySelectionBloc>()),
      BlocProvider<RoleSelectionBloc>(
          create: (context) => di.sl<RoleSelectionBloc>()),
      BlocProvider<ModuleSelectionBloc>(
          create: (context) => di.sl<ModuleSelectionBloc>()),
      BlocProvider<ThemeBloc>(
          create: (context) =>
              di.sl<ThemeBloc>()..add(ThemeEvent(isDarkTheme))),
      BlocProvider<SettingsBloc>(
        create: (context) => di.sl<SettingsBloc>()..add(LoadSettings()),
      ),
    ];
  }
}
