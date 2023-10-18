import 'package:flutter/material.dart';

import 'widgets/services_app_bar.dart';

part 'mixin/services_mixin.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>
    with SingleTickerProviderStateMixin, ServicesMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initStateController(this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            ServicesAppBar(tabController: tabController),
            SliverList.separated(
              itemCount: 15,
              itemBuilder: (_, index) => ListTile(
                title: Text('Item $index'),
              ),
              separatorBuilder: (_, __) => const Divider(height: 1),
            ),
          ],
        ),
      );
}
