part of '../data_table.dart';

class DataTableLoadingWidget extends StatelessWidget {
  const DataTableLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BasicCorners.cornerBorder8,
        color: context.theme.colorScheme.background.withOpacity(0.5),
      ),
      child: const BasicLoadingWidget(),
    );
  }
}
