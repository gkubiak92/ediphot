import 'package:flutter/material.dart';

class TakePhotoScreen extends StatelessWidget {
  static const routeName = '/takephoto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('here will be camera'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () {},
      ),
    );
  }
}
