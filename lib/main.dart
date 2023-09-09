import 'package:flutter/material.dart';
// import 'package:project_1/page/navigator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Franken',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromRGBO(223, 71, 253, 0.3),
      ),
      home: const Navi(),
    );
  }
}

class Navi extends StatefulWidget {
  const Navi({super.key});

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromRGBO(227, 163, 255, 1),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromRGBO(183, 116, 255, 1),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.sell_outlined),
            icon: Icon(Icons.sell_outlined),
            label: 'Alice',
          ),
          NavigationDestination(
            icon: Icon(Icons.heart_broken_outlined),
            label: 'Madness',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.water_drop_outlined),
            icon: Icon(Icons.water_drop_outlined),
            label: 'Returns',
          ),
        ],
      ),
      drawer: _DrawState(),

      // Dentro de cada pestaña
      body: <Widget>[
        Container(
          color: const Color.fromRGBO(241, 222, 255, 1),
          alignment: Alignment.center,
          child: const DialogXP(),
        ),
        Container(
          color: const Color.fromRGBO(241, 222, 255, 1),
          child: const PrimalCheck(),
        ),
        Container(
          color: const Color.fromRGBO(241, 222, 255, 1),
          alignment: Alignment.center,
          child: const RadioExample(),
        ),
      ][currentPageIndex],
    );
  }
}

class _DrawState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

class DialogXP extends StatelessWidget {
  const DialogXP({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alerta!!!'),
          content: const Text('Terraria es el mejor juego?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Obiamente si'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Claramente si'),
            ),
          ],
        ),
      ),
      style: const ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(Color.fromRGBO(223, 71, 253, 0.3)),
      ),
      child: const Text('Picale aca carnal xs'),
    );
  }
}

class PrimalCheck extends StatefulWidget {
  const PrimalCheck({super.key});

  @override
  State<PrimalCheck> createState() => _PrimalCheck();
}

class _PrimalCheck extends State<PrimalCheck> {
  bool isChecked = false;
  bool isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CheckboxListTile(
          title: Text('Quiero cafe'),
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Metroid Dread'),
          checkColor: Colors.white,
          value: isChecked1,
          onChanged: (bool? value) {
            setState(() {
              isChecked1 = value!;
            });
          },
        ),
      ],
    );
  }
}

enum SingingCharacter { soledad, camina, lagrimas }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character = SingingCharacter.soledad;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Soledad'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.soledad,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Camina'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.camina,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Envuelta en lagrimas frias'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lagrimas,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
