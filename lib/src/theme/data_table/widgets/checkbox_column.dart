part of '../data_table.dart';

class CheckBoxColumn<T> extends StatelessWidget {
  const CheckBoxColumn({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DataTableController<T> controller;

  void _handleSelectAll(bool? value) {
    if (value == null) return;
    controller.selectAll(value);
  }

  bool _getValueCheckBoxAll() {
    if (controller.dataSources.isEmpty) return false;
    return controller.dataSources.every((element) => controller.elementIsSelected(element));
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _getValueCheckBoxAll(),
      onChanged: _handleSelectAll,
      activeColor: BasicAppColors.white,
      checkColor: BasicAppColors.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BasicCorners.cornerBorder3,
      ),
      side: const BorderSide(
        width: BasicBorders.med,
        color: BasicAppColors.white,
      ),
    );
  }
}
