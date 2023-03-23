import 'package:flutter/material.dart';

extension InsertableList<T extends Widget> on List<T> {
  List<T> insertEvery(int n, T elem, {canEndWithElement = false}) {
    final list = [...this];
    List<T> listWithInsertions = [];
    for (final e in list) {
      final index = indexOf(e);
      if ((index + 1) % n == 0) {
        listWithInsertions.add(elem);
      }
      listWithInsertions.add(e);
    }

    if (listWithInsertions.isEmpty) {
      return list;
    }
    if (listWithInsertions.last == elem && canEndWithElement == false) {
      listWithInsertions.removeLast();
    }
    if (listWithInsertions.first == elem) {
      listWithInsertions.removeAt(0);
    }
    return listWithInsertions;
  }
}

extension ListExtension<T> on List<T> {
  List<List<T>> splitIntoChunks({required int chunkSize}) {
    List<List<T>> chunks = [];
    for (var i = 0; i < length; i += chunkSize) {
      chunks.add(sublist(i, i + chunkSize > length ? length : i + chunkSize));
    }
    return chunks;
  }
}
