import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Contador',
      subtitle: 'Contador de clicks con botón',
      link: '/counter',
      icon: Icons.plus_one),
  MenuItem(
      title: 'Botones',
      subtitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subtitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicators',
      subtitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars y dialogos',
      subtitle: 'Pequeños popUps en diversas areas de la pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Container',
      subtitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.square_foot_rounded),
  MenuItem(
      title: 'UI Controls + Tiles',
      subtitle: 'Controles en flutter',
      link: '/ui-controls',
      icon: Icons.play_lesson_rounded),
  MenuItem(
      title: 'Tutorial',
      subtitle: 'Aprende el uso de nuestra aplicación',
      link: '/tutorial',
      icon: Icons.psychology_alt),
  MenuItem(
      title: 'Infinite Scroll y Pull to Refresh',
      subtitle: 'Pantalla de deslizo infinita y pull to refresh',
      link: '/infinite',
      icon: Icons.view_timeline_rounded),
  MenuItem(
      title: 'Cambiar tema',
      subtitle: 'Cambiar tema y color de la aplicacion',
      link: '/theme-changer',
      icon: Icons.palette_outlined),
];
