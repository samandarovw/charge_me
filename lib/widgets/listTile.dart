import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../generated/assets.dart';

class MyListTile extends StatefulWidget {
  final SvgPicture? icon;
  final String title;
  final Widget action;
  final Color title_color;
  final Color tile_color;

  const MyListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.action,
      required this.title_color,
      required this.tile_color });

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: widget.tile_color),
      child: ListTile(
          leading: widget.icon == null? SizedBox(): Container(
            padding: EdgeInsets.all(7),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(8)),
            child: widget.icon,
          ),
          title: Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: widget.title_color),
          ),
          trailing: widget.action),
    );
  }
}
