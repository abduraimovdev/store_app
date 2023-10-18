import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/src/config/router/app_routes.dart';
import 'package:store_app/src/core/extension/extension.dart';
import 'package:store_app/src/core/utils/utils.dart';
import 'package:store_app/src/presentation/components/loading_widgets/staggered_dots_wave.dart';

import '../../bloc/splash/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset('assets/images/initial_picture.png'),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                const Spacer(),
                Expanded(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Coffee so good, \nyour taste buds \nwill love it.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'Coffee so good, your taste buds will love it.',
                            style: TextStyle(
                                color: Color(0xffA9A9A9),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28, vertical: 15),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              context.pushReplacementNamed(Routes.main);
                            },
                            child: Row(
                              children: [
                                Image.network(
                                  'https://w7.pngwing.com/pngs/326/85/png-transparent-google-logo-google-text-trademark-logo-thumbnail.png',
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
}
