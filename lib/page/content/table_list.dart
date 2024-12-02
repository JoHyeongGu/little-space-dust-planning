import 'package:flutter/material.dart';
import 'package:little_space_dust_planning/tool/global_key_manager.dart';
import 'package:provider/provider.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  late Map<String, GlobalKey> keyList;
  bool open = true;

  @override
  void initState() {
    super.initState();
    keyList = context.read<GlobalKeyManager>().keyList;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: open
          ? width < 700
              ? width
              : width / 5
          : width / 30,
      decoration: BoxDecoration(
        color: open && width < 700
            ? Colors.black.withOpacity(0.5)
            : Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(30)),
      ),
      child: Row(
        children: [
          Flexible(
            child: IconButton(
              onPressed: () => setState(() {
                open = !open;
              }),
              icon: Icon(open ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          if (open)
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      keyList.entries.map((e) => TableBtn(e)).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class TableBtn extends StatefulWidget {
  final MapEntry table;
  const TableBtn(this.table, {super.key});

  @override
  State<TableBtn> createState() => _TableBtnState();
}

class _TableBtnState extends State<TableBtn> {
  bool bold = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Scrollable.ensureVisible(
              widget.table.value.currentContext,
              duration: const Duration(seconds: 1),
              curve: Curves.decelerate,
            );
          },
          onHover: (enter) {
            if (enter) {
              bold = true;
            } else {
              bold = false;
            }
            setState(() {});
          },
          child: Text(
            widget.table.key,
            style: TextStyle(
              color: Colors.white,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
