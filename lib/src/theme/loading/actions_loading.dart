part of 'loading.dart';

class BasicLoading {
  BasicLoading._privateConstructor();

  static final BasicLoading _instance = BasicLoading._privateConstructor();

  factory BasicLoading() => _instance;

  bool _statusLoading = false;

  void setStatusLoading(bool status) => _statusLoading = status;

  bool get statusLoading => _statusLoading;

  Widget initBasicLoading(_, Widget? child) => BasicLoadingWrapper(child: child);

  Widget _defaultW = Builder(
    builder: (BuildContext context) => Container(
      decoration: BoxDecoration(
        borderRadius: BasicCorners.cornerBorder8,
        color: context.theme.colorScheme.background.withOpacity(0.65),
      ),
      child: const BasicLoadingWidget(),
    ),
  );

  Widget get defaultW => _defaultW;

  void setDefaultW(Widget widget) => _defaultW = widget;

  Widget? _w;

  Widget? get w => _w;

  void setW(Widget? widget) => _w = widget;

  BasicLoadingOverlayEntry? _currentOverlayEntry;

  BasicLoadingOverlayEntry? get currentOverlayEntry => _currentOverlayEntry;

  void setCurrentOverlayEntry(BasicLoadingOverlayEntry? overlayEntry) =>
      _currentOverlayEntry = overlayEntry;

  void _markNeedsBuild() => currentOverlayEntry?.markNeedsBuild();

  void show() {
    setStatusLoading(true);
    setW(_defaultW);
    _markNeedsBuild();
  }

  void dismiss() {
    setStatusLoading(false);
    setW(null);
    _markNeedsBuild();
  }

  Future<T?> openAndDismissLoading<T>(AsyncValueGetter<T?> callback) async {
    try {
      show();
      final T? result = await callback();
      dismiss();
      return result;
    } catch (e) {
      BasicLogger.debugLog('openAndDismissLoading: $e');
      dismiss();
    }
    return null;
  }
}
