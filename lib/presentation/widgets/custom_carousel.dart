import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/bloc/news_bloc/news_bloc.dart';
import 'package:forestvpn_test/repositories/news/models/mock_article.dart';
import 'package:forestvpn_test/utils/extensions/extensions.dart';
import '../../repositories/news/models/article.dart';
import '../../utils/themes/app_colors.dart';
import '../pages/news_page.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(FetchFeaturedArticles());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return OpenContainer(
                transitionDuration: const Duration(seconds: 1),
                openBuilder: (context, _) {
                  return NewsPage(mockArticle: MockArticle(),);
                },
                closedBuilder: (context, _) =>
                     Container(
                      margin: const EdgeInsets.only(
                          left: 14, right: 14, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(
                              MockArticle.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 5),
                                color: AppColors.greyLightMax.withOpacity(0.2),
                                blurRadius: 8)
                          ]),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          MockArticle.title,
                          style: context.theme.headline6.white,
                        ),
                      ).paddingOnly(bottom: 40, left: 20, right: 40),
                ),
              );
            }
            if (state is FeatureNewsLoaded) {
              String id = state.articles!.first.id;
              return OpenContainer(
                transitionDuration: Duration(seconds: 1),
                openBuilder: (context, _) {
                  Article? selectedArticle = state.articles!.firstWhere(
                    (article) => article.id == id,
                  );
                  return NewsPage(selectedArticle: selectedArticle);
                },
                closedBuilder: (context, _) => PageView.builder(
                  allowImplicitScrolling: true,
                  onPageChanged: (index) {
                    id = state.articles![index].id;
                    print(state.articles![index].id);
                  },
                  controller: pageController,
                  itemCount: state.articles!.length,
                  physics: const BouncingScrollPhysics(),
                  pageSnapping: true,
                  itemBuilder: (context, pagePosition) {
                    final Article link = state.articles![pagePosition];
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 14, right: 14, bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(
                              link.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 5),
                                color: AppColors.greyLightMax.withOpacity(0.2),
                                blurRadius: 8)
                          ]),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          link.title,
                          style: context.theme.headline6.white,
                        ),
                      ).paddingOnly(bottom: 40, left: 20, right: 40),
                    );
                  },
                ),
              );
            }
            return SizedBox(
              child: Text('Data is not available'),
            );
          },
        ),
      ),
    );
  }
}
