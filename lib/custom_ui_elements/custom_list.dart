import 'package:flutter/material.dart';

class CustomList extends StatefulWidget {
  final List<String> items;
  final Function(int) onTap;

  const CustomList({
    required this.items,
    required this.onTap,
  });

  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  int _hoveredIndex = -1;

  void _handleHover(int index, bool isHovered) {
    setState(() {
      _hoveredIndex = isHovered ? index : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(10.0),
      itemCount: widget.items.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Colors.grey),
      itemBuilder: (BuildContext context, int index) {
        return MouseRegion(
          onEnter: (_) => _handleHover(index, true),
          onExit: (_) => _handleHover(index, false),
          child: ListTile(
            title: Text(
              widget.items[index],
              style: TextStyle(
                color: _hoveredIndex == index ? Colors.teal : Colors.black,
              ),
            ),
            onTap: () => widget.onTap(index),
          ),
        );
      },
    );
  }
}
