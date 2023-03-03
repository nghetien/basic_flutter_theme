part of '../data_table.dart';

class DataTableLoadingWidget extends StatefulWidget {
  const DataTableLoadingWidget({Key? key}) : super(key: key);

  @override
  State<DataTableLoadingWidget> createState() => _DataTableLoadingWidgetState();
}

class _DataTableLoadingWidgetState extends State<DataTableLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _loadingItem(double opacity) => Container(
        height: 14,
        width: 14,
        decoration: BoxDecoration(
          color: BasicAppColors().primary.withOpacity(opacity),
          shape: BoxShape.circle,
        ),
      );

  Widget _buildLoading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
          child: SizedBox(
            width: 38,
            height: 38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _loadingItem(0.4),
                    _loadingItem(0.6),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _loadingItem(0.8),
                    _loadingItem(1),
                  ],
                )
              ],
            ),
          ),
        ),
        VSpace.p14,
        Text(
          'Loading ...',
          style: BasicTextStyles.titleMedium.copyWith(
            color: BasicAppColors().primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BasicCorners.cornerBorder8,
          color: context.theme.colorScheme.background.withOpacity(0.5)),
      child: Center(
        child: _buildLoading(),
      ),
    );
  }
}
