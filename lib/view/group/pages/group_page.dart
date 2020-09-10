import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// components
import 'package:workplace_clone/view/group/components/group_list.dart';

// view models
import 'package:workplace_clone/view_models/group_view_model.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groupViewModel = Provider.of<GroupViewModel>(context, listen: false);
    Future(() => groupViewModel.getGroups());

    return Container(
      color: Colors.black12,
      child: Consumer<GroupViewModel>(
        builder: (context, model, child) => groupViewModel.isProcessing
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () => groupViewModel.getGroups(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GroupList(),
                      SizedBox(height: 24.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          S.of(context).createGroups,
                          style: kGroupCreateMessageTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 60.0,
                        ),
                        child: Text(
                          S.of(context).createGroupsDetail,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
