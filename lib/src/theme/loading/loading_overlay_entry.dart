part of 'loading.dart';

T? _ambiguate<T>(T? value) => value;

class BasicLoadingOverlayEntry extends OverlayEntry {
  BasicLoadingOverlayEntry({
    required this.widgetBuilder,
  }) : super(builder: widgetBuilder);

  final WidgetBuilder widgetBuilder;

  @override
  void markNeedsBuild() {
    if (_ambiguate(SchedulerBinding.instance)!.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback(
        (_) {
          super.markNeedsBuild();
        },
      );
    } else {
      super.markNeedsBuild();
    }
  }
}
