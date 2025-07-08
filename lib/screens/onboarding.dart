import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tidoy_booking_app/constants/routes.dart';
import 'package:tidoy_booking_app/core/controllers/onboarding_controller.dart';
import 'package:tidoy_booking_app/core/themes/app_color.dart';
import 'package:tidoy_booking_app/core/widgets/common/button/button_primary.dart';
import 'package:tidoy_booking_app/core/widgets/common/button/button_second.dart';
import 'package:tidoy_booking_app/core/widgets/common/image/image_item.dart';
import 'package:tidoy_booking_app/core/widgets/common/text/app_text_default.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final CarouselSliderController _controller = CarouselSliderController();
  int active = 0;

  final List<Map<String, String>> _slides = [
    {
      'image': 'image-boarding-1',
      'title': 'Gateway to Your Adventure',
      'desc': 'Enjoy various housing options, from budget to luxury, in Tidoy.',
    },
    {
      'image': 'image-boarding-2',
      'title': 'Discover the Wonders of the World: Let\'s Explore!',
      'desc': 'Book a stay wherever you are, whenever you want.',
    },
    {
      'image': 'image-boarding-3',
      'title': 'The Right Solution for Your Holiday Accommodation',
      'desc':
          'A stress-free Holiday? Trust your Holiday accommodation to Tidoy!',
    },
  ];

  void _nextPage() {
    if (active < _slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() async {
    await ref.read(onboardingProvider.notifier).setSeen();
    if (!mounted) return;
    GoRouter.of(context).go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Text'), backgroundColor: AppColor.primary),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: double.infinity,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  autoPlayInterval: Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      active = index;
                    });
                  },
                ),
                items: _slides.map((slide) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            margin: EdgeInsets.only(bottom: 24),
                            child: ImageItem(
                              name: slide['image'].toString(),
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 32,
                              right: 32,
                              bottom: 4,
                            ),
                            child: AppTextDefault(
                              label: slide['title'].toString(),
                              fontSize: 24,
                              textCenter: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: AppTextDefault(
                              label: slide['desc'].toString(),
                              fontSize: 16,
                              color: LightColor.text60,
                              textCenter: true,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _slides.asMap().entries.map((entry) {
                  return Container(
                    width: active == entry.key ? 26.0 : 8.0,
                    height: active == entry.key ? 8.0 : 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(99)),
                      color: active == entry.key
                          ? AppColor.primary
                          : LightColor.bg30,
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 42,
                top: 100,
                left: 16,
                right: 16,
              ),
              child: Row(
                spacing: 16,
                children: [
                  ButtonSecond(
                    label: 'Skip',
                    width: 80,
                    onPressed: _finishOnboarding,
                  ),
                  Expanded(
                    child: ButtonPrimary(
                      label: active == _slides.length - 1 ? 'Start' : 'Next',
                      onPressed: _nextPage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
