import 'package:ediphot/screens/editphoto/widgets/editoptions/editoptionwidget.dart';
import 'package:ediphot/screens/editphoto/widgets/filters/filter_tile.dart';
import 'package:flutter/material.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';

class FilterTileList extends EditOptionWidget {
  final String name;

  FilterTileList(this.name) : super(name: name);

  final List<Filter> filters = presetFiltersList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ...filters
              .map((filter) => FilterTile(
                    name: filter.name,
                  ))
              .toList()
        ],
      ),
    );
  }
}
