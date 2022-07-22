import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/theme/bloc/theme_bloc.dart';
import 'package:classified_app/global/theme/theme_info.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/bale_list/bloc/bales_list_bloc.dart';
import 'package:classified_app/ui/challan_list/bloc/challan_bloc.dart';
import 'package:classified_app/ui/company_selection/bloc/company_selection_bloc.dart';
import 'package:classified_app/ui/home/bloc/home_bloc.dart';
import 'package:classified_app/ui/module_type/bloc/module_selection_bloc.dart';
import 'package:classified_app/ui/role_selection/bloc/role_selection_bloc.dart';
import 'package:classified_app/ui/settings/bloc/settings_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;
import 'ui/bale_meter_entry/bloc/bale_meter_bloc.dart';
import 'ui/challan_meter_entry/bloc/meter_entry_bloc.dart';
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
      BlocProvider<ChallanBloc>(create: (context) => di.sl<ChallanBloc>()),
      BlocProvider<BalesListBloc>(create: (context) => di.sl<BalesListBloc>()),
      BlocProvider<MeterEntryBloc>(
          create: (context) => di.sl<MeterEntryBloc>()),
      BlocProvider<BaleMeterBloc>(create: (context) => di.sl<BaleMeterBloc>()),
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
