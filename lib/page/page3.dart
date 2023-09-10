import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AHHHH'),
        backgroundColor: const Color.fromARGB(255, 233, 181, 255),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Container(
                        // A fixed-height child.
                        color:
                            const Color.fromARGB(255, 158, 252, 255), // Yellow
                        height: 120.0,
                        alignment: Alignment.center,
                        child: const Icon(Icons.cloud_outlined),
                      ),
                      Expanded(
                        // A flexible child that will grow to fit the viewport but
                        // still be at least as big as necessary to fit its contents.
                        child: Container(
                          color:
                              const Color.fromARGB(255, 129, 255, 185), // Red
                          height: 120.0,
                          alignment: Alignment.center,
                          child: const Icon(Icons.terrain_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
