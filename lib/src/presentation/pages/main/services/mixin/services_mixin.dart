part of 'package:store_app/src/presentation/pages/main/services/services_page.dart';

mixin ServicesMixin on State<ServicesPage> {
  late final TabController tabController;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  void initStateController(TickerProvider vsync) {
    tabController = TabController(length: 4, vsync: vsync);
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }
}
