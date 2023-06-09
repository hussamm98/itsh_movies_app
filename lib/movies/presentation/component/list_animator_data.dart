import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movies_app/core/resources/extensions/size_extensions.dart';

import 'loading_indicator.dart';


class ListAnimatorData extends StatefulWidget {
  final int? itemCount;
  final int? duration;
  final double? verticalOffset;
  final ScrollPhysics? physics;
  final bool primary;
  final bool shrinkWrap;
  final bool isAnimated;
  final Widget? loadingWidget;
  final int? simmerItemCount;
  final Widget? noDataWidget;
  final Widget? separatorWidget;
  final bool isReverse;
  final Axis scrollDirection;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsetsGeometry? padding;

  //pagination
  final Function? onNextCall;
  final int? totalPages;
  final int? currentPage;
  final bool? isNextPageLoading;

  const ListAnimatorData({
    Key? key,
    this.itemCount,
    this.duration,
    this.isAnimated = true,
    this.scrollDirection = Axis.vertical,
    this.primary = false,
    this.shrinkWrap = true,
    this.isReverse = false,
    required this.itemBuilder,
    this.noDataWidget,
    this.separatorWidget,
    this.loadingWidget,
    this.verticalOffset,
    this.padding,
    this.physics,
    this.simmerItemCount,
    this.isNextPageLoading,
    this.onNextCall,
    this.currentPage,
    this.totalPages,
  }) : super(key: key);

  @override
  _ListAnimatorDataState createState() => _ListAnimatorDataState();
}

class _ListAnimatorDataState extends State<ListAnimatorData> {
  final ScrollController _scrollController = ScrollController();

  final _tag = 'ListAnimatorData';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (widget.onNextCall != null) {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          if ((widget.currentPage ?? 1) <= (widget.totalPages ?? 1)) {
            // widget.onNextCall!();
            // log(_tag,
            //     'currentPage get Data ${widget.currentPage} == totalPages ${widget.totalPages}');
          } else {
            // log(_tag,
            //     'currentPage ${widget.currentPage} == totalPages ${widget.totalPages}');
          }
        }
      } else {
    //    log(_tag, 'onNextCall == null');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == null) {
      return widget.loadingWidget != null
          ? _buildSimmerList()
          : Center(child: LoadingIndicator());
    } else if (widget.itemCount == 0) {
      return widget.noDataWidget ?? const SizedBox();
    } else {
      return SizedBox(
        child: AnimationConfiguration.synchronized(
          child: SlideAnimation(
              verticalOffset:
                  widget.scrollDirection == Axis.vertical && widget.isAnimated
                      ? 50.0
                      : null,
              horizontalOffset:
                  widget.scrollDirection == Axis.horizontal && widget.isAnimated
                      ? 50.0
                      : null,
              child: AnimationLimiter(
                  child: ListView.separated(
                itemCount: widget.itemCount ?? 0,
                itemBuilder: widget.itemBuilder,

                controller: _scrollController,
                scrollDirection: widget.scrollDirection,
                primary: widget.primary,
                physics: widget.physics??const BouncingScrollPhysics(),
                shrinkWrap: widget.shrinkWrap,
                padding: widget.padding,
                reverse: widget.isReverse,
                separatorBuilder: (context, index) {
                  return widget.scrollDirection == Axis.vertical
                      ? SizedBox(
                          height: 8.0.h,
                        )
                      : SizedBox(
                          width:  8.0.w,
                        );
                },
              ))),
        ),
      );
    }
  }

  _buildSimmerList() {
    return ListView.separated(
      itemCount: widget.simmerItemCount ?? 1,
      itemBuilder: (context, index) {
        return widget.loadingWidget ?? Container();
      },
      scrollDirection: widget.scrollDirection,
      primary: widget.primary,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      reverse: widget.isReverse,
      separatorBuilder: (context, index) {
        return widget.separatorWidget ??
            ( widget.scrollDirection == Axis.vertical
            ? SizedBox(height:  8.0.h,) : SizedBox(width:  8.0.w,));
      },
    );
  }
}
