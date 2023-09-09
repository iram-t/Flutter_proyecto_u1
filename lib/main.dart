import 'package:flutter/material.dart';
import 'package:project_1/page/pages.dart';

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
      routes: {
        'page1': (context) => Page1(),
        'page2': (context) => Page2(),
        'page3': (context) => Page3(),
      },
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
        backgroundColor: const Color.fromARGB(255, 233, 181, 255),
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
          color: const Color.fromARGB(255, 245, 232, 255),
          alignment: Alignment.center,
          child: const DialogXP(),
        ),
        Container(
          color: const Color.fromARGB(255, 245, 232, 255),
          child: const PrimalCheck(),
        ),
        Container(
          color: const Color.fromARGB(255, 245, 232, 255),
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
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(215, 123, 255, 1),
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
            leading: const Icon(Icons.games_outlined),
            title: const Text('Juegos'),
            onTap: () {
              final route = MaterialPageRoute(builder: (context) => Page1());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.forum_outlined),
            title: const Text('Formulario'),
            onTap: () {
              final route = MaterialPageRoute(builder: (context) => Page2());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.restore_from_trash_outlined),
            title: const Text('Basura'),
            onTap: () {
              final route = MaterialPageRoute(builder: (context) => Page3());
              Navigator.push(context, route);
            },
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
          title: const Text('Quiero cafe'),
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Metroid Dread'),
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
