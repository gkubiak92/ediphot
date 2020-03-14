import 'package:ediphot/screens/editphoto/widgets/editoptions/adjust/adjustwidgetlist.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/filterslist.dart';

class EditWidgetList {
  final List<dynamic> _editWidgetlist = [
    FiltersList(name: 'Filters'),
    AdjustWidgetList(name: 'Adjust'),
  ];

  List<dynamic> get editWidgetList {
    return _editWidgetlist;
  }
}
