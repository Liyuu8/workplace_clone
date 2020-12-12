import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// generated
import 'package:workplace_clone/generated/l10n.dart';

class PostCardLikeInfo extends StatelessWidget {
  final List<String> likeUserNameList;
  PostCardLikeInfo({this.likeUserNameList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Fluttertoast.showToast(
        msg: S.of(context).notImplement,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: Colors.blueAccent,
              width: 24.0,
              height: 24.0,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 2.0),
                    FaIcon(
                      FontAwesomeIcons.solidThumbsUp,
                      color: Colors.white,
                      size: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 5.0),
          Text(
            likeUserNameList.length < 4
                ? likeUserNameList.join(', ')
                : likeUserNameList.length.toString(),
          ),
        ],
      ),
    );
  }
}
