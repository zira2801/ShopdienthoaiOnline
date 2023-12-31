import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop/const.dart';
import 'package:shop/model/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({super.key,required this.category});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: CachedNetworkImage(
        imageUrl: baseUrl + category.image,
        imageBuilder: (context, imageProvider) =>
            Material(
                elevation: 8,
                shadowColor: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                child:Container(
                  width: 270,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(category.name, style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),
                  ),
                )
            ),
        placeholder: (context, url) =>
            Material(
                elevation: 8,
                shadowColor: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300, highlightColor: Colors.white,
                  child: Container(
                    width: 270,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),)
            ),
        errorWidget: (context, url, error) =>
            Material(
                elevation: 8,
                shadowColor: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300, highlightColor: Colors.white,
                  child: Container(
                    width: 270,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(
                      child: Icon(Icons.error, color: Colors.grey,),),
                  ),)
            ),
      ),);
  }}
