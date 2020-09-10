import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// data models
import 'package:workplace_clone/data_models/group.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/common/components/group_card.dart';
import 'package:workplace_clone/view/common/components/radio_select_dialog.dart';

// screens
import 'package:workplace_clone/view/group/screens/group_screen.dart';

// view models
import 'package:workplace_clone/view_models/group_view_model.dart';

class GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groupViewModel = Provider.of<GroupViewModel>(context, listen: false);
    final String groupSortAndFilterText = groupSortAndFilterStringMap[
        groupSortAndFilterIndexList[groupViewModel.groupSortAndFilterIndex]];

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  S.of(context).yourGroups,
                  style: kGroupMainLabelTextStyle,
                ),
              ),
              FlatButton(
                child: Row(
                  children: [
                    Text(groupSortAndFilterText),
                    Icon(Icons.expand_more),
                  ],
                ),
                onPressed: () => _openGroupSortAndFilterSettingDialog(context),
              ),
            ],
          ),
          Divider(),
          ListView.builder(
            itemCount: groupViewModel.groups.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => _openGroupScreen(
                context,
                groupViewModel.groups[index],
              ),
              child: GroupCard(
                title: groupViewModel.groups[index].name,
                photoUrl: groupViewModel.groups[index].photoUrl,
                isCheckboxExisted: false,
              ),
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }

  _openGroupSortAndFilterSettingDialog(BuildContext context) async {
    final groupViewModel = context.read<GroupViewModel>();
    int selectedIndex = await showRadioSelectDialog(
      context: context,
      contentTextList: groupSortAndFilterStringMap.values.toList(),
      selectedIndex: groupViewModel.groupSortAndFilterIndex,
    );
    groupViewModel.updateGroupSortAndFilterSetting(selectedIndex);
  }

  _openGroupScreen(BuildContext context, Group group) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => GroupScreen(group: group)),
    );
  }
}
