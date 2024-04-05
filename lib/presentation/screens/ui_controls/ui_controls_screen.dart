import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Goddess { aimep3, ternura68, nicki, cardiB }

class _UiControlsViewState extends State<_UiControlsView> {
  bool potaxiane = false;
  Goddess selectedGoddess = Goddess.ternura68;
  bool wpp = false;
  bool fb = false;
  bool ig = false;
  bool sc = false;

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const ClampingScrollPhysics(), children: [
      SwitchListTile(
          title: const Text('Potaxiane?'),
          subtitle: const Text('Escoge ahora perre'),
          value: potaxiane,
          onChanged: (value) {
            setState(() {
              potaxiane = !potaxiane;
            });
          }),
      ExpansionTile(
        title: const Text('Diose'),
        subtitle: Text(('$selectedGoddess')),
        children: [
          RadioListTile(
              title: const Text('Ternure68'),
              value: Goddess.ternura68,
              groupValue: selectedGoddess,
              onChanged: (value) => setState(() {
                    selectedGoddess = Goddess.ternura68;
                  })),
          RadioListTile(
              title: const Text('Aimep3'),
              value: Goddess.aimep3,
              groupValue: selectedGoddess,
              onChanged: (value) => setState(() {
                    selectedGoddess = Goddess.aimep3;
                  })),
          RadioListTile(
              title: const Text('Nicki Monjaj'),
              subtitle: const Text('que asca si escoges esta'),
              value: Goddess.nicki,
              groupValue: selectedGoddess,
              onChanged: (value) => setState(() {
                    selectedGoddess = Goddess.nicki;
                  })),
          RadioListTile(
              title: const Text('Cardi B'),
              value: Goddess.cardiB,
              groupValue: selectedGoddess,
              onChanged: (value) => setState(() {
                    selectedGoddess = Goddess.cardiB;
                  })),
        ],
      ),
      const ListTile(
        title: Text('¿Qué medio usas pute?'),
      ),
      CheckboxListTile(
          title: const Text('Whatsapp'),
          value: wpp,
          onChanged: (value) => setState(() {
                wpp = !wpp;
              })),
      CheckboxListTile(
          title: const Text('Facebook'),
          value: fb,
          onChanged: (value) => setState(() {
                fb = !fb;
              })),
      CheckboxListTile(
          title: const Text('Instagram'),
          value: ig,
          onChanged: (value) => setState(() {
                ig = !ig;
              })),
      CheckboxListTile(
          title: const Text('Snapchat'),
          value: sc,
          onChanged: (value) => setState(() {
                sc = !sc;
              })),
    ]);
  }
}
