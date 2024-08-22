import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daangn/app.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:flutter_daangn/entity/user/vo_address.dart';

import '../../entity/user/vo_user.dart';

class UserProfileWidget extends StatelessWidget {
  final User user;
  final Address address;

  const UserProfileWidget(this.user, {required this.address, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
            child: CachedNetworkImage(
          imageUrl: user.profileUrl,
          width: 44,
        )),
        width20,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              user.nickname.text.bold.make(),
              const Height(4),
              address.simpleAddress.text.make()
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    '${user.temp}℃'
                        .text
                        .color(Colors.green)
                        .bold
                        .size(16)
                        .make(),
                    const SizedBox(
                      width: 54,
                      child: LinearProgressIndicator(
                        value: 0.3,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
                const Width(6),
                Image.asset(
                  '$basePath/detail/smile.png',
                  width: 30,
                )
              ],
            ),
            '매너온도'
                .text
                .color(context.appColors.lessImportant)
                .underline
                .size(13)
                .make()
          ],
        )
      ],
    ).p(16);
  }
}
