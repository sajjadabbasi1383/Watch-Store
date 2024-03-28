import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/res/dimens.dart';

final List<String> imgList = [
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/men.png',
  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/women.png',
];

class AppSlider extends StatefulWidget {
  const AppSlider({
    super.key,
  });

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  final CarouselController _controller = CarouselController();
  final List<Widget> items = imgList
      .map((e) => Padding(
            padding: const EdgeInsets.all(AppDimens.small),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.medium),
              child: Image.network(
                e,
                fit: BoxFit.fill,
              ),
            ),
          ))
      .toList();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            items: items,
            options: CarouselOptions(
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
              children: imgList
                  .asMap()
                  .entries
                  .map((e) => Padding(
                        padding: const EdgeInsets.fromLTRB(4, 1, 4, 2),
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
