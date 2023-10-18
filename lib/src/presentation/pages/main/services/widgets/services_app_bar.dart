import 'package:flutter/material.dart';
import 'package:store_app/src/core/extension/extension.dart';
import 'package:store_app/src/core/utils/utils.dart';

class ServicesAppBar extends StatelessWidget {
  const ServicesAppBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        pinned: true,
        floating: true,
        centerTitle: false,
        forceElevated: true,
        title: const Text('Услуги'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    AppUtils.kGap16,
                    const Expanded(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          contentPadding: AppUtils.kPaddingAll8,
                          hintText: 'Поиск медицинских услуг',
                          hintStyle: TextStyle(
                            color: Color(0xFF616161),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: AppUtils.kBorderRadius10,
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            AppIcons.search,
                            color: Color(0xFF616161),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF5F5F5),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        AppIcons.cart,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        AppIcons.page_info,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBar(
                    dividerColor: context.colorScheme.surfaceVariant,
                    isScrollable: true,
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(text: 'Клиники', height: 36),
                      Tab(text: 'Диагностика', height: 36),
                      Tab(text: 'Анализы', height: 36),
                      Tab(text: 'Лечебные процедуры', height: 36),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
