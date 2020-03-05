import 'package:flutter/material.dart';

class EditPhotoScreen extends StatelessWidget {
  static const routeName = '/editphoto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('here will be gallery'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        onPressed: () {},
      ),
    );
  }
}
