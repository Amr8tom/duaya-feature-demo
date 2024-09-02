// import 'package:equatable/equatable.dart';
//
// class PointEntity extends Equatable {
//   final int points;
// ا
//   PointEntity({required this.points});
//
//   @override
//   List<Object?> get props => [points];
// }
//
// class LinksEntity extends Equatable {
//   final String? first;
//   final String? last;
//   final String? prev;
//   final String? next;
//
//   LinksEntity({this.first, this.last, this.prev, this.next});
//
//   @override
//   List<Object?> get props => [first, last, prev, next];
// }
//
// class LinkEntity extends Equatable {
//   final String? url;
//   final String label;
//   final bool active;
//
//   LinkEntity({this.url, required this.label, required this.active});
//
//   @override
//   List<Object?> get props => [url, label, active];
// }
//
// class MetaEntity extends Equatable {
//   final int currentPage;
//   final int from;
//   final int lastPage;
//   final List<LinkEntity> links;
//   final String path;
//   final int perPage;
//   final int to;
//   final int total;
//
//   MetaEntity({
//     required this.currentPage,
//     required this.from,
//     required this.lastPage,
//     required this.links,
//     required this.path,
//     required this.perPage,
//     required this.to,
//     required this.total,
//   });
//
//   @override
//   List<Object?> get props =>
//       [currentPage, from, lastPage, links, path, perPage, to, total];
// }
//
// class ResponseEntity extends Equatable {
//   final List<PointEntity> data;
//   final LinksEntity links;
//   final MetaEntity meta;
//   final bool success;
//   final int status;
//
//   ResponseEntity({
//     required this.data,
//     required this.links,
//     required this.meta,
//     required this.success,
//     required this.status,
//   });
//
//   @override
//   List<Object?> get props => [data, links, meta, success, status];
// }
