import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PatientAvatarPicker extends StatefulWidget {
  const PatientAvatarPicker({Key? key}) : super(key: key);

  @override
  State<PatientAvatarPicker> createState() => _PatientAvatarPickerState();
}

class _PatientAvatarPickerState extends State<PatientAvatarPicker> {
  File? _image;

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _getImage,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: _image != null ? FileImage(_image!) : null,
        child: _image == null
            ? const Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
