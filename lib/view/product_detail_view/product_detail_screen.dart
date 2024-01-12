import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../model/product.dart';
import 'components/product_carousel_slider.dart';
class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({super.key,required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  NumberFormat format = NumberFormat('00');
  int _qty = 1;
  double _price = 0;
  int _tagIndex = 0;
  @override
  void initState() {
    // lấy giá ban đầu
    _price = widget.product.tags[_tagIndex].price;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start
            ,children: [
          ProductCarouselSlider(images: widget.product.images),
           const SizedBox(height: 10,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),),
            const SizedBox(height: 5,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${NumberFormat('#,###').format(_price)} VND',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if(_qty > 1){
                              setState(() {
                                _qty--;
                                _price = widget.product.tags[_tagIndex].price * _qty;
                              });
                            }
                          });
                            },
                        child: Icon(
                          Icons.keyboard_arrow_left_sharp,
                          size: 32,
                            color: Colors.grey.shade800,
                        ),
                      ),
          
                      Text(format.format(_qty),style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800
                      ),),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _qty++;
                            _price = widget.product.tags[_tagIndex].price * _qty;
                          });
                        },
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 32,
                          color: Colors.grey.shade800,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8))
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if(_tagIndex > 0){
                              setState(() {
                                _tagIndex--;
                                _price = widget.product.tags[_tagIndex].price * _qty;
                              });
                            }
                          });
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left_sharp,
                          size: 32,
                          color: Colors.grey.shade800,
                        ),
                      ),
          
                      Text(widget.product.tags[_tagIndex].title,style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade800
                      ),),
                      InkWell(
                        onTap: () {
                          if(_tagIndex != (widget.product.tags.length - 1)){
                            setState(() {
                              _tagIndex++;
                              _price = widget.product.tags[_tagIndex].price * _qty;
                            });
                          }
                        },
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 32,
                          color: Colors.grey.shade800,
                        ),
                      )
                    ],
                  ),
                )
              ],),
            ),
            const SizedBox(height: 20,),
             const Padding(
               padding: EdgeInsets.only(left: 10),
               child: Text('Thông tin sản phẩm',style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold
                         ),),
             ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.product.mota,
                style: TextStyle(fontSize: 16,
                color: Colors.grey.shade700),
              ),
            )
          ],),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(onPressed: () {}, child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                  child: Text("Thêm vào giỏ hàng"
                    ,style: TextStyle(
                        color: Colors.black,
                        fontSize: 15
                    ),),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            TextButton(onPressed: () {}, style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ), child:const SizedBox(
              height: 40,
              width: 150,
              child: Center(
                child: Text("Mua ngay"
                  ,style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                  ),),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

