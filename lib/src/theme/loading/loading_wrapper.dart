part of 'loading.dart';

class BasicLoadingWrapper extends StatefulWidget {
  const BasicLoadingWrapper({
    Key? key,
    required this.loadingController,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final BasicLoadingController loadingController;

  @override
  State<BasicLoadingWrapper> createState() => _BasicLoadingWrapperState();
}

class _BasicLoadingWrapperState extends State<BasicLoadingWrapper> {
  late final BasicLoadingOverlayEntry _overlayEntry;
  late BasicLoadingController _loadingController;

  @override
  void initState() {
    super.initState();
    _loadingController = widget.loadingController;
    _overlayEntry = BasicLoadingOverlayEntry(
      widgetBuilder: (BuildContext context) => _loadingController.w ?? Container(),
    );
    _loadingController.setCurrentOverlayEntry(_overlayEntry);
  }

  @override
  void didUpdateWidget(BasicLoadingWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.loadingController != widget.loadingController) {
      _loadingController = widget.loadingController;
      _overlayEntry = BasicLoadingOverlayEntry(
        widgetBuilder: (BuildContext context) => _loadingController.w ?? Container(),
      );
      _loadingController.setCurrentOverlayEntry(_overlayEntry);
    }
  }

  @override
  Widget build(BuildContext context) => Material(
        child: Overlay(
          initialEntries: [
            BasicLoadingOverlayEntry(
              widgetBuilder: (BuildContext context) {
                if (widget.child != null) {
                  return widget.child!;
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            _overlayEntry,
          ],
        ),
      );
}
