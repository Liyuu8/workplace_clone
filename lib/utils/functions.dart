import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeAgo;

String createTimeAgoString(DateTime postDateTime) {
  final currentLocale = Intl.getCurrentLocale();
  final now = DateTime.now();
  final difference = now.difference(postDateTime);
  return timeAgo.format(now.subtract(difference), locale: currentLocale);
}
