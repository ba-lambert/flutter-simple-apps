// blurhash.dart
import 'package:blurhash/widgets/BlueHashCard.dart';
import 'package:flutter/material.dart';

class BlurHashPackage extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged; // Callback function

  const BlurHashPackage({Key? key, required this.onThemeChanged})
      : super(key: key);

  @override
  State<BlurHashPackage> createState() => _BlurHashPackageState();
}

class _BlurHashPackageState extends State<BlurHashPackage> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('Title Goes here'),
        actions: <Widget>[
          Switch(
            value: isDarkMode,
            onChanged: (isOn) {
              widget.onThemeChanged(isOn
                  ? ThemeMode.dark
                  : ThemeMode.light); // Call the callback function
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            BlurHashCard(
                blurHash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                title: 'Nature',
                subtitle: 'Landscape')
          ],
        ),
      ),
    );
  }
}
