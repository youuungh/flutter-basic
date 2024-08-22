import 'package:cached_network_image/cached_network_image.dart';
import 'package:daangn_ui/widget/w_round_button.dart';
import 'package:daangn_ui/widget/w_vertical_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daangn/app.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:flutter_daangn/entity/post/vo_product_post.dart';
import 'package:flutter_daangn/entity/post/vo_simple_product_post.dart';
import 'package:flutter_daangn/screen/post_detail_riverpod/provider/product_post_provider.dart';
import 'package:flutter_daangn/screen/post_detail_riverpod/w_post_content.dart';
import 'package:flutter_daangn/screen/post_detail_riverpod/w_user_profile.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../entity/product/vo_product.dart';

class PostDetailScreen extends ConsumerWidget {
  final SimpleProductPost? simpleProductPost;
  final int id;

  const PostDetailScreen(this.id, {super.key, this.simpleProductPost});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productPost = ref.watch(productPostProvider(id));

    return productPost.when(
        data: (data) => _PostDetail(
              simpleProductPost ?? data.simpleProductPost,
              productPost: data,
            ),
        error: (error, trace) => '에러발생'.text.make(),
        loading: () => simpleProductPost != null
            ? _PostDetail(simpleProductPost!)
            : const Center(child: CircularProgressIndicator()));
  }
}

class _PostDetail extends HookWidget {
  final SimpleProductPost simpleProductPost;
  final ProductPost? productPost;
  static const bottomMenuHeight = 100.0;

  const _PostDetail(this.simpleProductPost, {this.productPost, super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();

    return Material(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: bottomMenuHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ImagePager(
                    pageController: pageController,
                    simpleProductPost: simpleProductPost),
                UserProfileWidget(
                  simpleProductPost.product.user,
                  address: simpleProductPost.address,
                ),
                PostContent(
                  simpleProductPost: simpleProductPost,
                  productPost: productPost,
                )
              ],
            ),
          ),
          const _AppBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: PostDetailBottomMenu(simpleProductPost.product),
          )
        ],
      ),
    );
  }
}

class PostDetailBottomMenu extends StatelessWidget {
  final Product product;

  const PostDetailBottomMenu(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _PostDetail.bottomMenuHeight,
      child: Column(
        children: [
          Line(color: Colors.white10),
          Expanded(
            child: Row(
              children: [
                //LikeButton(),
                const Width(16),
                Image.asset(
                  '$basePath/detail/heart_on.png',
                  height: 24,
                ),
                Width(16),
                VerticalLine(
                  color: Colors.white10,
                ).pSymmetric(v: 16),
                Width(24),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          product.price.toWon().text.bold.make(),
                        ],
                      ),
                      '가격 제안하기'.text.orange400.underline.make()
                    ],
                  ),
                ),
                RoundButton(
                  text: '채팅하기',
                  onTap: () {},
                  bgColor: Colors.orange,
                  borderRadius: 7,
                ),
                const Width(16)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ImagePager extends StatelessWidget {
  const _ImagePager({
    super.key,
    required this.pageController,
    required this.simpleProductPost,
  });

  final PageController pageController;
  final SimpleProductPost simpleProductPost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceWidth,
      width: context.deviceWidth,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: simpleProductPost.product.images
                .map((url) => Hero(
                      tag: '${simpleProductPost.id}_$url',
                      child: CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.fill,
                      ),
                    ))
                .toList(),
          ),
          if (simpleProductPost.product.images.length > 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: simpleProductPost.product.images.length,
                  effect: SlideEffect(
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      dotColor: Colors.white54,
                      activeDotColor: Colors.black45),
                  onDotClicked: (index) {},
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60 + context.statusBarHeight,
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            //Nav.pop(context);
            context.go('/');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
