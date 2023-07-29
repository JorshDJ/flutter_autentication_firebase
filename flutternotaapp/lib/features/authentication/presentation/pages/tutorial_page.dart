import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

//Seram los slides que se mostrarán en pantalla
final slides = <SlideInfo>[
  SlideInfo('Bienvenid@ a nuestra biblioteca',
      'Navega por todo nuestro repositorio.', 'assets/images/1.png'),
  SlideInfo(
      'Reserva un libro',
      'Puedes reservar un libro desde nuestra app para despues pedirlo físicamente en la biblioteca.',
      'assets/images/2.png'),
  SlideInfo('Descubre', ' ¡Sumérgete en un mundo de conocimiento!',
      'assets/images/3.png'),
];

class TutorialPage extends StatefulWidget {
  static const name = 'tutorial_screen';
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
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
            // El page View es para que se haga el scroll, y se puede mover entre las imagenes
            controller: pageviewController,
            physics:
                const BouncingScrollPhysics(), //Es para tener el mismo comportamiendo en android y ios
            //el children del Page View tiene que ser una coleccion de widges
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(), //el to list es para decir que es una lista
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Saltar'),
                onPressed: () => context.go('/login'),
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.go('/login'),
                      child: const Text('Comenzar'),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
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
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
