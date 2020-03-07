import 'package:ediphot/models/editoption.dart';
import 'package:flutter/material.dart';

class EditOptionList {
  static const List<EditOption> options = const <EditOption>[
    const EditOption(title: 'Canvas', icon: Icons.aspect_ratio),
    const EditOption(title: 'Filter', icon: Icons.color_lens),
    const EditOption(title: 'Adjust', icon: Icons.tune),
    const EditOption(title: 'Crop', icon: Icons.crop),
    const EditOption(title: 'Sticker', icon: Icons.tag_faces),
    const EditOption(title: 'Text', icon: Icons.text_fields),
    const EditOption(title: 'Frame', icon: Icons.filter_frames),
    const EditOption(title: 'Restore', icon: Icons.settings_backup_restore),
  ];
}
