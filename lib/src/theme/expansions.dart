// import 'package:basic_flutter_theme/src/styles/styles.dart';
// import 'package:flutter/material.dart';
//
// class BasicExpansions {
//   const BasicExpansions._();
//
//   static Widget expansion({
//     Color? color,
//     BorderRadiusGeometry? borderRadius,
//     BoxBorder? border,
//     Key? key,
//     Widget? customTitle,
//     String? title,
//     Widget? leading,
//     Widget? trailing,
//     CrossAxisAlignment? expandedCrossAxisAlignment,
//     EdgeInsetsGeometry? childrenPadding,
//     Color? collapsedTextColor,
//     Color? collapsedIconColor,
//     Color? iconColor,
//     required List<Widget> children,
//   }) =>
//       Container(
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: borderRadius ?? BasicCorners.cornerBorder5,
//           border: border ??
//               Border.all(
//                 color: BasicAppColors.grey,
//                 width: BasicBorders.thin,
//               ),
//         ),
//         child: ExpansionTile(
//           key: key,
//           title: customTitle ??
//               Text(
//                 title ?? '',
//                 style: BasicTextStyles.body,
//               ),
//           leading: leading,
//           trailing: trailing,
//           expandedCrossAxisAlignment: expandedCrossAxisAlignment,
//           childrenPadding: childrenPadding ?? EdgeInsets.all(BasicPaddings().p12),
//           collapsedTextColor: collapsedTextColor,
//           collapsedIconColor: collapsedIconColor,
//           iconColor: iconColor,
//           children: children,
//         ),
//       );
// }
