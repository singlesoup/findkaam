// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    this.staus,
    this.message,
    this.data,
  });

  String? staus;
  String? message;
  List<Data>? data;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        staus: json["staus"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "staus": staus,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.jobType,
    this.designation,
    this.qualification,
    this.jobLocation,
    this.yearOfPassing,
    this.preCgpa,
    this.specialization,
    this.areaOfSector,
    this.exp,
    this.numberOfVacancies,
    this.lasrDateApplication,
    this.hiringProcess,
    this.salaryRange,
    this.min,
    this.max,
    this.rId,
    this.payCount,
    this.postDate,
    this.application,
    this.technology,
    this.jobDesc,
    this.writtenTest,
    this.groupDiscussion,
    this.technicalRound,
    this.hrRound,
    this.metaDesc,
    this.metaKeyword,
    this.author,
  });

  String? id;
  String? jobType;
  String? designation;
  String? qualification;
  String? jobLocation;
  String? yearOfPassing;
  String? preCgpa;
  String? specialization;
  String? areaOfSector;
  String? exp;
  String? numberOfVacancies;
  String? lasrDateApplication;
  dynamic hiringProcess;
  String? salaryRange;
  String? min;
  String? max;
  String? rId;
  String? payCount;
  String? postDate;
  String? application;
  String? technology;
  String? jobDesc;
  String? writtenTest;
  String? groupDiscussion;
  String? technicalRound;
  String? hrRound;
  String? metaDesc;
  String? metaKeyword;
  String? author;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        jobType: json["job_type"],
        designation: json["designation"],
        qualification: json["qualification"],
        jobLocation: json["job_location"],
        yearOfPassing: json["year_of_passing"],
        preCgpa: json["pre_cgpa"],
        specialization: json["specialization"],
        areaOfSector: json["area_of_sector"],
        exp: json["exp"],
        numberOfVacancies: json["number_of_vacancies"],
        lasrDateApplication: json["lasr_date_application"],
        // DateTime.parse(),
        hiringProcess: json["hiring_process"],
        salaryRange: json["salary_range"],
        min: json["min"],
        max: json["max"],
        rId: json["r_id"],
        payCount: json["pay_count"],
        postDate: json["post_date"],
        application: json["application"],
        technology: json["technology"],
        jobDesc: json["job_desc"],
        writtenTest: json["written_test"],
        groupDiscussion: json["group_discussion"],
        technicalRound: json["technical_round"],
        hrRound: json["hr_round"],
        metaDesc: json["meta_desc"],
        metaKeyword: json["meta_keyword"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "job_type": jobType,
        "designation": designation,
        "qualification": qualification,
        "job_location": jobLocation,
        "year_of_passing": yearOfPassing,
        "pre_cgpa": preCgpa,
        "specialization": specialization,
        "area_of_sector": areaOfSector,
        "exp": exp,
        "number_of_vacancies": numberOfVacancies,
        "lasr_date_application": lasrDateApplication,
        "hiring_process": hiringProcess,
        "salary_range": salaryRange,
        "min": min,
        "max": max,
        "r_id": rId,
        "pay_count": payCount,
        "post_date": postDate,
        "application": application,
        "technology": technology,
        "job_desc": jobDesc,
        "written_test": writtenTest,
        "group_discussion": groupDiscussion,
        "technical_round": technicalRound,
        "hr_round": hrRound,
        "meta_desc": metaDesc,
        "meta_keyword": metaKeyword,
        "author": author,
      };
}
