import 'package:flutter/material.dart';
import 'package:area/area.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PackageScreen(),
    );
  }
}

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  final TextEditingController textHeight = TextEditingController();
  final TextEditingController textWidth = TextEditingController();
  String result = '';

  @override
  void dispose() {
    textHeight.dispose();
    textWidth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package App'),
      ),
      body: Column(
        children: [
          AppTextField(textWidth, 'Width'),
          AppTextField(textHeight, 'Height'),
          const Padding(padding: EdgeInsets.all(24)),
          ElevatedButton(
            onPressed: () {
              double width = double.tryParse(textWidth.text) ?? 0;
              double height = double.tryParse(textHeight.text) ?? 0;
              String res = calculateAreaReact(width, height);
              setState(() {
                result = res;
              });
            },
            child: const Text('Calculate Area'),
          ),
          const Padding(
            padding: EdgeInsets.all(24),
          ),
          Text(result),
        ],
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const AppTextField(this.controller, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: label),
      ),
    );
  }
}
