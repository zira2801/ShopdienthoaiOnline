import 'package:flutter/material.dart';

class ProductPhoBienTitle extends StatelessWidget {
  final String titile;
  const ProductPhoBienTitle({super.key,required this.titile});

  @override
  Widget build(BuildContext context) {
    return Container(height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titile,style: const TextStyle(color: Colors.black,fontSize: 18),),

          const Text("See more",style: TextStyle(color: Colors.grey),)
        ],
      ),);
  }
}
