import 'package:equatable/equatable.dart';

class PopularNewsEntity extends Equatable {
  final String? status;
  final String? copyright;
  final int? numResults;
  const PopularNewsEntity(
      {required this.status,
      required this.copyright,
      required this.numResults});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
