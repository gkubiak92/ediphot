import 'package:ediphot/providers/imagepicker.dart';
import 'package:ediphot/screens/home/widgets/homecard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imagePickerProvider = Provider.of<ImagePickerProvider>(context);

    return Expanded(
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      HomeCard(
                        image: Image.asset('assets/undraw_take_photo.png'),
                        title: 'Take photo',
                        onTap: () => imagePickerProvider.getImageAndEdit(
                          context,
                          ImageSource.camera,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      HomeCard(
                        image: Image.asset('assets/undraw_gallery.png'),
                        title: 'Choose photo',
                        onTap: () => imagePickerProvider.getImageAndEdit(
                          context,
                          ImageSource.gallery,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      HomeCard(
                        image: Image.asset('assets/undraw_collage.png'),
                        title: 'Collage',
                        onTap: () =>
                            Navigator.of(context).pushNamed('/collage'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      HomeCard(
                        image: Image.asset('assets/undraw_retouch.png'),
                        title: 'Magic retouch',
                        onTap: () =>
                            Navigator.of(context).pushNamed('/magicretouch'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
