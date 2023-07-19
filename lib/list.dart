import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final countController = Get.put(CountWidgetController());
  var list = <Widget>[];

  @override
  void initState() {
    for (var i = 0; i <= 100; i++) {
      countController.listCountWidget.value
          .add(ListItemWidget(count: 0, index: i));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list = countController.listCountWidget.value;
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => list[index]),
      ),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  int? count;
  int? index;
  ListItemWidget({this.count, this.index});
  @override
  State<ListItemWidget> createState() =>
      _ListItemWidgetState(this.count, this.index);
}

class _ListItemWidgetState extends State<ListItemWidget> {
  int? count;
  int? index;
  _ListItemWidgetState(this.count, this.index);
  // var count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Text(count.toString()),
            MaterialButton(
              onPressed: () {
                setState(() {
                  count = count! + 1;
                });
                Get.put(CountWidgetController()).listCountWidget[index!] =
                    ListItemWidget(count: count, index: index);
              },
              child: const Text("+"),
            )
          ],
        ));
  }
}

class CountWidgetController {
  RxList<Widget> listCountWidget = <Widget>[].obs;
}
