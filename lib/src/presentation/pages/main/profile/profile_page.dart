import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/src/config/router/app_routes.dart';
import 'package:store_app/src/core/extension/extension.dart';
import 'package:store_app/src/core/utils/utils.dart';

import 'widgets/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
        ),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: AppUtils.kPaddingAll16,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Center(
                      child: ClipRect(
                        child: ClipOval(
                          child: CachedNetworkImage(
                            width: 96,
                            height: 96,
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://sb.kaleidousercontent.com/67418/1920x1545/c5f15ac173/samuel-raita-ridxdghg7pw-unsplash.jpg',
                          ),
                        ),
                      ),
                    ),
                    AppUtils.kGap12,
                    const Text(
                      'Жавохир Абдурасулов',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        height: 28 / 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '+998 88 793 74 04',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 20 / 15,
                        fontWeight: FontWeight.w400,
                        color: context.color.secondaryText,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  AppUtils.kDivider,
                  ProfileItemWidget(
                    iconBackgroundColor: context.color.green,
                    icon: Icon(
                      AppIcons.pill,
                      color: context.colorScheme.onPrimary,
                    ),
                    title: 'Мои назначения',
                    trailingText: '2 назначений',
                    onTap: () {},
                  ),
                  AppUtils.kDivider,
                  ProfileItemWidget(
                    iconBackgroundColor: context.color.yellow,
                    icon: Icon(
                      AppIcons.bookmark_filled,
                      color: context.colorScheme.onPrimary,
                    ),
                    title: 'Избранные',
                    trailingText: '23 услуг',
                    onTap: () {},
                  ),
                  AppUtils.kDivider,
                  ProfileItemWidget(
                    iconBackgroundColor: context.color.green,
                    icon: Icon(
                      AppIcons.star,
                      color: context.colorScheme.onPrimary,
                    ),
                    title: 'Мои отзывы',
                    trailingText: '64 отзывов',
                    onTap: () {},
                  ),
                  AppUtils.kDivider,
                  ProfileItemWidget(
                    iconBackgroundColor: context.color.blueLight,
                    icon: Icon(
                      AppIcons.profile,
                      color: context.colorScheme.onPrimary,
                    ),
                    title: 'Пригласить друга',
                    onTap: () {},
                  ),
                  AppUtils.kDivider,
                  ProfileItemWidget(
                    iconBackgroundColor: context.color.brown,
                    icon: Icon(
                      AppIcons.settings,
                      color: context.colorScheme.onPrimary,
                    ),
                    title: context.tr('settings'),
                    onTap: () {
                      context.pushNamed(Routes.settings);
                    },
                  ),
                  AppUtils.kDivider,
                ],
              ),
            ),
          ],
        ),
      );
}
