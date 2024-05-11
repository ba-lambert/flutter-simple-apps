import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class BlurHashCard extends StatefulWidget {
  final String blurHash;
  final String title;
  final String subtitle;

  const BlurHashCard({
    Key? key,
    required this.blurHash,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<BlurHashCard> createState() => _BlurHashCardState();
}

class _BlurHashCardState extends State<BlurHashCard> {
  late Future<String> _imageFuture;

  @override
  void initState() {
    super.initState();
    // Simulate image loading after 3 seconds
    _imageFuture = Future.delayed(Duration(seconds: 30), () {
      // Return a placeholder URL or actual image URL based on your requirement
      return 'https://i.ytimg.com/vi/T7CJg6rfki4/hqdefault.jpg'; // Placeholder URL
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: FutureBuilder<String>(
              future: _imageFuture,
              // Inside the FutureBuilder's builder method
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show loading indicator while waiting for the image
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Handle error if image fails to load
                  print('Error loading image: ${snapshot.error}');
                  return Center(child: Text('Error loading image'));
                } else {
                  // Show the BlurHash or actual image once loaded
                  return snapshot.data != null
                      ? Image.network(snapshot.data!, fit: BoxFit.cover)
                      : BlurHash(hash: widget.blurHash, imageFit: BoxFit.cover);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.subtitle,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
