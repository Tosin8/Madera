import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../home/home_screen.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 50),
          width: double.infinity,
          child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                });
              },
              children: [
                Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/splash/1.jpg'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: const [
                            0.2,
                            0.9
                          ],
                              colors: [
                            Colors.black.withOpacity(.6),
                            Colors.black.withOpacity(.1)
                          ])),
                    ),
                  ),
                  const Positioned(
                      left: 30,
                      top: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 70),
                            child: Text(
                              'Ultra Modern Home',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Our products combine functional utility \n with elegance, kepping in view the \n efficient and of floor space.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ]),
                Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/splash/2.jpg'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: const [
                            0.2,
                            0.9
                          ],
                              colors: [
                            Colors.black.withOpacity(.6),
                            Colors.black.withOpacity(.1)
                          ])),
                    ),
                  ),
                  const Positioned(
                      left: 30,
                      top: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 120),
                            child: Text(
                              'Top Notch Decorations',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 80),
                            child: Text(
                              ' With selective combination from our \n interior expert, makes home color and \n decorations more appealing.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                ]),
                Stack(children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/splash/3.jpg'),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: const [
                            0.2,
                            0.9
                          ],
                              colors: [
                            Colors.black.withOpacity(.6),
                            Colors.black.withOpacity(.1)
                          ])),
                    ),
                  ),
                  const Positioned(
                      left: 30,
                      top: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 130),
                            child: Text(
                              'Classic Style',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            'Our products combine functional utility \n with elegance, kepping in view the \n efficient and of floor space.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ]),
              ]),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal.shade600,
                  minimumSize: const Size.fromHeight(80),
                ),
                onPressed: () async {
                  // navigate directly to home page
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Get Started'),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 80,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.jumpToPage(2);
                          },
                          child: const Text('Skip')),
                      Center(
                          child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                            spacing: 16,
                            dotColor: Colors.black26,
                            activeDotColor: Colors.teal.shade700),
                        onDotClicked: (index) {
                          controller.animateToPage(index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                      )),
                      TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text('Next'),
                      ),
                    ])),
      ),
    );
  }
}
