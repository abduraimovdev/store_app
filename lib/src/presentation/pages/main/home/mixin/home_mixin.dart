part of '../home_page.dart';

mixin HomeMixin on State<HomePage> {
  late final bloc = context.read<ProductBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(const ProductGetAllDataEvent());
  }

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}