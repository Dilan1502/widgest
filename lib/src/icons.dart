import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyApp extends StatelessWidget {
  static String _title = 'ejemplo Galaxi';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Galaxi(),
    );
  }
}

class Galaxi extends StatefulWidget {
  Galaxi({super.key});

  @override
  State<Galaxi> createState() => _GalaxiState();
}
class _GalaxiState extends State<Galaxi> {
   final List<String> imageUrls = [
    'https://m.media-amazon.com/images/I/61TNES7B17L._AC_.jpg',
    'https://cdn.pixabay.com/photo/2017/08/08/00/33/constellations-2609647_640.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/004/680/860/small/background-of-abstract-galaxies-with-stars-and-planets-with-dark-and-blue-smoke-motifs-of-the-universe-night-light-space-photo.jpg',
  ];
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText(
                          'FULL GAS',
                          textStyle: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 76,
                            color: Color.fromRGBO(169, 43, 43, 1),
                            fontFamily: 'cursive',
                          ),
                        ),
                      ],
                      repeatForever: true,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: 600,
                    child: CarouselSlider(
                      options: CarouselOptions(),
                      items: imageUrls.map((url) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Image.network(
                                url,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Text('GALAXIAS'),
                  SizedBox(width: 40),
                  ElevatedButton(
                    child: Text('MIRAR MAS IMAGENES'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Alerta'),
                            content: Text('EN ESTE MOMENTO NO CONTAMOS CON MAS IMAGENES EN EL CARRUSEL, VUELVA OTRO DIA, GRACIAS.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('CERRAR'),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Cerrar el cuadro de diálogo
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ), //aqui se cierra el boton
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.headphones),
                  onPressed: () {
                    // Lógica para el botón de Facebook
                  },
                ),
                IconButton(
                  icon: Icon(Icons.tv),
                  onPressed: () {
                    // Lógica para el botón de Twitter
                  },
                ),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    // Lógica para el botón de Twitter
                  },
                ),
                IconButton(
                  icon: Icon(Icons.phone_iphone),
                  onPressed: () {
                    // Lógica para el botón de Twitter
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}