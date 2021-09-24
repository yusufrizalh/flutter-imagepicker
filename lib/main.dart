import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ImagePickerExample());
}

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      title: 'Flutter ImagePicker',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ImagePicker'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _image != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      width: 300,
                      height: 300,
                      child: Image.file(
                        _image,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('No image selected'),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _getImage(ImageSource.gallery),
                  icon: Icon(Icons.image),
                  label: Text('gallery'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _getImage(ImageSource.camera),
                  icon: Icon(Icons.camera),
                  label: Text('camera'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getImage(ImageSource imageSource) async {
    PickedFile imageFile = await picker.getImage(source: imageSource);
    if (imageFile == null) return;
    setState(
      () {
        _image = File(imageFile.path);
      },
    );
  }
}
