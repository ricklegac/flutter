import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      //color: Colors.black,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('pupulares',style: TextStyle(color: Colors.black, fontSize: 30)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder (
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _ , int index){
                return const _MovieSlider();
              }
            ),
          ),

  
      ]),
    );
  }
}
class _MovieSlider extends StatelessWidget {
  const _MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 130,
                  height: 190,
                  //color: Colors.green,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'DetailScreen', arguments: 'movie-details'),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const FadeInImage(
                            placeholder:  AssetImage('assets/no-image.jpg'), 
                            image: NetworkImage('https://via.placeholder.com/300x400'),
                            width: 130,
                            height: 160,
                            fit: BoxFit.cover,
                            
                          ),
                        ),
                      ),
                      
                      const Text(
                        'StarWards',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center ,

                      )
                    ],
                  )

                );
  }
}