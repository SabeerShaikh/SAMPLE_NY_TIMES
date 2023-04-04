import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_ny_time/app_imports.dart';
import 'package:sample_ny_time/core/constants/value_constants.dart';
import 'package:sample_ny_time/features/dashboard/data/models/popular_news_model.dart';
import 'package:sample_ny_time/features/dashboard/presentation/widgets/rounded_box_shimmer.dart';

class PopularNewsDetails extends StatefulWidget {
  const PopularNewsDetails({
    super.key,
  });

  @override
  State<PopularNewsDetails> createState() => _PopularNewsDetailsState();
}

class _PopularNewsDetailsState extends State<PopularNewsDetails> {
  Results? results;
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    results ??= args["results"] as Results;
    final textTheme = Utils.getAppTextTheme(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstants.GREEN_LIGHT,
        elevation: 0,
        title: Container(
          child: Text(
            STRING_DASHBOARD_HEADING,
            style: textTheme.titleLarge!,
          ),
        ),
      ),
      body: Column(
        children: [
          results!.media!.isNotEmpty
              ? Hero(
                  tag: results!.media![0].mediaMetadata![0].url!,
                  child: CachedNetworkImage(
                    imageUrl: results!.media![0].mediaMetadata![0].url!,
                    height: ValueConstants.POPULAR_DETAILS_IMAGE_HEIGHT,
                    width: ScreenUtil().screenWidth,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const RoundedBoxShimmer(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )
              : Hero(
                  tag: results!.id.toString(),
                  child: Image.asset(
                    Utils.getAssetName(ImageConstant.STRING_DEFAULT_IMAGE),
                    height: ValueConstants.POPULAR_DETAILS_IMAGE_HEIGHT,
                    width: ScreenUtil().screenWidth,
                  ),
                ),
          CustomSpacers.height12,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.calendar_month_rounded),
              Container(
                margin: EdgeInsets.only(
                  right: ValueConstants.HORIZONTAL_PADDING,
                ),
                child: Text(
                  results!.publishedDate!,
                  style: textTheme.titleSmall!,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                left: ValueConstants.HORIZONTAL_PADDING,
                right: ValueConstants.HORIZONTAL_PADDING,
                top: ValueConstants.VERTICAL_PADDING),
            alignment: Alignment.centerLeft,
            child: Text(
              results!.title!,
              style: textTheme.titleLarge!,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: ValueConstants.HORIZONTAL_PADDING,
                right: ValueConstants.HORIZONTAL_PADDING,
                top: ValueConstants.VERTICAL_PADDING),
            alignment: Alignment.centerLeft,
            child: Text(
              results!.abstract!,
              style: textTheme.titleMedium!,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: ValueConstants.HORIZONTAL_PADDING,
                top: ValueConstants.VERTICAL_PADDING),
            alignment: Alignment.centerLeft,
            child: Text(
              results!.byline!,
              style: textTheme.titleSmall!,
            ),
          ),
        ],
      ),
    );
  }
}
