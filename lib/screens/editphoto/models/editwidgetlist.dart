import 'package:ediphot/screens/editphoto/widgets/editoptions/adjustwidget.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/filterslist.dart';

class EditWidgetList {
  final List<dynamic> _editWidgetlist = [
    FiltersList(name: 'Filters'),
    AdjustWidget(name: 'Adjust'),
  ];

  List<dynamic> get editWidgetList {
    return _editWidgetlist;
  }
}
