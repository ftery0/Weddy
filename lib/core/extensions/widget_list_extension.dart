import 'package:flutter/material.dart';

extension WidgetListSpacing on List<Widget> {
  /// 리스트의 각 위젯 사이에 SizedBox(height: spacing)를 자동 삽입
  List<Widget> withSpacing(double spacing) {
    if (isEmpty) return this;

    return expand((widget) => [
      widget,
      SizedBox(height: spacing),
    ]).toList()
      ..removeLast(); 
  }

  /// 수평(가로) 간격이 필요한 경우
  List<Widget> withHorizontalSpacing(double spacing) {
    if (isEmpty) return this;

    return expand((widget) => [
      widget,
      SizedBox(width: spacing),
    ]).toList()
      ..removeLast();
  }
}
