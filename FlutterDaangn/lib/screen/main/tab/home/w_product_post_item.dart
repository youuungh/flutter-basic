import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:flutter_daangn/entity/post/vo_simple_product_post.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductPostItem extends StatelessWidget {
  final SimpleProductPost post;

  const ProductPostItem(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        context.go('/main/localLife/${post.id}', extra: post);

        // Nav.push(PostDetailScreen(
        //   post.id,
        //   simpleProductPost: post,
        // ));
      },

      // return GestureDetector(
      //   behavior: HitTestBehavior.translucent,
      //   onTapUp: (details) {
      //     Nav.pushWithRippleEffect(
      //       PostDetailScreen(
      //         post.id,
      //         simpleProductPost: post,
      //       ),
      //       offset: Offset(details.globalPosition.dx, details.globalPosition.dy),
      //       durationMs: 600
      //     );
      //   },
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Hero(
                  tag: '${post.id}_${post.product.images[0]}',
                  child: CachedNetworkImage(
                    imageUrl: post.product.images[0],
                    width: 150,
                  ),
                ),
              ),
              const Width(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                        tag: '${post.id}_title',
                        child: Material(child: post.title.text.size(18).bold.make())),
                    Row(
                      children: [
                        post.address.simpleAddress.text
                            .color(context.appColors.lessImportant)
                            .make(),
                        '•'.text.color(context.appColors.lessImportant).make(),
                        //post.createdTime.timeago
                        timeago
                            .format(post.createdTime,
                                locale: context.locale.languageCode)
                            .text
                            .color(context.appColors.lessImportant)
                            .make(),
                      ],
                    ),
                    //IntExt(post.product.price).toWon().text.bold.make(),
                    post.product.price.toWon().text.bold.make(),
                  ],
                ),
              )
            ],
          ).p(16),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      '$basePath/home/post_chat_count.png',
                      width: 24,
                      height: 24,
                    ),
                    post.chatCount.text.make(),
                    Image.asset(
                      '$basePath/home/post_heart_off.png',
                      width: 24,
                      height: 24,
                    ),
                    post.likeCount.text.make()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
