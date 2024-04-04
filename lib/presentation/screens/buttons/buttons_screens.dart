// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreens extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Buttons Screens'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
                onPressed: null, child: Text('Disabled Elevated')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.dangerous),
                label: const Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.zoom_in_sharp),
                label: const Text('Filled Icon')),
            OutlinedButton(
                onPressed: () {}, child: const Text('Outlined Button')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.face),
                label: const Text('Outlined Icon')),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.hail),
                label: const Text('Text Icon')),
            const CustomButton(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.nature)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.wallpaper),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.primary),
                    iconColor: const MaterialStatePropertyAll(Colors.grey))),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            SystemSound.play(SystemSoundType.click);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
            child: const Text(
              'Boton Especial',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
