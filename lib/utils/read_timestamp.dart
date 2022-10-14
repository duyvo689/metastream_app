readTimestamp(int? timestamp) {
  var now = DateTime.now();
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp! * 1000);
  var diff = now.difference(date);
  String time = '';

  if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0) {
    if (diff.inSeconds == 1) {
      time = diff.inSeconds.toString() + ' SECOND AGO';
    } else {
      time = diff.inSeconds.toString() + 'SECONDS AGO';
    }
  } else if (diff.inMinutes > 0 && diff.inHours == 0) {
    if (diff.inMinutes == 1) {
      time = diff.inMinutes.toString() + ' MINUTE AGO';
    } else {
      time = diff.inMinutes.toString() + ' MINUTES AGO';
    }
  } else if (diff.inHours > 0 && diff.inDays == 0) {
    if (diff.inHours == 1) {
      time = diff.inHours.toString() + ' HOUR AGO';
    } else {
      time = diff.inHours.toString() + ' HOURS AGO';
    }
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + ' DAY AGO';
    } else {
      time = diff.inDays.toString() + ' DAYS AGO';
    }
  } else {
    if (diff.inDays == 7) {
      time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
    } else {
      time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
    }
  }

  return time;
}
