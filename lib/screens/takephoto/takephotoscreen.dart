import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePhotoScreen extends StatefulWidget {
  static const routeName = '/takephoto';

  @override
  _TakePhotoScreenState createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  CameraDescription _camera;
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    _camera = cameras.first;
  }

  @override
  void initState() {
    initCamera();
    super.initState();
    print('camera initialized');
    _controller = CameraController(
      _camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print('camerapreview initialized');
            return CameraPreview(_controller);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () {},
      ),
    );
  }
}
