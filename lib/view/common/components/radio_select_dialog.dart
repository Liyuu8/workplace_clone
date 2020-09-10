import 'package:flutter/material.dart';

// トップレベル関数として定義する
Future<int> showRadioSelectDialog({
  @required BuildContext context,
  @required List<String> contentTextList,
  @required int selectedIndex,
}) async {
  return await showDialog(
    context: context,
    builder: (_) => RadioSelectDialog(
      contentTextList: contentTextList,
      selectedIndex: selectedIndex,
    ),
  );
}

class RadioSelectDialog extends StatelessWidget {
  final List<String> contentTextList;
  final int selectedIndex;
  RadioSelectDialog({this.contentTextList, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        height: 380.0,
        child: ListView.builder(
          itemCount: contentTextList.length,
          itemBuilder: (context, index) => SimpleDialogOption(
            child: ListTile(
              title: Text(
                contentTextList[index],
                style: index == selectedIndex
                    ? TextStyle(color: Colors.blueAccent)
                    : null,
              ),
              trailing: Radio<int>(
                value: index,
                groupValue: selectedIndex,
                onChanged: null,
                activeColor: Colors.blueAccent, // TODO: 色がグレーのままで変わらない
              ),
            ),
            onPressed: () => Navigator.pop(context, index),
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
  // https://flutter.keicode.com/basics/simpledialog.php
  // https://stackoverflow.com/questions/50095763/flutter-listview-in-a-simpledialog
}
