part of '../data_table.dart';

class DataTableLoadingWidget extends StatelessWidget {
  const DataTableLoadingWidget({
    Key? key,
    this.borderRadius,
  }) : super(key: key);

  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BasicCorners.mainCornerBorder,
        color: context.theme.colorScheme.background.withOpacity(0.5),
      ),
      child: const BasicLoadingWidget(),
    );
  }
}
