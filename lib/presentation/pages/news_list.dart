import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/utils/extensions/extensions.dart';
import 'package:forestvpn_test/utils/themes/app_colors.dart';
import '../../bloc/news_bloc/news_bloc.dart';
import '../../utils/assets/assets.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_carousel.dart';
import '../widgets/latest_widget.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  bool isMarked = true;
  @override
  void initState() {
    super.initState();
  }

  Set<String> readArticles = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(88),
        child: CustomAppBar(
          icon: (Assets.arrowLeftBlack.png),
          title: 'newsList.notifications'.tr(),
          endTitle: 'newsList.markAllRead'.tr(),
          onEndTitlePressed: () {
            isMarked = !isMarked;
            print(isMarked);
            BlocProvider.of<NewsBloc>(context)
                .add(FetchFeaturedArticles(isMarked: isMarked));
          },
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child:
                Text('newsList.featured'.tr(), style: context.theme.headline5)
                    .paddingOnly(bottom: 20, left: 28, right: 28),
          ),
          SliverToBoxAdapter(
            child: const CustomCarousel()
                .paddingOnly(bottom: 5, right: 14, left: 14),
          ),
          SliverToBoxAdapter(
            child: Text(
              'newsList.latest'.tr(),
              style: context.theme.headline5,
            ).paddingOnly(bottom: 20, left: 28, right: 28),
          ),
          SliverToBoxAdapter(
            child: const LatestWidget().paddingOnly(left: 28, right: 28),
          ),
        ],
      ).paddingOnly(
        top: 40,
      ),
    );
  }
}
