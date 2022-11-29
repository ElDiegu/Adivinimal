import 'dart:io';

import 'animal.dart';
import 'package:flutter/cupertino.dart';

class AnimalDataBase {
  List<Animal> animals = [];

  void addAnimal(String name, ImageProvider image, List<String> c1,
      List<String> c2, List<String> c3, List<String> c4, int c5) {
    final newAnimal = Animal(
        name,
        image,
        c1,
        c2,
        c3,
        c4,
        c5);
    animals.add(newAnimal);
  }

  AnimalDataBase() {
    addAnimal(
        "Flamenco",
        AssetImage('assets/animales/flamenco.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Omnívoro'],
        ['Aire', 'Tierra'],
        110);

    addAnimal(
        "Cuervo",
        AssetImage('assets/animales/cuervo.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Omnívoro'],
        ['Aire', 'Tierra'],
        65);

    addAnimal(
        "Pingüino Emperador",
        AssetImage('assets/animales/pingu_emperador.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua', 'Tierra'],
        120);

    addAnimal(
        "Gallina",
        AssetImage('assets/animales/gallina.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Omnívoro'],
        ['Aire', 'Tierra'],
        40);

    addAnimal(
        "Kiwi",
        AssetImage('assets/animales/kiwi.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Omnívoro'],
        ['Tierra'],
        30);

    addAnimal("Ganso Blanco",
        AssetImage('assets/ganso_blanco.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Herbívoro'],
        ['Aire', 'Tierra'],
        79);

    addAnimal("Avestruz",
        AssetImage('assets/animales/avestruz.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Herbívoro'],
        ['Tierra'],
        275);

    addAnimal("Paloma Bravia",
        AssetImage('assets/animales/paloma_bravia.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Herbívoro'],
        ['Aire', 'Tierra'],
        37);

    addAnimal("Frailecillo Atlántico",
        AssetImage('assets/animales/frailecillo_atlantico.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Aire', 'Tierra', 'Agua'],
        32);

    addAnimal("Águila Calva",
        AssetImage('assets/animales/aguila_calva.png'),
        ['Ave'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra','Aire'],
        102);

    addAnimal("Lucio",
        AssetImage('assets/animales/lucio.png'),
        ['Pez'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua'],
        70);

    addAnimal("Salmón Atlántico",
        AssetImage('assets/animales/salmon_atlantico.png'),
        ['Pez'],
        ['Ovíparo'],
        ['Omnívoro'],
        ['Agua'],
        75);

    addAnimal("Pez Betta",
        AssetImage('assets/animales/pez_betta.png'),
        ['Pez'],
        ['Ovíparo'],
        ['Omnívoro'],
        ['Agua'],
        7);

    addAnimal("Pez Gota",
        AssetImage('assets/animales/pez_gota.png'),
        ['Pez'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua'],
        30);

    addAnimal("Tiburón Ballena",
        AssetImage('assets/animales/tiburon_ballena.png'),
        ['Pez'],
        ['Ovovivíparo'],
        ['Carnívoro'],
        ['Agua'],
        700);

    addAnimal("Pez Cirujano",
        AssetImage('assets/animales/pez_cirujano.png'),
        ['Pez'],
        ['Ovíparo'],
        ['Herbívoro'],
        ['Agua'],
        25);


    addAnimal("Anguila Eléctrica",
        AssetImage('assets/animales/anguila_electrica.png'),
        ['Pez'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua'],
        200);

    addAnimal("Pez Volador",
        AssetImage('assets/animales/pez_volador.png'),
        ['Pez'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua','Aire'],
        20);

    addAnimal("Mantarraya",
        AssetImage('assets/animales/mantarraya.png'),
        ['Pez'],
        ['Ovovivíparo'],
        ['Carnívoro'],
        ['Agua'],
        450);

    addAnimal("Pez Unicornio",
        AssetImage('assets/animales/pez_unicornio.png'),
        ['Pez'],
        ['Ovíparo'],
        ['Herbívoro'],
        ['Agua'],
        70);

    addAnimal("Gato",
        AssetImage('assets/animales/gato.png'),
        ['Mamífero'],
        ['Vivíparo'],
        ['Omnívoro'],
        ['Tierra'],
        35);

    addAnimal("Delfín",
        AssetImage('assets/animales/delfin.png'),
        ['Mamífero'],
        ['Vivíparo'],
        ['Carnívoro'],
        ['Agua'],
        200);

    addAnimal("Elefante",
        AssetImage('assets/animales/elefante.png'),
        ['Mamífero'],
        ['Vivíparo'],
        ['Herbívoro'],
        ['Tierra'],
        400);

    addAnimal("Ornitorrinco",
        AssetImage('assets/animales/ornitorrinco.png'),
        ['Mamífero'],
        ['Ovíparo'],
        ['Omnívoro'],
        ['Agua', 'Tierra'],
        45);

    addAnimal("León",
        AssetImage('assets/animales/leon.png'),
        ['Mamífero'],
        ['Vivíparo'],
        ['Carnívoro'],
        ['Tierra'],
        180);

    addAnimal("Equidna",
        AssetImage('assets/animales/equidna.png'),
        ['Mamífero'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra'],
        45);
    addAnimal("Ballena Azul",
        AssetImage('assets/animales/ballena_azul.png'),
        ['Mamífero'],
        ['Vivíparo'],
        ['Carnívoro'],
        ['Agua'],
        2400);

    addAnimal("Murciélago Vampiro",
        AssetImage('assets/animales/murcielago_vampiro.png'),
        ['Mamífero'],
        ['Vivíparo'],
        ['Carnívoro'],
        ['Tierra','Aire'],
        9);

    addAnimal("Ardilla Voladora",
        AssetImage('assets/animales/ardilla_voladora.png'),
        ['Mamífero'],
        ['Vivíparo'],
        ['Omnívoro'],
        ['Tierra','Aire'],
        37);

    addAnimal("Conejo",
        AssetImage('assets/animales/conejo.png'),
        ['Mamífero'],
        ['Vivíparo'],
        ['Herbívoro'],
        ['Tierra'],
        42);

    addAnimal("Rana Común",
        AssetImage('assets/animales/rana_comun.png'),
        ['Anfibio'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra', 'Agua'],
        8);

    addAnimal("Ajolote",
        AssetImage('assets/animales/ajolote.png'),
        ['Anfibio'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua'],
        23);

    addAnimal("Sapo Común",
        AssetImage('assets/animales/sapo.png'),
        ['Anfibio'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra', 'Agua'],
        15);

    addAnimal("Tritón",
        AssetImage('assets/animales/triton.png'),
        ['Anfibio'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua'],
        7);

    addAnimal("Cecilia",
        AssetImage('assets/animales/cecilia.png'),
        ['Anfibio'],
        ['Ovovivíparo'],
        ['Carnívoro'],
        ['Tierra'],
        9);

    addAnimal("Salamandra Común",
        AssetImage('assets/animales/salamandra_comun.png'),
        ['Anfibio'],
        ['Ovovivíparo'],
        ['Carnívoro'],
        ['Agua','Tierra'],
        25);

    addAnimal("Anguila de Fango",
        AssetImage('assets/animales/anguila_de_fango.png'),
        ['Anfibio'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua'],
        69);

    addAnimal("Sirena Mayor",
        AssetImage('assets/animales/sirena_mayor.png'),
        ['Anfibio'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua'],
        97);

    addAnimal("Rana Punta de Flecha",
        AssetImage('assets/animales/rana_punta_de_flecha.png'),
        ['Anfibio'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Agua','Tierra'],
        4);

    addAnimal("Rana Planeadora",
        AssetImage('assets/animales/rana_planeadora.png'),
        ['Anfibio'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Aire','Tierra'],
        8);

    addAnimal("Gecko",
        AssetImage('assets/animales/gecko.png'),
        ['Reptil'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra'],
        15);

    addAnimal("Salamanquesa",
        AssetImage('assets/animales/salamanquesa.png'),
        ['Reptil'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra'],
        16);

    addAnimal("Dragón de komodo",
        AssetImage('assets/animales/dragon_de_komodo.png'),
        ['Reptil'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra'],
        250);

    addAnimal("Tortuga marina",
        AssetImage('assets/animales/tortuga_marina.png'),
        ['Reptil'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra'],
        80);

    addAnimal("Cocodrilo",
        AssetImage('assets/animales/cocrodilo.png'),
        ['Reptil'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra', 'Agua'],
        400);

    addAnimal("Sargantana",
        AssetImage('assets/animales/sargantana.png'),
        ['Reptil'],
        ['Ovíparo'],
        ['Carnívoro'],
        ['Tierra'],
        5);

    addAnimal("Iguana Verde",
        AssetImage('assets/animales/iguana_verde.png'),
        ['Reptil'],
        ['Ovíparo'],
        ['Herbívoro'],
        ['Tierra'],
        40);

    addAnimal("Serpiente de Cascabel",
        AssetImage('assets/animales/serpiente_de_cascabel.png'),
        ['Reptil'],
        ['Ovovivíparo'],
        ['Carnívoro'],
        ['Tierra'],
        150);

    addAnimal("Tortuga Terrestre",
        AssetImage('assets/animales/tortuga_terrestre.png'),
        ['Reptil'],
        ['Ovíparo'],
        ['Herbívoro'],
        ['Tierra'],
        80);

    addAnimal("Culebra de Agua",
        AssetImage('assets/animales/culebra_de_agua.png'),
        ['Reptil'],
        ['Ovovivíparo'],
        ['Carnívoro'],
        ['Tierra','Agua'],
        50);

  }
}