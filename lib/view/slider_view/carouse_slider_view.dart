import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop/view/slider_view/banner_card.dart';

import '../../model/ad_banner.dart';

class CarouselSliderView extends StatefulWidget {
  final List<AdBanner> listBanner;
  const CarouselSliderView({super.key,required this.listBanner});

  @override
  State<CarouselSliderView> createState() => _CarouselSliderViewState();
}

class _CarouselSliderViewState extends State<CarouselSliderView> {
  int _currentIndex = 0;
  late List<Widget> _bannerList;

  @override
  void initState() {
    _bannerList = widget.listBanner.map((e) => BannerCard(imageUrl: e.image)).toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
    CarouselSlider(items: _bannerList,options: CarouselOptions(
      autoPlay: true,
      enlargeCenterPage: true, //enlargeCenterPage: Phóng to item ở giữa lên 10% so với các item bên cạnh
      aspectRatio: 16/9, //aspectRatio: Tỷ lệ khung hình hiển thị item. Ở đây là 16:9
      viewportFraction: 1,
      onPageChanged: (index,reason) {
        setState(() {
          _currentIndex = index;

          //_currentIndex: Là một biến để lưu trữ vị trí page
          // hiện tại, được cập nhật lại bằng giá trị index mới mỗi khi page thay đổi.
          //mỗi khi page thay đổi, callback này sẽ được gọi, cập nhật lại giá trị _currentIndex,
          // và gọi setState() để UI render lại, hiển thị page mới tương ứng với _currentIndex
        });
      }//viewportFraction: Phần trăm kích thước item so với màn hình. 1 nghĩa là đầy màn hình.
    ),),

      Row(mainAxisAlignment: MainAxisAlignment.center,
      children: widget.listBanner.map((e) {
        int index = widget.listBanner.indexOf(e);
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? const Color.fromRGBO(0, 0, 0,0.9 ) : const Color.fromRGBO(0, 0, 0, 0.4)
          ),
        );
      }).toList())
    ],);
  }
}

