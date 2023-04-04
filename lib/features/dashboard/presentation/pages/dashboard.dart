import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_ny_time/app_imports.dart';
import 'package:sample_ny_time/core/constants/value_constants.dart';
import 'package:sample_ny_time/features/dashboard/data/models/popular_news_model.dart';
import 'package:sample_ny_time/features/dashboard/presentation/bloc/ny_times_bloc.dart';
import 'package:sample_ny_time/features/dashboard/presentation/widgets/rounded_box_shimmer.dart';
import 'package:sample_ny_time/injection_container.dart';
import 'package:sample_ny_time/route/app_pages.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final NyTimesBloc bloc = sl<NyTimesBloc>();
  PopularNewsModel? _popularNewsModel;
  List<Results>? results = [];
  TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Utils.getAppTextTheme(context);

    return BlocProvider<NyTimesBloc>(
      create: (context) => bloc..add(const GetPopularNewsEvent()),
      child: BlocListener<NyTimesBloc, NyTimesState>(
        listener: (context, state) {
          if (state is GetPopularNewsResponseState) {
            _popularNewsModel = state.popularNewsModel;
            results = _popularNewsModel!.results;
          }
        },
        child: BlocBuilder<NyTimesBloc, NyTimesState>(
          builder: (context, state) {
            return showDashboard(state);
          },
        ),
      ),
    );
  }

  Widget showDashboard(NyTimesState state) {
    return Scaffold(
      backgroundColor: ColorsConstants.OFF_WHITE_F4F4F5,
      appBar: AppBar(
        backgroundColor: ColorsConstants.GREEN_LIGHT,
        elevation: 0,
        title: Container(
          margin: EdgeInsets.only(left: ValueConstants.HORIZONTAL_PADDING),
          child: Text(
            STRING_DASHBOARD_HEADING,
            style: textTheme!.titleLarge!,
          ),
        ),
      ),
      body: SafeArea(
          child: state is GetPopularNewsResponseState
              ? SizedBox(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: ListView.builder(
                      itemCount: results!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            CustomNavigator.pushTo(
                                context, AppPages.PAGE_POPULAR_NEWS_DETAILS,
                                arguments: {'results': results![index]});
                          },
                          child: Container(
                            height: ValueConstants.NEWS_CARD_HEIGHT,
                            margin: EdgeInsets.only(
                                left: ValueConstants.HORIZONTAL_PADDING,
                                right: ValueConstants.HORIZONTAL_PADDING,
                                top: ValueConstants.VERTICAL_PADDING_12),
                            child: Row(
                              children: [
                                newsImage(index),
                                showTitleNewsAndAuthor(index),
                                const Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : state is LoadingState
                  ? Center(child: CircularProgressIndicator())
                  : Container()),
    );
  }

  Widget newsImage(int index) {
    return results![index].media!.isNotEmpty
        ? Hero(
            tag: results![index].media![0].mediaMetadata![0].url!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    imageUrl: results![index].media![0].mediaMetadata![0].url!,
                    width: ValueConstants.DASHBOARD_IMAGE_WIDTH,
                    height: ValueConstants.DASHBOARD_IMAGE_HEIGHT,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const RoundedBoxShimmer(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
          )
        : Hero(
            tag: results![index].id.toString(), //if url is empty
            child: Image.asset(
              Utils.getAssetName(ImageConstant.STRING_DEFAULT_IMAGE),
              width: ValueConstants.DASHBOARD_IMAGE_WIDTH,
              height: ValueConstants.DASHBOARD_IMAGE_HEIGHT,
            ),
          );
  }

  Widget showTitleNewsAndAuthor(index) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().screenWidth,
            margin: EdgeInsets.symmetric(
              horizontal: ValueConstants.VERTICAL_PADDING_8,
              vertical: ValueConstants.VERTICAL_PADDING_8,
            ),
            child: Text(
              results![index].title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textTheme!.titleMedium!,
            ),
          ),
          Container(
            width: ScreenUtil().screenWidth,
            margin: EdgeInsets.symmetric(
              horizontal: ValueConstants.VERTICAL_PADDING_8,
              vertical: ValueConstants.VERTICAL_PADDING_8,
            ),
            child: Text(results![index].byline!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme!.titleSmall!),
          ),
        ],
      ),
    );
  }
}
