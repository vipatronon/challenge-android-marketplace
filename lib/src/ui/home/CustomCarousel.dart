import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CustomCarousel extends StatefulWidget {
  var images;
  var height;

  CustomCarousel({
    this.images,
    this.height
  });
  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> with AutomaticKeepAliveClientMixin<CustomCarousel>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: widget.images,
        autoplay: true,
        autoplayDuration: Duration(seconds: 10),
        animationDuration: Duration(seconds: 1),
        animationCurve: Curves.fastLinearToSlowEaseIn,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        indicatorBgPadding: 5.0,
        dotSize: 3.0,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}