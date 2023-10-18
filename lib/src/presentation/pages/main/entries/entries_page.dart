import 'package:flutter/material.dart';
import 'package:store_app/src/core/extension/extension.dart';
import 'package:store_app/src/core/utils/utils.dart';
import 'package:store_app/src/presentation/components/loading_widgets/modal_progress_hud.dart';

import 'widgets/entries_appbar.dart';

part 'mixin/entries_mixin.dart';

class EntriesPage extends StatefulWidget {
  const EntriesPage({super.key});

  @override
  State<EntriesPage> createState() => _EntriesPageState();
}

class _EntriesPageState extends State<EntriesPage>
    with TickerProviderStateMixin, EntriesMixin {
  @override
  void initState() {
    super.initState();
    initController(this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => [
            EntriesAppBar(controller: _tabController),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              CustomScrollView(
                slivers: [
                  SliverList.separated(
                    itemBuilder: (_, index) => Padding(
                      padding: AppUtils.kPaddingAll16,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Запись №${index + 1}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: context.color.primaryText,
                                  ),
                                ),
                                Text(
                                  'Активен до 23 сентября',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: context.color.secondaryText,
                                  ),
                                ),
                                AppUtils.kGap8,
                                const Text(
                                  '5 клиник, 9 услуг',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppUtils.kGap8,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${30000.moneyFormat} сум',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '+${120000.moneyFormat} сум кэшбэк',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: context.color.green,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    separatorBuilder: (_, __) => AppUtils.kDivider,
                    itemCount: 10,
                  ),
                ],
              ),
              const ModalProgressHUD(
                inAsyncCall: true,
                child: SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
}
