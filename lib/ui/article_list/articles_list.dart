import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/widgets/base_shimmer.dart';
import 'package:classified_app/global/widgets/dashboard_logo.dart';
import 'package:classified_app/global/widgets/notification_button.dart';
import 'package:classified_app/global/widgets/profile_button.dart';
import 'package:classified_app/ui/article_list/widgets/article_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/global/widgets/search_field.dart';
import 'package:classified_app/global/widgets/spaces.dart';

import 'bloc/article_list_bloc.dart';

class ArticleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: ConstPadding.all12,
          child: Column(
            children: [
              BlocBuilder<ArticleListBloc, ArticleListState>(
                builder: (context, state) {
                  if (state is ArticleListLoaded) {
                    return SearchField(
                      text: state.text!,
                    );
                  } else if (state is ArticleListEmpty ||
                      state is ArticleListLoading) {
                    return buildSearchFieldEmpty();
                  } else {
                    return buildSearchFieldEmpty();
                  }
                },
              ),
              SpaceHeightWithValue(height: 20),
              BlocBuilder<ArticleListBloc, ArticleListState>(
                builder: (context, state) {
                  if (state is ArticleListLoaded) {
                    return SingleChildScrollView(
                      child: Column(
                        children: state.articles
                            .map((e) => ArticleTile(
                                  article: e,
                                ))
                            .toList(),
                      ),
                    );
                  } else if (state is ArticleListLoading) {
                    return Container(
                        height: height * 0.8, child: BaseShimmmer());
                  } else {
                    return Center(child: Text(ConstantStrings.noArticles));
                  }
                },
              )
              // ClassifiedTile(),
            ],
          ),
        ),
      ),
    );
  }

  SearchField buildSearchFieldEmpty() {
    return SearchField(
      text: '',
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      title: DashboardLogo(),
      actions: [
        NotificationButton(),
        ProfileButton(),
        SpaceWidthWithValue(
          width: 15,
        )
      ],
    );
  }
}
