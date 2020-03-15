import 'package:ediphot/screens/editphoto/widgets/editoptions/adjust/brightness.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/adjust/contrast.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/adjust/exposure.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/adjust/gamma.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/adjust/hue.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/adjust/saturation.dart';
import 'package:ediphot/screens/editphoto/widgets/editoptions/editoptionwidget.dart';
import 'package:flutter/material.dart';

class AdjustWidgetList extends StatefulWidget with EditOptionWidget {
  final String name;

  AdjustWidgetList({this.name});

  @override
  _AdjustWidgetListState createState() => _AdjustWidgetListState();
}

class _AdjustWidgetListState extends State<AdjustWidgetList>
    with TickerProviderStateMixin {
  final List<Tab> adjustOptions = [
    Tab(
      icon: Icon(Icons.brightness_5, color: Colors.black),
    ),
    Tab(
      icon: Icon(Icons.brightness_6, color: Colors.black),
    ),
    Tab(
      icon: Icon(Icons.settings_brightness, color: Colors.black),
    ),
    Tab(
      icon: Icon(Icons.tonality, color: Colors.black),
    ),
    Tab(
      icon: Icon(Icons.exposure, color: Colors.black),
    ),
    Tab(
      icon: Icon(Icons.colorize, color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> adjustOptionsView = [
      Brightness(),
      Contrast(),
      Saturation(),
      Gamma(),
      Exposure(),
      Hue(),
    ];
    final TabController tabController = TabController(
      length: adjustOptions.length,
      vsync: this,
    );

    return Column(
      children: <Widget>[
        Container(
          width: 300,
          height: 50,
          child: TabBarView(
            /* set neverscrollable physics to avoid 
              conflict slider with gesture detector from tab bar view
            */
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: adjustOptionsView,
          ),
        ),
        SingleChildScrollView(
          child: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            isScrollable: true,
            controller: tabController,
            tabs: adjustOptions,
          ),
        ),
      ],
    );
  }
}
