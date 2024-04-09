import 'package:flutter/material.dart';
import 'package:flutter_8/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    // este view padding nos indica cuánto padding tiene el dispositivo
    // en este caso, en el area superior, observando que aquellos que tienen más
    // de 35 de padding probablemente cuenten con un notch
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          // en el index del appMenu, lo guardamos en una variable
          final menuItem = appMenuItems[value];
          // llamamos el push que abra la pantalla
          context.push(menuItem.link);
          // accedemos el scaffold del homescreen y cerramos el drawer
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
              child: const Text(
                'Testing App',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              )),
          ...appMenuItems
              .sublist(0,
                  3) // este sublist toma un slice de la lista (en este caso, del
              //index 0 al index 3 ( 0, 1, 2))
              .map((item) => NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title))),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Text('Más opciones'),
          ),
          ...appMenuItems
              .sublist(3) // aqui el sublist continua empezando de la posicion 3
              //hasta el fin de la posicion
              .map((item) => NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title))),
        ]);
  }
}
