part of 'loading.dart';

class BasicLoadingWrapper extends StatefulWidget {
  const BasicLoadingWrapper({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  State<BasicLoadingWrapper> createState() => _BasicLoadingWrapperState();
}

class _BasicLoadingWrapperState extends State<BasicLoadingWrapper> {
  late final BasicLoadingOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = BasicLoadingOverlayEntry(
      widgetBuilder: (BuildContext context) => BasicLoading().w ?? Container(),
    );
    BasicLoading().setCurrentOverlayEntry(_overlayEntry);
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
                  return Container();
                }
              },
            ),
            _overlayEntry,
          ],
        ),
      );
}
