part of 'loading.dart';

class BasicLoadingWidget extends StatefulWidget {
  const BasicLoadingWidget({Key? key}) : super(key: key);

  @override
  State<BasicLoadingWidget> createState() => BasicLoadingWidgetState();
}

class BasicLoadingWidgetState extends State<BasicLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  static String _defaultLoadingText = 'Loading...';

  static void setDefaultLoadingText(String text) => _defaultLoadingText = text;

  static get defaultLoadingText => _defaultLoadingText;

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
          color: BasicAppColors.primary.withOpacity(opacity),
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
            width: 36,
            height: 36,
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
          _defaultLoadingText,
          style: BasicTextStyles.titleMedium.copyWith(
            color: BasicAppColors.primary,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
            fontSize: 17.scaleSize,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoading();
  }
}
