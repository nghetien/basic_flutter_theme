part of 'popup_menu_button.dart';

/// Phát triển lại trong tương lai
class BasicPopupMenuButtonItemModel<T> {
  final IconData? icon;
  final String text;
  final T value;

  const BasicPopupMenuButtonItemModel({
    this.icon,
    required this.text,
    required this.value,
  });
}

class BasicPopupMenuButton<T> extends StatelessWidget {
  const BasicPopupMenuButton({
    Key? key,
    this.icon,
    this.child,
    this.onPressed,
    required this.onSelected,
    required this.items,
    this.sectioned = const [],
    this.offset = Offset.zero,
    this.iconIsRight = false,
    this.iconItemColor,
    this.iconItemSize,
    this.style,
    this.padding,
  }) : super(key: key);

  final Icon? icon;
  final Widget? child;
  final VoidCallback? onPressed;
  final PopupMenuItemSelected<T> onSelected;
  final List<BasicPopupMenuButtonItemModel<T>> items;
  final List<BasicPopupMenuButtonItemModel<T>>? sectioned;
  final Offset offset;
  final bool iconIsRight;
  final Color? iconItemColor;
  final double? iconItemSize;
  final TextStyle? style;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuEntry<T>> menuItems = [];
    if (sectioned != null && sectioned!.isNotEmpty) {
      for (var item in sectioned!) {
        menuItems.add(
          _basePopupMenuItem(
            context,
            item: item,
            iconIsRight: iconIsRight,
            iconItemColor: iconItemColor,
            iconItemSize: iconItemSize,
            style: style,
          ),
        );
      }
      menuItems.add(
        PopupMenuDivider(
          height: 2.scaleSize,
        ),
      );
    }
    for (var item in items) {
      menuItems.add(
        _basePopupMenuItem(
          context,
          item: item,
          iconIsRight: iconIsRight,
          iconItemColor: iconItemColor,
          iconItemSize: iconItemSize,
          style: style,
        ),
      );
    }
    return PopupMenuButton<T>(
      icon: icon,
      offset: offset,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => menuItems,
      shape: const RoundedRectangleBorder(
        borderRadius: BasicCorners.cornerBorder5,
      ),
      padding: padding ?? EdgeInsets.all(BasicPaddings.p8),
      child: child,
    );
  }

  PopupMenuItem<T> _basePopupMenuItem(
    BuildContext context, {
    required BasicPopupMenuButtonItemModel<T> item,
    bool iconIsRight = false,
    Color? iconItemColor,
    double? iconItemSize,
    TextStyle? style,
  }) =>
      PopupMenuItem<T>(
        value: item.value,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          minLeadingWidth: 0,
          horizontalTitleGap: BasicPaddings.p12,
          leading: item.icon != null
              ? !iconIsRight
                  ? Icon(
                      item.icon,
                      color: iconItemColor,
                      size: iconItemSize ?? 26.scaleSize,
                    )
                  : null
              : null,
          trailing: item.icon != null
              ? iconIsRight
                  ? Icon(
                      item.icon,
                      color: iconItemColor,
                      size: iconItemSize ?? 26.scaleSize,
                    )
                  : null
              : null,
          title: Text(
            item.text,
            style: style ?? context.theme.textTheme.bodyMedium,
          ),
        ),
      );
}
