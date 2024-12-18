import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' as svg;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_button.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class FeaturedItem extends StatelessWidget {
  FeaturedItem({super.key});
// svg.SvgPicture.asset(Assets.imagesBackgroundTestfeature)
  @override
  Widget build(BuildContext context) {
     var itemWidth = MediaQuery.of(context).size.width;
    return 
      
       SizedBox(
        width: itemWidth,
         child: AspectRatio(
          aspectRatio: 342/158,
           child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                top: 0,
                width: itemWidth*0.6,
                child:svg.SvgPicture.asset(Assets.imagesPineapple,fit: BoxFit.fill,), ),
              Container(
                width: itemWidth*0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(image:Svg(Assets.imagesBackgroundTestfeature),
                  fit: BoxFit.fill)
                ),
                child:Padding(
                  padding:  EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Text('عروض العيد',style: AppTextStyle.regular13.copyWith(color:Colors.black ),),
                       Text('خصم 25%',style: AppTextStyle.bold19.copyWith(color:Colors.black ),),
                        Spacer(),
                       FeaturedButton(onPressed: () {
                         
                       },),
                     Spacer(),
                    ],
                  ),
                )),
             
            ],
               ),
         ),
       )
    ;
  }
}
