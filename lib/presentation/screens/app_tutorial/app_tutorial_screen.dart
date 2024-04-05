import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Escoje un área', 'Escoge una opción de las 7+ que tenemos',
      'assets/images/1.png'),
  SlideInfo(
      'Juega con los widgets',
      'Todos estan hechos para ti, disfrutalos de la mejor manera!',
      'assets/images/2.png'),
  SlideInfo(
      'Mantente entretenido',
      'Puedes regresar y seleccionar otro widget de los disponibles',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if(!endReached && page >= (slides.length -1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }

@override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Stack(
      children: [
        PageView(
          controller: pageviewController,
          physics: const BouncingScrollPhysics(),
          children: slides
              .map((slideData) => _Slide(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl))
              .toList(),
        ),
        Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Omitir'),
              onPressed: () => context.pop(),
            )),
        endReached ? Positioned(
          bottom: 40,
          right: 30,
            child: FadeInRight(
              from: 15,
              delay: Duration(milliseconds: 500),
              child: FilledButton(
                        child: Text('¡Entendido!'),
                        onPressed: () => context.pop(),
                      ),
            )) 
        : SizedBox()
      ],
    ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
