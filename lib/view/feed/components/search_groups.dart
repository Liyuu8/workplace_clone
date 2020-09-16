import 'package:flutter/material.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

class SearchGroups extends StatelessWidget {
  final ValueChanged onSearch;
  final TextEditingController _textEditingController = TextEditingController();

  SearchGroups({this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          onSubmitted: onSearch,
          maxLines: 1,
          controller: _textEditingController,
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.grey),
            hintText: S.of(context).searchGroupsInput,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
