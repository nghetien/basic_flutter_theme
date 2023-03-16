part of 'calendar.dart';

class BasicTableCalendar extends StatefulWidget {
  const BasicTableCalendar({
    Key? key,
    required this.basicCalenderController,
    this.view = CalendarView.month,
    this.onViewChanged,
    this.onTap,
    this.onLongPress,
    this.onSelectionChanged,
    this.scheduleViewMonthHeaderBuilder,
    this.monthCellBuilder,
    this.appointmentBuilder,
    this.timeRegionBuilder,
    this.timeSlotViewSettings = const TimeSlotViewSettings(),
    this.resourceViewSettings = const ResourceViewSettings(),
    this.monthViewSettings = const MonthViewSettings(),
    this.initialDisplayDate,
    this.initialSelectedDate,
    this.showNavigationArrow = false,
    this.showDatePickerButton = false,
    this.allowViewNavigation = false,
    this.showCurrentTimeIndicator = true,
    this.allowedViews,
    this.specialRegions,
    this.allowDragAndDrop = false,
    this.dragAndDropSettings = const DragAndDropSettings(),
    this.onDragStart,
    this.onDragUpdate,
    this.onDragEnd,
  }) : super(key: key);

  final BasicCalenderController basicCalenderController;
  final CalendarView view;
  final ViewChangedCallback? onViewChanged;
  final CalendarTapCallback? onTap;
  final CalendarLongPressCallback? onLongPress;
  final CalendarSelectionChangedCallback? onSelectionChanged;
  final ScheduleViewMonthHeaderBuilder? scheduleViewMonthHeaderBuilder;
  final MonthCellBuilder? monthCellBuilder;
  final CalendarAppointmentBuilder? appointmentBuilder;
  final TimeRegionBuilder? timeRegionBuilder;
  final TimeSlotViewSettings timeSlotViewSettings;
  final ResourceViewSettings resourceViewSettings;
  final MonthViewSettings monthViewSettings;
  final DateTime? initialDisplayDate;
  final DateTime? initialSelectedDate;
  final bool showNavigationArrow;
  final bool showDatePickerButton;
  final bool allowViewNavigation;
  final bool showCurrentTimeIndicator;
  final List<CalendarView>? allowedViews;
  final List<TimeRegion>? specialRegions;
  final bool allowDragAndDrop;
  final DragAndDropSettings dragAndDropSettings;
  final AppointmentDragStartCallback? onDragStart;
  final AppointmentDragUpdateCallback? onDragUpdate;
  final AppointmentDragEndCallback? onDragEnd;

  @override
  State<BasicTableCalendar> createState() => _BasicTableCalendarState();
}

class _BasicTableCalendarState extends State<BasicTableCalendar> {
  late BasicCalenderController _basicCalenderController;

  @override
  void initState() {
    _basicCalenderController = widget.basicCalenderController;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BasicTableCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.basicCalenderController != widget.basicCalenderController) {
      _basicCalenderController = widget.basicCalenderController;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _basicCalenderController.loadingController.initBasicLoading(
      context,
      SfCalendar(
        view: widget.view,
        dataSource: BasicCalendarDataSource(
          source: _basicCalenderController._state.source,
          resourceColl: _basicCalenderController._state.resourceColl,
        ),
        onViewChanged: widget.onViewChanged,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onSelectionChanged: widget.onSelectionChanged,
        controller: _basicCalenderController._calendarController,
        scheduleViewMonthHeaderBuilder: widget.scheduleViewMonthHeaderBuilder,
        monthCellBuilder: widget.monthCellBuilder,
        appointmentBuilder: widget.appointmentBuilder,
        timeRegionBuilder: widget.timeRegionBuilder,
        headerStyle: CalendarHeaderStyle(
          textStyle: BasicTextStyles.titleMedium.copyWith(
            color: context.theme.textTheme.titleMedium?.color,
          ),
        ),
        timeSlotViewSettings: widget.timeSlotViewSettings,
        resourceViewSettings: widget.resourceViewSettings,
        monthViewSettings: widget.monthViewSettings,
        initialDisplayDate: widget.initialDisplayDate,
        initialSelectedDate: widget.initialSelectedDate,
        showNavigationArrow: widget.showNavigationArrow,
        showDatePickerButton: widget.showDatePickerButton,
        allowViewNavigation: widget.allowViewNavigation,
        showCurrentTimeIndicator: widget.showCurrentTimeIndicator,
        allowedViews: widget.allowedViews,
        specialRegions: widget.specialRegions,
        allowDragAndDrop: widget.allowDragAndDrop,
        dragAndDropSettings: widget.dragAndDropSettings,
        onDragStart: widget.onDragStart,
        onDragUpdate: widget.onDragUpdate,
        onDragEnd: widget.onDragEnd,
      ),
    );
  }
}
