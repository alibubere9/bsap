import 'package:classified_app/global/widgets/base_shimmer.dart';
import 'package:flutter/material.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return BaseShimmmer(
      count: 15,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child:  Container(
                  color: Colors.green,
                  height: 151,
                  width: width * 0.8,
                ),
            ),
          
        );
      
    
  }
}
