import 'package:flutter/material.dart';
import 'package:store_app/src/core/extension/extension.dart';
import 'package:store_app/src/core/utils/utils.dart';

class EntriesAppBar extends StatelessWidget {
  const EntriesAppBar({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        pinned: true,
        floating: true,
        centerTitle: false,
        forceElevated: true,
        title: Text(context.tr('entries')),
        expandedHeight: 2 * kToolbarHeight,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: AppUtils.kPaddingL16T8R16B12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius24,
                color: context.colorScheme.secondaryContainer,
              ),
              child: SizedBox(
                height: 36,
                child: TabBar(
                  controller: controller,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: context.colorScheme.onPrimary,
                  indicator: BoxDecoration(
                    color: context.colorScheme.primary,
                    borderRadius: AppUtils.kBorderRadius24,
                  ),
                  tabs: const [
                    Tab(text: 'Мои записи', height: 36),
                    Tab(text: 'Мед карта', height: 36),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
