import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: SplashScreenContent(
        image: 'assets/splash/1.jpg',
        maintext: 'Ultra Modern Home',
        subtext:
            'Our products combine functional utility \n with elegance, kepping in view the \n efficient and of floor space.',
      ),
    ));
  }
}

class SplashScreenContent extends StatelessWidget {
  const SplashScreenContent({
    super.key,
    required this.image,
    required this.maintext,
    required this.subtext,
  });

  final String image;
  final String maintext;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
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
      Positioned(
          left: 30,
          top: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 70),
                child: Text(
                  maintext,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                subtext,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              Row(children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ],
          )),
    ]);
  }
}
