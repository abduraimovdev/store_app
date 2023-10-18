import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/src/config/router/app_routes.dart';

import 'text_map.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool location = false;
  String address = 'null';
  String autocompletePlace = 'null';

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: () => Future(() => location),
    child: Scaffold(
        bottomSheet: const BottomShit(),
        body:  Stack(
          children: [
            Column(
              children: [
                Image(
                  image: const AssetImage('assets/images/img_4.png'),
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60 , left: 30 , right: 30 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                      location = true;
                      context.pop();
                    },
                    icon: SizedBox(
                      height: 44,
                      width: 44,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color:  Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Image(image: AssetImage('assets/icons/ic_arrow-left.png'),),
                          )
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: SizedBox(
                      height: 44,
                      width: 44,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color:  Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Image(image: AssetImage('assets/icons/ic_gps.png'),),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
  );
}
