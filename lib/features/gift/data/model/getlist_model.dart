// import 'package:equatable/equatable.dart';
//
// class PointEntity extends Equatable {
//   final int points;
//
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
//
// // Model Classes
// class PointModel extends PointEntity {
//   PointModel({required int points}) : super(points: points);
//
//   factory PointModel.fromJson(Map<String, dynamic> json) {
//     return PointModel(points: json['points']);
//   }
//
//   Map<String, dynamic> toJson() {
//     return {'points': points};
//   }
// }
//
// class LinksModel extends LinksEntity {
//   LinksModel({String? first, String? last, String? prev, String? next})
//       : super(first: first, last: last, prev: prev, next: next);
//
//   factory LinksModel.fromJson(Map<String, dynamic> json) {
//     return LinksModel(
//       first: json['first'],
//       last: json['last'],
//       prev: json['prev'],
//       next: json['next'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'first': first,
//       'last': last,
//       'prev': prev,
//       'next': next,
//     };
//   }
// }
//
// class LinkModel extends LinkEntity {
//   LinkModel({String? url, required String label, required bool active})
//       : super(url: url, label: label, active: active);
//
//   factory LinkModel.fromJson(Map<String, dynamic> json) {
//     return LinkModel(
//       url: json['url'],
//       label: json['label'],
//       active: json['active'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'url': url,
//       'label': label,
//       'active': active,
//     };
//   }
// }
//
// class MetaModel extends MetaEntity {
//   MetaModel({
//     required int currentPage,
//     required int from,
//     required int lastPage,
//     required List<LinkEntity> links,
//     required String path,
//     required int perPage,
//     required int to,
//     required int total,
//   }) : super(
//           currentPage: currentPage,
//           from: from,
//           lastPage: lastPage,
//           links: links,
//           path: path,
//           perPage: perPage,
//           to: to,
//           total: total,
//         );
//
//   factory MetaModel.fromJson(Map<String, dynamic> json) {
//     return MetaModel(
//       currentPage: json['current_page'],
//       from: json['from'],
//       lastPage: json['last_page'],
//       links: (json['links'] as List)
//           .map((linkJson) => LinkModel.fromJson(linkJson))
//           .toList(),
//       path: json['path'],
//       perPage: json['per_page'],
//       to: json['to'],
//       total: json['total'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'current_page': currentPage,
//       'from': from,
//       'last_page': lastPage,
//       'links': links.map((link) => (link as LinkModel).toJson()).toList(),
//       'path': path,
//       'per_page': perPage,
//       'to': to,
//       'total': total,
//     };
//   }
// }
//
// class ResponseModel extends ResponseEntity {
//   ResponseModel({
//     required List<PointEntity> data,
//     required LinksEntity links,
//     required MetaEntity meta,
//     required bool success,
//     required int status,
//   }) : super(
//             data: data,
//             links: links,
//             meta: meta,
//             success: success,
//             status: status);
//
//   factory ResponseModel.fromJson(Map<String, dynamic> json) {
//     return ResponseModel(
//       data: (json['data'] as List)
//           .map((pointJson) => PointModel.fromJson(pointJson))
//           .toList(),
//       links: LinksModel.fromJson(json['links']),
//       meta: MetaModel.fromJson(json['meta']),
//       success: json['success'],
//       status: json['status'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'data': data.map((point) => (point as PointModel).toJson()).toList(),
//       'links': (links as LinksModel).toJson(),
//       'meta': (meta as MetaModel).toJson(),
//       'success': success,
//       'status': status,
//     };
//   }
// }
