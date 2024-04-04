import 'package:flutter/material.dart';
import 'package:flutter_8/config/menu/menu_items.dart';
import 'package:flutter_8/presentation/screens/buttons/buttons_screens.dart';
import 'package:flutter_8/presentation/screens/cards/cards_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter + Material3'),
      ),
      body: const _HomeView(),
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
        context.pushNamed(CardsScreen.name);
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
