import 'package:classified_app/data/repositories/company_selection_repo.dart';
import 'package:classified_app/ui/article_view/article_view.dart';
import 'package:classified_app/ui/bale_list/bale_list.dart';
import 'package:classified_app/ui/challan_list/challan_list.dart';
import 'package:classified_app/ui/challan_meter_entry/challan_meter_entry.dart';
import 'package:classified_app/ui/challan_meter_entry/submission_review.dart';
import 'package:classified_app/ui/company_selection/company_selection.dart';
import 'package:classified_app/ui/faqs/faqs.dart';
import 'package:classified_app/ui/home/home.dart';
import 'package:classified_app/ui/login/login_page.dart';
import 'package:classified_app/ui/module_type/module_type.dart';
import 'package:classified_app/ui/role_selection/role_selection.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:classified_app/global/widgets/enlarged_images.dart';
import 'package:classified_app/home_page.dart';
import 'package:classified_app/ui/about_us/about_us.dart';
import 'package:classified_app/ui/banner-ad/banner_ad.dart';
import 'package:classified_app/ui/categories_list/category_list.dart';
import 'package:classified_app/ui/classifield_profile/classified_profile.dart';
import 'package:classified_app/ui/article_profile/article_profile.dart';
import 'package:classified_app/ui/copyright/copyright.dart';
import 'package:classified_app/ui/feedback.dart';
import 'package:classified_app/ui/get_best_deal/best_deal.dart';
import 'package:classified_app/ui/notifications/notification_screen.dart';
import 'package:classified_app/ui/privacy_policy/privacy_policy.dart';
import 'package:classified_app/ui/review/write_a_review.dart';
import 'package:classified_app/ui/settings/settings_screen.dart';
import 'package:classified_app/ui/sub_categories_list/sub_category_list.dart';
import 'package:classified_app/ui/third_party_notices/third_party_notices.dart';
import 'package:classified_app/ui/tnc/tnc.dart';
import 'package:classified_app/ui/user_profile/profile.dart';

import 'data/models/banner.dart';
import 'ui/bale_meter_entry/bale_meter_entry.dart';
import 'ui/bale_meter_entry/submission_review.dart';

class RouteStrings {
  static const Home = '/';
  static const CompanyList = '/classifieds';
  static const Dashboard = '/dashboard';
  static const RoleSelectionList = '/roles';
  static const ModuleSelectionList = '/modules';
  static const MeterEntry = '/meter_entry';
  static const BaleMeterEntry = '/bale_meter_entry';
  static const CategoryList = '/categories';
  static const Login = '/login';
  static const ChallanList = '/challan_list';
  static const BaleList = '/bale_list';
  static const SubmissionReview = '/submission_review';
  static const BaleSubmissionReview = '/bale_submission_review';
  static const SubCategoryList = '/subCategories';
  static const ClassifiedProfile = '/classified_profile';
  static const ArticleProfile = '/article_profile';
  static const BannerAd = '/bannerAd';
  static const EnlargedImage = '/enlarge';
  static const Notifications = '/notifications';
  static const Profile = '/profile';
  static const GetBestDeal = '/deal';
  static const Faqs = '/faqs';
  static const WriteAReview = '/review';
  static const Settings = '/settings';
  static const Privacy = '/privacy';
  static const About = '/about';
  static const Feedback = '/feedback';
  static const Copyright = '/copyright';
  static const TermsAndConditions = '/tnc';
  static const ThirdPartyNotices = '/third_party';
  static const ArticleView = '/article_view';
}

class NavRouter {
  static GlobalKey<NavigatorState>? navKey = GlobalKey<NavigatorState>();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final _transitionDuration = Duration(milliseconds: 350);
    final _reverseDuration = Duration(milliseconds: 200);

    PageTransition _transition(
            {required Widget child, required PageTransitionType type}) =>
        PageTransition(
          child: child,
          type: type,
          duration: _transitionDuration,
          reverseDuration: _reverseDuration,
          settings: settings,
          curve: Curves.easeInCubic,
        );

    switch (settings.name) {
      case (RouteStrings.Home):
        return _transition(child: Home(), type: PageTransitionType.fade);
      case (RouteStrings.MeterEntry):
        return _transition(child: MeterEntry(), type: PageTransitionType.fade);
      case (RouteStrings.SubmissionReview):
        return _transition(
            child: SubmissionReview(), type: PageTransitionType.fade);
      case (RouteStrings.BaleMeterEntry):
        return _transition(
            child: BaleMeterEntry(), type: PageTransitionType.fade);
      case (RouteStrings.BaleSubmissionReview):
        return _transition(
            child: BaleSubmissionReview(), type: PageTransitionType.fade);
      case (RouteStrings.ChallanList):
        return _transition(child: ChallanList(), type: PageTransitionType.fade);
      case (RouteStrings.BaleList):
        return _transition(child: BaleList(), type: PageTransitionType.fade);
      case (RouteStrings.CompanyList):
        return _transition(
            child: CompanySelection(), type: PageTransitionType.fade);
      case (RouteStrings.Dashboard):
        return _transition(child: Dashboard(), type: PageTransitionType.fade);
      case (RouteStrings.RoleSelectionList):
        return _transition(
            child: RoleSelection(), type: PageTransitionType.fade);
      case (RouteStrings.ModuleSelectionList):
        return _transition(
            child: ModuleSelection(), type: PageTransitionType.fade);
      case (RouteStrings.Faqs):
        return _transition(child: Faqs(), type: PageTransitionType.fade);
      case (RouteStrings.Notifications):
        return _transition(
            child: NotificationScreen(),
            type: PageTransitionType.rightToLeftWithFade);
      case (RouteStrings.ClassifiedProfile):
        return _transition(
            child: ClassifiedProfileScreen(),
            type: PageTransitionType.rightToLeft);
      case (RouteStrings.ArticleProfile):
        return _transition(
            child: ArticleProfileScreen(),
            type: PageTransitionType.rightToLeft);
      case (RouteStrings.Profile):
        return _transition(
            child: UserProfileScreen(), type: PageTransitionType.rightToLeft);
      case (RouteStrings.CategoryList):
        return _transition(
            child: CategoryListScreen(), type: PageTransitionType.bottomToTop);

      case (RouteStrings.BannerAd):
        if (settings.arguments is BannerAd) {
          return _transition(
              child: BannerAdDetailsPage(
                  bannerAd: settings.arguments as BannerAd?),
              type: PageTransitionType.leftToRight);
        } else {
          return _transition(child: Home(), type: PageTransitionType.fade);
        }

      case (RouteStrings.EnlargedImage):
        EnlargedImageArgs enlargedImageArgs =
            settings.arguments as EnlargedImageArgs;
        return _transition(
            child: EnlargedImage(
                imageUrls: enlargedImageArgs.imageUrls,
                selectedIndex: enlargedImageArgs.selectedIndex),
            type: PageTransitionType.rightToLeft);

      case (RouteStrings.Settings):
        return _transition(
            child: SettingScreen(),
            type: PageTransitionType.leftToRightWithFade);
      case (RouteStrings.Login):
        return _transition(
            child: LoginPage(), type: PageTransitionType.leftToRight);
      case (RouteStrings.WriteAReview):
        ReviewObj reviewObj = settings.arguments as ReviewObj;
        return _transition(
            child: ReviewScreen(
              rating: reviewObj.rating,
              classifiedId: reviewObj.classifiedId,
              classifiedName: reviewObj.classifiedName,
            ),
            type: PageTransitionType.rightToLeft);
      case (RouteStrings.GetBestDeal):
        BestDealObj bestDealObj = settings.arguments as BestDealObj;
        return _transition(
            child: BestDeal(
                classifiedId: bestDealObj.classifiedId,
                classifiedName: bestDealObj.classifiedName),
            type: PageTransitionType.rightToLeft);
      case (RouteStrings.Privacy):
        return _transition(
            child: Privacypolicy(), type: PageTransitionType.leftToRight);
      case (RouteStrings.About):
        return _transition(
            child: AboutUs(), type: PageTransitionType.leftToRight);
      case (RouteStrings.Feedback):
        return _transition(
            child: SendFeedback(), type: PageTransitionType.leftToRight);

      case (RouteStrings.SubCategoryList):
        return _transition(
            child: SubCategoryListScreen(),
            type: PageTransitionType.topToBottom);
      case (RouteStrings.TermsAndConditions):
        return _transition(
            child: TermsAndConditions(), type: PageTransitionType.bottomToTop);
      case (RouteStrings.ThirdPartyNotices):
        return _transition(
            child: ThirdPartyNotices(), type: PageTransitionType.topToBottom);
      case (RouteStrings.Copyright):
        return _transition(
            child: Copyright(), type: PageTransitionType.topToBottom);
      case (RouteStrings.ArticleView):
        return _transition(
          child: ArticleView(articleUrl: settings.arguments as String),
          type: PageTransitionType.topToBottom,
        );
      default:
        return _transition(child: Home(), type: PageTransitionType.bottomToTop);
    }
  }
}

class ReviewObj {
  double rating;
  int classifiedId;
  String classifiedName;
  ReviewObj({
    required this.rating,
    required this.classifiedId,
    required this.classifiedName,
  });
}

class BestDealObj {
  int classifiedId;
  String classifiedName;
  BestDealObj({
    required this.classifiedId,
    required this.classifiedName,
  });
}

class EnlargedImageArgs {
  List<String>? imageUrls;
  int selectedIndex;
  EnlargedImageArgs({
    required this.imageUrls,
    required this.selectedIndex,
  });
}
