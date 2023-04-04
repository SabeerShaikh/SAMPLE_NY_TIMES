
import 'package:flutter/material.dart';

class KPersistentHeader extends SliverPersistentHeaderDelegate {
final Widget Function(BuildContext context, double offset, bool overlapped)
builder;
final double minHeight;
final double maxHeight;
final double verticalSpacing;
final Color? backgroundColor;

KPersistentHeader({
required this.builder,
required this.minHeight,
required this.maxHeight,
this.backgroundColor,
this.verticalSpacing = 10,
});

@override
Widget build(
BuildContext context, double shrinkOffset, bool overlapsContent) {
return Container(
child: builder(context, shrinkOffset, overlapsContent),
color: backgroundColor,
padding: EdgeInsets.symmetric(vertical: verticalSpacing),
);
}

@override
double get maxExtent => maxHeight + (verticalSpacing * 2);

@override
double get minExtent => minHeight + (verticalSpacing * 2);

@override
bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
return true;
}
}