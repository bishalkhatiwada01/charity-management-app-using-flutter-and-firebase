import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background, // Background color set to black for full-screen effect
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme
              .of(context)
              .colorScheme
              .inversePrimary, // Change your color here
        ),
        backgroundColor: Colors.transparent, // Transparent app bar
        elevation: 0, // No shadow
      ),
      body: Center(
        child: Hero(
          transitionOnUserGestures: true,
          tag: imageUrl, // Unique tag for Hero animation
          child: Image.network(
            imageUrl,
            // Fit the image to the screen size
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
