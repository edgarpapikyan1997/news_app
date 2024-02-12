import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/bloc/news_bloc/news_bloc.dart';
import 'package:forestvpn_test/repositories/news/models/mock_article.dart';
import 'package:forestvpn_test/utils/extensions/extensions.dart';
import 'package:forestvpn_test/utils/themes/app_colors.dart';

import '../../repositories/news/models/article.dart';
import '../pages/news_page.dart';

class LatestWidget extends StatefulWidget {
  const LatestWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LatestWidget> createState() => _LatestWidgetState();
}

class _LatestWidgetState extends State<LatestWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(const FetchFeaturedArticles());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Set<String> readArticles = {};

    bool checkId(Article article) {
      final bool isRead = readArticles.contains(article.id);
      return isRead;
    }

    String dateTimeAgo(DateTime today, DateTime dataDay) {
      final days = today.day - dataDay.day;
      if (days == 0) {
        return 'Today';
      } else if (days > 1) {
        return '$days days ago';
      }
      return '$days day ago';
    }

    return BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsLoading) {
        return Column(
          children: [
            for (var i = 0; i < 4; ++i)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.greyLightMax.withOpacity(0.1),
                        offset: const Offset(4, 4),
                        blurRadius: 8),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(MockArticle.imageUrl)),
                      ),
                      height: 60,
                      width: 90,
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            MockArticle.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ).paddingOnly(bottom: 11),
                          Text(
                            dateTimeAgo(DateTime.now(), MockArticle.dateTime),
                            style: context.theme.headline1.lightGrey,
                          ),
                        ],
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 20, top: 20, left: 20, right: 35),
              ).paddingOnly(bottom: 10),
          ],
        );
      }
      if (state is FeatureNewsLoaded) {
        return Column(
            children: state.articles!.map<Widget>((Article article) {
          return OpenContainer(
            transitionType: ContainerTransitionType.fade,
            transitionDuration: const Duration(milliseconds: 1500),
            closedBuilder: (context, _) {
              return Container(
                decoration: BoxDecoration(
                  color: state.isMarked == true
                      ? AppColors.selectedWhite
                      : (checkId(article)
                          ? AppColors.selectedWhite
                          : AppColors.white),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.greyLightMax.withOpacity(0.1),
                        offset: const Offset(4, 4),
                        blurRadius: 8),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(article.imageUrl)),
                      ),
                      height: 60,
                      width: 90,
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ).paddingOnly(bottom: 11),
                          Text(
                            dateTimeAgo(
                                DateTime.now(), article.publicationDate),
                            style: context.theme.headline1.lightGrey,
                          ),
                        ],
                      ),
                    )
                  ],
                ).paddingOnly(bottom: 20, top: 20, left: 20, right: 35),
              ).paddingOnly(bottom: 10);
            },
            openBuilder: (context, _) {
              readArticles.add(article.id);
              return NewsPage(selectedArticle: article);
            },
          );
        }).toList());
      }
      return Text('Null');
    });
  }
}
