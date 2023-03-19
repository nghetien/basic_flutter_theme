part of '../data_table.dart';

class CheckBoxRowItem<T> extends StatelessWidget {
  const CheckBoxRowItem({
    Key? key,
    required this.rowData,
    required this.controller,
  }) : super(key: key);

  final T rowData;
  final DataTableController<T> controller;

  bool _getValueCheckBox() => controller.elementIsSelected(rowData);

  void _handleSelectBox(bool? value) {
    if (value == null) return;
    controller.selectElement(value, rowData);
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _getValueCheckBox(),
      onChanged: _handleSelectBox,
      activeColor: BasicAppColors.primary,
      checkColor: BasicAppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BasicCorners.cornerBorder3,
      ),
      side: BorderSide(
        width: BasicBorders.med,
        color: BasicAppColors.primary,
      ),
    );
  }
}
