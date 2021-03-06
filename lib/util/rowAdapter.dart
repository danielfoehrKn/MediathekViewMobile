import 'package:flutter/material.dart';
import 'package:flutter_ws/enum/channels.dart';
import 'package:flutter_ws/model/Video.dart';
import 'package:flutter_ws/widgets/list/ListCard.dart';
import 'package:uuid/uuid.dart';

class RowAdapter {
  static Widget createRow(Video video) {
    Uuid uuid = new Uuid();

    String assetPath = Channels.channelMap.entries
        .firstWhere(
            (entry) =>
                video.channel.toUpperCase().contains(entry.key.toUpperCase()) ||
                entry.key.toUpperCase().contains(video.channel.toUpperCase()),
            orElse: () => new MapEntry("", ""))
        .value;

    return new ListCard(
        key: new Key(uuid.v1()), imgPath: assetPath, video: video);
  }
}
