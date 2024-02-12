import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:forestvpn_test/repositories/news/models/mock_article.dart';
import 'package:forestvpn_test/utils/extensions/extensions.dart';
import 'package:go_router/go_router.dart';
import '../../repositories/news/models/article.dart';
import '../../utils/assets/assets.dart';

class NewsPage extends StatelessWidget {
  final Article? selectedArticle;
  final MockArticle? mockArticle;

  const NewsPage({Key? key, this.selectedArticle, this.mockArticle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedArticle != null
          ? CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: GestureDetector(
                    onTap: () {
                      print('Item marked as viewed');
                      context.pop();
                    },
                    child: Assets.arrowLeftWhite.png,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    title: Text(
                      selectedArticle!.title,
                      style: context.theme.headline6.white,
                    ),
                    titlePadding:
                        EdgeInsets.only(left: 20, right: 40, bottom: 40),
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        selectedArticle!.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  expandedHeight: 414,
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: Text(selectedArticle!.description!)
                      .paddingOnly(top: 20, bottom: 20, right: 21, left: 21),
                ),
              ],
            )
          : CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: GestureDetector(
                    onTap: () {
                      print('Item marked as viewed');
                      context.pop();
                    },
                    child: Assets.arrowLeftWhite.png,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1,
                    title: Text(
                      MockArticle.title,
                      style: context.theme.headline6.white,
                    ),
                    titlePadding:
                        EdgeInsets.only(left: 20, right: 40, bottom: 40),
                    background: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        MockArticle.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  expandedHeight: 414,
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: Text(MockArticle.description)
                      .paddingOnly(top: 20, bottom: 20, right: 21, left: 21),
                ),
              ],
            ),
    );
  }
}
