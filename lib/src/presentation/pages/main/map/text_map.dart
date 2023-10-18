import 'package:flutter/material.dart';
class BottomShit extends StatelessWidget {
  const BottomShit({super.key});

  @override
  Widget build(BuildContext context) => Container(
      width: MediaQuery.sizeOf(context).width,
      height: 280,
      color: Colors.white,
      child:  Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: 44,
            height: 5.39,
            decoration: ShapeDecoration(
              color: const Color(0xFFEAEAEA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.50),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            '10 minutes left',
            style: TextStyle(
              color: Color(0xFF303336),
              fontSize: 16,
              fontFamily: 'Sora',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const SizedBox(height: 10),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Delivery to ',
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 12,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'Jl. Kpg Sutoyo',
                  style: TextStyle(
                    color: Color(0xFF303336),
                    fontSize: 12,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 71.25,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF35C07D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  width: 71.25,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF35C07D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  width: 71.25,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF35C07D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  width: 71.25,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDFDFDF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 66,
              padding: const EdgeInsets.only(left: 5, right: 20),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFEAEAEA),
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Image(image: AssetImage('assets/icons/ic_bike.png'),),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 10),
                            child: Text(
                              'Delivered your order',
                              style: TextStyle(
                                color: Color(0xFF303336),
                                fontSize: 13,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                          Text(
                            'We deliver your goods to you in \n\n\n\n\n\n\n\n\nthe shortes possible time.',
                            style: TextStyle(
                              color: Color(0xFF7F7F7F),
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w400,
                              height: 0.13,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only( top: 20),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Johan Hawn',
                        style: TextStyle(
                          color: Color(0xFF303336),
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Personal Courier',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only( top: 20),
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFFDEDEDE)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Image(image : AssetImage('assets/icons/ic_telpon.png'),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
