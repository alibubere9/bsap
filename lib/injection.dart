import 'package:classified_app/data/repositories/app_message_repo.dart';
import 'package:classified_app/data/repositories/best_deal_repo.dart';
import 'package:classified_app/data/repositories/carousel_repository.dart';
import 'package:classified_app/data/repositories/chaalan_repository.dart';
import 'package:classified_app/data/repositories/interfaces/i_app_message_repo.dart';
import 'package:classified_app/data/repositories/interfaces/i_best_deal.dart';
import 'package:classified_app/data/repositories/interfaces/i_carousel_repository.dart';
import 'package:classified_app/data/repositories/interfaces/i_challan_repository.dart';
import 'package:classified_app/data/repositories/interfaces/i_company_selection_repo.dart';
import 'package:classified_app/data/repositories/interfaces/i_jobber_repository.dart';
import 'package:classified_app/data/repositories/interfaces/i_system_info_repository.dart';
import 'package:classified_app/data/repositories/jobber_repository.dart';
import 'package:classified_app/data/repositories/system_info_repository.dart';
import 'package:classified_app/environment/environment_switch.dart';
import 'package:classified_app/environment/i_environment_switch.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';
import 'package:classified_app/network/advance_http_handler/handling_service.dart';
import 'package:classified_app/network/advance_http_handler/interfaces/handler.dart';
import 'package:classified_app/services/classified_service.dart';
import 'package:classified_app/services/force_update.dart';
import 'package:classified_app/services/interfaces/i_force_update.dart';
import 'package:classified_app/services/interfaces/i_notification_service.dart';
import 'package:classified_app/services/notification_service.dart';
import 'package:classified_app/ui/bale_list/bloc/bales_list_bloc.dart';
import 'package:classified_app/ui/bale_meter_entry/bloc/bale_meter_bloc.dart';
import 'package:classified_app/ui/carousel/bloc/carousel_bloc.dart';
import 'package:classified_app/ui/categories_list/bloc/category_list_bloc.dart';
import 'package:classified_app/ui/challan_list/bloc/challan_bloc.dart';
import 'package:classified_app/ui/challan_meter_entry/bloc/meter_entry_bloc.dart';
import 'package:classified_app/ui/classifield_profile/bloc/classified_profile_bloc.dart';
import 'package:classified_app/ui/company_selection/bloc/company_selection_bloc.dart';
import 'package:classified_app/ui/faqs/bloc/faqs_bloc.dart';
import 'package:classified_app/ui/get_best_deal/bloc/bestdeal_bloc.dart';
import 'package:classified_app/ui/banner-ad/bloc/banner_bloc.dart';
import 'package:classified_app/ui/login/bloc/login_bloc.dart';
import 'package:classified_app/ui/meter_actual/bloc/meter_actual_bloc.dart';
import 'package:classified_app/ui/review/bloc/review_bloc.dart';
import 'package:classified_app/services/interfaces/i_user_service.dart';
import 'package:classified_app/services/user_service.dart';
import 'package:classified_app/ui/article_profile/bloc/article_profile_bloc.dart';
import 'package:classified_app/ui/role_selection/bloc/role_selection_bloc.dart';
import 'package:classified_app/ui/settings/bloc/settings_bloc.dart';
import 'package:classified_app/ui/user/bloc/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:classified_app/data/repositories/interfaces/i_user_repository.dart';
import 'package:classified_app/data/repositories/user_repository.dart';
import 'package:classified_app/global/theme/bloc/theme_bloc.dart';
import 'package:classified_app/services/interfaces/i_theme_service.dart';
import 'package:classified_app/services/theme_service.dart';
import 'package:classified_app/services/sub_category_service.dart';
import 'package:classified_app/services/interfaces/i_location_service.dart';
import 'package:classified_app/services/location_service.dart';
import 'package:classified_app/ui/home/bloc/home_bloc.dart';
import 'package:classified_app/ui/notifications/bloc/notification_bloc.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/repositories/bale_meter_entry_repo.dart';
import 'data/repositories/bale_repository.dart';
import 'data/repositories/best_deal_repo.dart';
import 'data/repositories/carousel_repository.dart';
import 'data/repositories/company_selection_repo.dart';
import 'data/repositories/entry_section_repo.dart';
import 'data/repositories/faqs_repository.dart';
import 'data/repositories/interfaces/i_app_message_repo.dart';
import 'data/repositories/interfaces/i_bale_meter_entry_repo.dart';
import 'data/repositories/interfaces/i_bale_repository.dart';
import 'data/repositories/interfaces/i_best_deal.dart';
import 'data/repositories/interfaces/i_carousel_repository.dart';
import 'data/repositories/interfaces/i_entry_section_repo.dart';
import 'data/repositories/interfaces/i_faqs_repository.dart';
import 'data/repositories/interfaces/i_meter_entry_repo.dart';
import 'data/repositories/interfaces/i_syst_setting_repo.dart';
import 'data/repositories/meter_entry_repo.dart';
import 'data/repositories/system_settings_repo.dart';
import 'global/auth/bloc/authentication_bloc.dart';
import 'ui/categories_list/bloc/category_list_bloc.dart';
import 'ui/classifield_profile/bloc/classified_profile_bloc.dart';
import 'ui/login/bloc/login_bloc.dart';
import 'ui/module_type/bloc/module_selection_bloc.dart';
import 'ui/user/bloc/user_bloc.dart';

final GetIt sl = GetIt.instance;
Future<void> initDI() async {
  _initBloc();
  _initRepositories();
  _initEnvironment();
  _initServices();
  await _initExternal();
}

void _initEnvironment() {
  sl.registerLazySingleton<IEnvironmentManager>(() => EnvironmentManager(
        sl(),
      ));
}

void _initRepositories() {
  sl.registerLazySingleton<IUserRepository>(
      () => UserRepository(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton<ICompanySelectionRepository>(
      () => CompanySelectionRepository());

  sl.registerLazySingleton<IFaqsRepository>(() => FaqsRepository(sl()));
  sl.registerLazySingleton<IJobberRepository>(() => JobberRepository());
  sl.registerLazySingleton<IChallanRepository>(() => ChallanRepository());
  sl.registerLazySingleton<IBaleRepository>(() => BaleRepository());
  sl.registerLazySingleton<IBestDealRepository>(() => BestDealRepository(sl()));
  sl.registerLazySingleton<ICarouselRepository>(() => CarouselRepository(sl()));
  sl.registerLazySingleton<IEntrySectionRepository>(
      () => EntrySectionRepository());
  sl.registerLazySingleton<IMeterEntryRepository>(() => MeterEntryRepository());
  sl.registerLazySingleton<IBaleMeterEntryRepository>(
      () => BaleMeterEntryRepository());
  sl.registerLazySingleton<ISystemInfoRepository>(
      () => SystemInfoRepository(sl()));
  sl.registerLazySingleton<IAppMessageRepository>(
      () => AppMessageRepository(sl(), sl()));
  sl.registerLazySingleton<ISystemSettingsRepository>(
      () => SystemSettingsRepository(sl(), sl()));
}

Future<void> _initExternal() async {
  FirebaseApp app = await Firebase.initializeApp();
  sl.registerFactory<FirebaseApp>(() => app);
  SharedPreferences pref = await SharedPreferences.getInstance();
  sl.registerFactory<SharedPreferences>(() => pref);
  sl.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerFactory<Reference>(() => FirebaseStorage.instance.ref());
  sl.registerFactory<FirebaseMessaging>(() => FirebaseMessaging.instance);
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  sl.registerFactory<PackageInfo>(() => packageInfo);
}

void _initBloc() {
  sl.registerFactory(() => UserBloc(sl(), sl(), sl()));
  sl.registerFactory(() => CompanySelectionBloc(sl()));
  sl.registerFactory(() => RoleSelectionBloc(sl()));
  sl.registerFactory(() => ModuleSelectionBloc(sl()));
  sl.registerFactory(() => MeterEntryBloc(sl(), sl()));
  sl.registerFactory(() => BaleMeterBloc(sl()));
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => MeterActualBloc(sl()));

  sl.registerFactory(() => ClassifiedProfileBloc(sl(), sl()));
  sl.registerFactory(() => ArticleProfileBloc(sl()));
  sl.registerFactory(() => FaqsBloc(sl()));
  sl.registerFactory(() => CategoryListBloc(sl()));
  sl.registerFactory(() => AuthenticationBloc(sl(), sl()));
  sl.registerFactory(() => ReviewBloc(sl(), sl()));
  sl.registerFactory(() => BestDealBloc(sl(), sl()));
  sl.registerFactory(() => BannerBloc(sl()));
  sl.registerFactory(() => HomeBloc(sl()));
  sl.registerFactory(() => NotificationBloc(sl()));
  sl.registerFactory(() => ThemeBloc(sl()));
  sl.registerFactory(() => SettingsBloc(sl(), sl()));
  sl.registerFactory(() => CarouselBloc(sl()));
  sl.registerFactory(() => ChallanBloc(sl()));
  sl.registerFactory(() => BalesListBloc(sl()));
}

void _initServices() {
  sl.registerLazySingleton(() => SubCategoryService());
  sl.registerLazySingleton(() => ClassifiedService());
  sl.registerLazySingleton<IThemeService>(() => ThemeService(sl()));
  sl.registerLazySingleton<IForceUpdateService>(() => ForceUpdateService(sl()));
  sl.registerLazySingleton<INotificationService>(
      () => NotificationService(sl()));
  sl.registerLazySingleton<ILocationService>(() => LocationService());
  sl.registerLazySingleton<ExecutionHandler>(
      () => ExecutionHandler(sl(), sl()));
  sl.registerLazySingleton<Handler>(
      () => HandlingService(const Duration(minutes: 1)));
  sl.registerLazySingleton<IUserService>(() => UserService(sl()));
}
