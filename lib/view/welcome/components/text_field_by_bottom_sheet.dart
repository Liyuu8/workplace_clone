import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// styles
import 'package:workplace_clone/styles.dart';

// utils
import 'package:workplace_clone/utils/constants.dart';

// view models
import 'package:workplace_clone/view_models/welcome_view_model.dart';

class TextFieldByBottomSheet extends StatelessWidget {
  final String content;
  final bool isContentEmpty;
  final String contentTitle;
  final List<String> contentChoiceList;
  final BottomSheetContentType contentType;
  TextFieldByBottomSheet({
    @required this.content,
    @required this.isContentEmpty,
    @required this.contentTitle,
    @required this.contentChoiceList,
    @required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openBottomSheet(context),
      child: Column(
        children: [
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                content,
                style: isContentEmpty
                    ? kWelcomeDetailsInputEmptyTextStyle
                    : kWelcomeDetailsInputTextStyle,
              ),
              Icon(Icons.expand_more),
            ],
          ),
          SizedBox(height: 5.0),
          Divider(color: Colors.black),
        ],
      ),
    );
  }

  _openBottomSheet(BuildContext context) async {
    showModalBottomSheet<String>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  contentTitle,
                  style: kWelcomeDetailsBottomSheetTextStyle,
                ),
              ),
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: contentChoiceList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  final welcomeViewModel = context.read<WelcomeViewModel>();
                  welcomeViewModel.updateTextFieldByBottomSheet(
                    contentChoiceList[index],
                    contentType,
                  );
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    contentChoiceList[index],
                    style: kWelcomeDetailsBottomSheetTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
    );
  }
}
