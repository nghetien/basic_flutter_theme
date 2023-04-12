part of '../data_table.dart';

class DataTableCheckBoxOption<T>{
  const DataTableCheckBoxOption({
    this.onSelectCheckBox,
  });

  final Function(Map<int, T>)? onSelectCheckBox;
}