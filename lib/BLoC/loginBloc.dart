// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// import 'package:my_sports_club/Events/Coach/goalPostEvent.dart';
// import 'package:my_sports_club/attribute/api_url.dart';
// import 'package:my_sports_club/models/Coach/goalPostModel.dart' as gpm;

// class GoalPostBloc {
//   final _response = StreamController<gpm.GoalPostModel>();
//   final _addGoalPostStreamController =
//       StreamController<GoalPostEvent>();

//   Stream<gpm.GoalPostModel> get goalPostStream => _response.stream;
//   Sink<GoalPostEvent> get addGoalPostEventSink =>
//       _addGoalPostStreamController.sink;

//   void dispose() {
//     _response.close();
//     _addGoalPostStreamController.close();
//   }

//   void saveGoal(
//     String approvalBy,
//     String lastUpdatedBy,
//     List<gpm.Detail> details,
//     List<gpm.Comment> comments,
//     String approvedDate,
//     String sk,
//     String createdDate,
//     String lastUpdatedDate,
//     List<gpm.Status> status,
//     String createdBy,
//     String pk,
//   ) async {
//     var goalPost = gpm.GoalPostModel(

//       approvalBy: approvalBy,
//       lastUpdatedBy: lastUpdatedBy,
//       details: details,
//       comments: comments,
//       approvedDate: approvedDate,
//       sk: sk,
//       createdDate: createdDate,
//       lastUpdatedDate: lastUpdatedDate,
//       status: status,
//       createdBy: createdBy,
//       pk: pk,
//     );

//     var body =  gpm.goalPostModelToJson(goalPost);

//     debugPrint(body);

//     var url =
//         "$apiURL/goalset";
//     print("\n\n The URL for GoalPostBloc is : $url\n\n");

//     http.post(
//       Uri.parse(url),
//       body: body,
//       headers: {"Content-Type": "application/json;charset=utf-8"},
//     ).then((value) {
//       print(value.statusCode);
//       print(value.body);
//     });
//   }

//   GoalPostBloc() {
//     _addGoalPostStreamController.stream.listen((event) {
//       if (event is UpdateGoalPostEvent) {
//         saveGoal(
//           event.request.approvalBy,
//           event.request.lastUpdatedBy,
//           event.request.details,
//           event.request.comments,
//           event.request.approvedDate,
//           event.request.sk,
//           event.request.createdDate,
//           event.request.lastUpdatedDate,
//           event.request.status,
//           event.request.createdBy,
//           event.request.pk,
//         );
//       }
//     });
//   }
// }
