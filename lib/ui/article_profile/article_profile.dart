import 'package:classified_app/data/models/article.dart';
import 'package:classified_app/global/widgets/dashboard_logo.dart';
import 'package:classified_app/global/widgets/image_loading.dart';
import 'package:classified_app/global/widgets/notification_button.dart';
import 'package:classified_app/global/widgets/profile_button.dart';
import 'package:classified_app/global/widgets/profile_shimmer.dart';
import 'package:classified_app/global/widgets/slider.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/article_profile/bloc/article_profile_bloc.dart';
import 'package:classified_app/ui/classifield_profile/widgets/round_button.dart';
import 'package:classified_app/utils/app_messages.dart';
import 'package:classified_app/utils/share.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:classified_app/utils/launch_native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:classified_app/global/widgets/button.dart';
import 'package:classified_app/global/widgets/search_field.dart';
import 'package:classified_app/global/widgets/spaces.dart';

class ArticleProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context) as PreferredSizeWidget?,
      body: BlocBuilder<ArticleProfileBloc, ArticleProfileState>(
        builder: (context, state) {
          if (state is ArticleProfileLoaded) {
            return buildArticleLoaded(state.article, context);
          }
          return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ProfileShimmer());
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: DashboardLogo(),
      actions: [
        NotificationButton(),
        ProfileButton(),
        SpaceWidthWithValue(width: 15)
      ],
    );
  }

  SingleChildScrollView buildArticleLoaded(
      ArticleModel article, BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: ConstPadding.all12,
        width: MediaQuery.of(context).size.width * 0.99,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              text: article.heading!,
            ),
            SpaceHeightWithValue(height: 10),
            Text(
              article.heading ?? 'No Heading',
              style: TextStyles.style27bold,
            ),
            SpaceHeightWithValue(height: 5),
            buildImageListView(article.images),
            SpaceHeightWithValue(height: 15),
            Text(
              article.subHeading ?? 'No Sub Heading',
              style: TextStyles.style21bold,
            ),
            Text(
              article.description ?? 'No description provided',
              style: TextStyles.style14,
            ),
            SpaceHeightWithValue(height: 10),
            Button(
              text: 'View full article',
              onTap: () {
                NavRouter.navKey!.currentState!.pushNamed(
                    RouteStrings.ArticleView,
                    arguments:
                        UrlConcat.concatUrl(article.articleUrl ?? ''));
              },
              bgColor: Colors.transparent,
              textColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
            ),
            SpaceHeightWithValue(height: 10),
            buildButtons(article, context),
            Space(),
            buildPhotos(article.images!, context),
            SpaceHeightWithValue(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildPhotos(List<String> images, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ConstantStrings.photos,
          style: TextStyles.style21bold,
        ),
        GridView.count(
          cacheExtent: 10,
          physics: PageScrollPhysics(),
          crossAxisCount: 2,
          shrinkWrap: true,
          children: images
              .map((e) => Padding(
                    padding: ConstPadding.all8,
                    child: GestureDetector(
                      onTap: () {
                        NavRouter.navKey!.currentState!.pushNamed(
                            RouteStrings.EnlargedImage,
                            arguments: EnlargedImageArgs(
                                imageUrls: images,
                                selectedIndex: images.indexOf(e)));
                      },
                      child: Image.network(
                        UrlConcat.concatUrl(e),
                        loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress == null
                              ? child
                              : ImageLoading(
                                  height: 200,
                                  width: 200,
                                );
                        },
                      ),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }

  Container buildButtons(ArticleModel article, BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RoundButton(
          color: Theme.of(context).primaryColor,
          icon: FontAwesomeIcons.whatsapp,
          onPressed: () {
            launchWhatsApp(
                phone: '',
                message:
                    AppMessagesManager.getMessage(AppMessageKeys.shareArticle));
          },
        ),
        RoundButton(
          color: Theme.of(context).primaryColor,
          icon: Icons.share_outlined,
          onPressed: () {
            shareArticle(article);
          },
        ),
      ],
    ));
  }

  Widget buildImageListView(List<String>? images) {
    return ImageSlider(images: images);
  }
}
