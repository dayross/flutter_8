

import 'package:flutter/material.dart';
import 'package:flutter_8/config/menu/menu_items.dart';
import 'package:flutter_8/presentation/widgets/side_menu.dart';

import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  HomeScreen({super.key});
  // creacion de llave para acceder al scaffold desde otras clases
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter + Material3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey,)
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final items = appMenuItems[index];
        return _CustomListTile(items: items);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.items,
  });

  final MenuItem items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        items.icon,
        color: theme.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_sharp,
        color: theme.primary,
      ),
      title: Text(items.title),
      subtitle: Text(items.subtitle),
      onTap: () {
        context.push(items.link);
/*           Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ButtonsScreens(),
            ),
          ); */
        //Navigator.pushNamed(context, items.link);
      },
    );
  }
}
