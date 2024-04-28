import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/data/model/slide_model.dart';
import 'package:watch_store/res/dimens.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({
    super.key,
    required this.imgList,
  });

  final List<SlideModel> imgList;

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  final CarouselController _controller = CarouselController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            items: widget.imgList
                .map((e) => SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(AppDimens.small),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppDimens.medium),
                          child: Image.network(
                            height: 190,
                            e.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 190,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imgList
                  .asMap()
                  .entries
                  .map((e) => Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 4, 3),
                        child: GestureDetector(
                          onTap: () => _controller.animateToPage(e.key),
                          child: Container(
                            width: AppDimens.medium,
                            height: AppDimens.medium,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                                color: _current == e.key
                                    ? Colors.grey
                                    : Colors.white),
                          ),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
