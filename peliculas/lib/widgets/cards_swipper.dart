import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwipper extends StatelessWidget {
  const CardSwipper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height*0.5,
      color: Colors.red,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height *0.9 ,
        itemBuilder: (__, int index) {
             return GestureDetector(
               onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
               child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                 child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  //placeholder: NetworkImage('https://via.placeholder.com/300x400'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover,
                  ),
               ),
             );

        },
        )
    );
  }
}