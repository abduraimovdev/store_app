import 'package:flutter/material.dart';
import 'package:store_app/src/core/extension/extension.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    this.onTap,
    this.onScanTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;
  final VoidCallback? onScanTap;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.theme.shadowColor,
              blurRadius: 2,
              spreadRadius: 0.1,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomAppBar(
          elevation: 8,
          height: kBottomNavigationBarHeight + 10,
          child: Row(
            children: [
              BottomMenuItem(
                onTap: () {
                  onTap?.call(0);
                },
                isSelected: currentIndex == 0,
                label: '',
                icon: AppIcons.home,
              ),
              BottomMenuItem(
                onTap: () {
                  onTap?.call(1);
                },
                isSelected: currentIndex == 1,
                label: '',
                icon: AppIcons.heart,
              ),

              BottomMenuItem(
                onTap: () {
                  onTap?.call(2);
                },
                isSelected: currentIndex == 2,
                label: '',
                icon: AppIcons.bag,
              ),
              BottomMenuItem(
                onTap: () {
                  onTap?.call(3);
                },
                isSelected: currentIndex == 3,
                label: '',
                icon: AppIcons.notification,
              ),
            ],
          ),
        ),
      );
}

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    required this.isSelected,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Semantics(
          child: InkResponse(
            onTap: onTap,
            customBorder: const CircleBorder(),
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? context.theme.bottomNavigationBarTheme.selectedItemColor
                      : context
                          .theme.bottomNavigationBarTheme.unselectedItemColor,
                ),
                Text(
                  label,
                  style: context.theme.bottomNavigationBarTheme.selectedLabelStyle
                      ?.copyWith(
                    color: isSelected
                        ? context.theme.bottomNavigationBarTheme.selectedItemColor
                        : context
                            .theme.bottomNavigationBarTheme.unselectedItemColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
