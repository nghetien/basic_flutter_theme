part of 'calendar.dart';

class BasicCalenderController<T> extends ChangeNotifier {
  final BasicLoadingController _loadingController = BasicLoadingController();
  final CalendarController _calendarController = CalendarController();

  late final BasicCalendarState<T> _state;

  BasicLoadingController get loadingController => _loadingController;

  BasicCalenderController({
    List<BasicMeetingModel<T>>? source,
    List<CalendarResource>? resourceColl,
  }) : _state = BasicCalendarState<T>(
          source: source ?? [],
          resourceColl: resourceColl,
        );

  void initDataTableState({
    List<BasicMeetingModel<T>>? source,
    List<CalendarResource>? resourceColl,
  }) {
    _state.source = source ?? [];
    _state.resourceColl = resourceColl;
  }

  void showLoading() => _loadingController.show();

  void dismissLoading() => _loadingController.dismiss();
}
