import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample_ny_time/features/dashboard/domain/entities/popular_news_entity.dart';

class PopularNewsModel extends PopularNewsEntity {
  final String? status;
  final String? copyright;
  final int? numResults;
  final List<Results>? results;

  const PopularNewsModel(
      {this.status, this.copyright, this.numResults, this.results})
      : super(status: status, copyright: copyright, numResults: numResults);

  factory PopularNewsModel.fromJson(Map<String, dynamic> json) {
    return PopularNewsModel(
        copyright: json["copyright"] ?? "",
        status: json["status"] ?? "",
        numResults: json["num_results"] ?? 0,
        results: json["results"] is bool
            ? []
            : (json["results"] as List)
                .map((e) => Results.fromJson(e))
                .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["copyright"] = copyright;
    _data["num_results"] = numResults;
    if (results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Results {
  final String? uri;
  final String? url;
  final int? id;
  final int? assetId;
  final String? source;
  final String? publishedDate;
  final String? updated;
  final String? section;
  final String? subsection;
  final String? nytdsection;
  final String? adxKeywords;
  final dynamic col;
  final String? byline;
  final String? type;
  final String? title;
  final String? abstract;
  final List<String>? desFacet;
  final List<dynamic>? orgFacet;
  final List<dynamic>? perFacet;
  final List<String>? geoFacet;
  final List<Media>? media;
  final int? etaId;

  Results(
      {this.uri,
      this.url,
      this.id,
      this.assetId,
      this.source,
      this.publishedDate,
      this.updated,
      this.section,
      this.subsection,
      this.nytdsection,
      this.adxKeywords,
      this.col,
      this.byline,
      this.type,
      this.title,
      this.abstract,
      this.desFacet,
      this.orgFacet,
      this.perFacet,
      this.geoFacet,
      this.media,
      this.etaId});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      uri: json["uri"] ?? "",
      url: json["url"] ?? "",
      id: json["id"] ?? 0,
      assetId: json["asset_id"] ?? 0,
      source: json["source"] ?? "",
      publishedDate: json["published_date"] ?? "",
      updated: json["updated"] ?? "",
      section: json["section"] ?? "",
      subsection: json["subsection"] ?? "",
      nytdsection: json["nytdsection"] ?? "",
      adxKeywords: json["adx_keywords"] ?? "",
      col: json["column"] ?? "",
      byline: json["byline"] ?? "",
      type: json["type"] ?? "",
      title: json["title"] ?? "",
      abstract: json["abstract"] ?? "",
      desFacet:
          json["des_facet"] is bool ? [] : List<String>.from(json["des_facet"]),
      orgFacet: json["org_facet"] ?? [],
      perFacet: json["per_facet"] ?? [],
      geoFacet:
          json["geo_facet"] is bool ? [] : List<String>.from(json["geo_facet"]),
      media: json["media"] is bool
          ? []
          : (json["media"] as List).map((e) => Media.fromJson(e)).toList(),
      etaId: json["eta_id"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["uri"] = uri;
    _data["url"] = url;
    _data["id"] = id;
    _data["asset_id"] = assetId;
    _data["source"] = source;
    _data["published_date"] = publishedDate;
    _data["updated"] = updated;
    _data["section"] = section;
    _data["subsection"] = subsection;
    _data["nytdsection"] = nytdsection;
    _data["adx_keywords"] = adxKeywords;
    _data["column"] = col;
    _data["byline"] = byline;
    _data["type"] = type;
    _data["title"] = title;
    _data["abstract"] = abstract;
    if (desFacet != null) {
      _data["des_facet"] = desFacet;
    }
    if (orgFacet != null) {
      _data["org_facet"] = orgFacet;
    }
    if (perFacet != null) {
      _data["per_facet"] = perFacet;
    }
    if (geoFacet != null) {
      _data["geo_facet"] = geoFacet;
    }
    if (media != null) {
      _data["media"] = media?.map((e) => e.toJson()).toList();
    }
    _data["eta_id"] = etaId;
    return _data;
  }
}

class Media {
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;
  final int? approvedForSyndication;
  final List<MediaMetadata>? mediaMetadata;

  Media(
      {this.type,
      this.subtype,
      this.caption,
      this.copyright,
      this.approvedForSyndication,
      this.mediaMetadata});

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
        type: json["type"] ?? "",
        approvedForSyndication: json["approved_for_syndication"] ?? "",
        caption: json["caption"] ?? "",
        subtype: json["subtype"] ?? "",
        copyright: json["copyright"] ?? "",
        mediaMetadata: json["media-metadata"] is bool
            ? []
            : (json["media-metadata"] as List)
                .map((e) => MediaMetadata.fromJson(e))
                .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["subtype"] = subtype;
    _data["caption"] = caption;
    _data["copyright"] = copyright;
    _data["approved_for_syndication"] = approvedForSyndication;
    if (mediaMetadata != null) {
      _data["media-metadata"] = mediaMetadata?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class MediaMetadata {
  final String? url;
  final String? format;
  final int? height;
  final int? width;

  MediaMetadata({this.url, this.format, this.height, this.width});

  factory MediaMetadata.fromJson(Map<String, dynamic> json) {
    return MediaMetadata(
      url: json["url"] ??
          "https://static01.nyt.com/images/2023/04/09/magazine/09mag-ethicist/09mag-ethicist-thumbStandard.jpg",
      format: json["format"] ?? "",
      height: json["height"] ?? 56.h,
      width: json["width"] ?? 56.h,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["format"] = format;
    _data["height"] = height;
    _data["width"] = width;
    return _data;
  }
}
