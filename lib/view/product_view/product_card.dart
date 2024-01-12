import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop/const.dart';
import 'package:shop/model/product.dart';
import 'package:intl/intl.dart';

import '../product_detail_view/product_detail_screen.dart';
class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(
          product: product
        )));
      },
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [const SizedBox(height: 10,),
            Flexible(flex: 5,child: Center(child: Hero(
              tag: product.images.first,
              child: CachedNetworkImage(imageUrl: baseUrl + product.images.first,
              placeholder: (context,url) => Shimmer.fromColors(highlightColor: Colors.white,baseColor: Colors.grey.shade300,
                child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.grey.shade300,
                      ),
              ),
                        errorWidget: (context,url,error) => const Center(child: Icon(Icons.error_outline,color: Colors.grey,),),),
            ),
          ),
          ),
          const SizedBox(height: 20,),
          Flexible(flex: 2,
          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 170,
                  child: Text(overflow: TextOverflow.ellipsis,
                  maxLines: 1,product.name,style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor
                  ),),
                ),
                const SizedBox(height: 10,),
                 Text( '${NumberFormat('#,###').format(product.tags.first.price)} VND',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ) ),
              ],
            ),
          ),)],
        ),
      ),
    );
  }
}
