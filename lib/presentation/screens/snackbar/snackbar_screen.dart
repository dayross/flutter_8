import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(
                      context: context, children: [const Text('Easter Egg\nHi')]);
                },
                child: const Text('Licencias potaxianas')),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text('Mostrar dialogo de pantalle')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Mostrar SnackBar'),
        icon: const Icon(Icons.gamepad_rounded),
      ),
    );
  }

  void openDialog(BuildContext context) {
    // builder significa que es algo que se va a construir en tiempo de ejecución
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('¿Estas seguro?'),
              content: const Icon(
                Icons.emoji_nature,
                size: 80,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('Cancelar')),
                FilledButton(onPressed: () {}, child: const Text('Aceptar'))
              ],
            ));
  }

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snakcbar = SnackBar(
      content: const Text('Hola Mundo'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Hola!',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snakcbar);
  }
}
