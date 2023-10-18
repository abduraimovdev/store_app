import 'package:flutter/material.dart';
import 'package:store_app/src/core/utils/utils.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('О нас')),
        body: CustomScrollView(
          slivers: [
            SliverSafeArea(
              minimum: AppUtils.kPaddingAll16,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Text(
                      'Заголовок',
                      style: TextStyle(
                        fontSize: 17,
                        height: 22 / 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppUtils.kGap4,
                    const Text(
                      'AKFA Medline – это крупнейший частный многопрофильный медицинский центр в Азии с современным оборудованием для диагностики, лечения и проведения сложных кардиохирургических, нейрохирургических, ортопедических операций при участии медицинского персонала.',
                      style: TextStyle(
                        fontSize: 17,
                        height: 22 / 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
