import 'package:flutter/material.dart';
import 'package:shop/view/product_view/product_loading_card4.dart';

class ProductLoadingGrid extends StatelessWidget {
  const ProductLoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,childAspectRatio: 2/3,crossAxisSpacing: 10,mainAxisSpacing: 10),
        physics:const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemBuilder: (context,index) => const ProductLoadingCard()
    );
  }
}



//Giai thich phan code

/*gridDelegate: Định nghĩa cách hiển thị các item trong GridView, sử dụng SliverGridDelegateWithMaxCrossAxisExtent.
maxCrossAxisExtent: Xác định độ rộng tối đa mà mỗi item có thể có là 200.
childAspectRatio: Tỉ lệ kích thước item, ở đây là chiều cao bằng 2/3 chiều rộng.
crossAxisSpacing: Khoảng cách ngang giữa các item là 10.
mainAxisSpacing: Khoảng cách dọc giữa các item là 10.
physics: Xác định hiệu ứng cuộn, sử dụng BouncingScrollPhysics để có hiệu ứng đàn hồi khi cuộn đến đầu hoặc cuối.
padding: Lề xung quanh GridView là 10.*/
