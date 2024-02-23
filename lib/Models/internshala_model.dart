class InternshalaModel {
  InternshalaModel({
    required this.internshipsMeta,
    required this.internshipIds,
  });

  final Map<String, InternshipsMeta> internshipsMeta;
  final List<int> internshipIds;

  factory InternshalaModel.fromJson(Map<String, dynamic> json) {
    return InternshalaModel(
      internshipsMeta: Map.from(json["internships_meta"]).map((k, v) =>
          MapEntry<String, InternshipsMeta>(k, InternshipsMeta.fromJson(v))),
      internshipIds: json["internship_ids"] == null
          ? []
          : List<int>.from(json["internship_ids"]!.map((x) => x)),
    );
  }
}

class InternshipsMeta {
  InternshipsMeta({
    required this.id,
    required this.title,
    required this.employmentType,
    required this.applicationStatusMessage,
    required this.jobTitle,
    required this.workFromHome,
    required this.segment,
    required this.segmentLabelValue,
    required this.internshipTypeLabelValue,
    required this.jobSegments,
    required this.companyName,
    required this.companyUrl,
    required this.isPremium,
    required this.isPremiumInternship,
    required this.employerName,
    required this.companyLogo,
    required this.type,
    required this.url,
    required this.isInternchallenge,
    required this.isExternal,
    required this.isActive,
    required this.expiresAt,
    required this.closedAt,
    required this.profileName,
    required this.partTime,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.salary,
    required this.jobExperience,
    required this.experience,
    required this.postedOn,
    required this.postedOnDateTime,
    required this.applicationDeadline,
    required this.expiringIn,
    required this.postedByLabel,
    required this.postedByLabelType,
    required this.locationNames,
    required this.locations,
    required this.startDateComparisonFormat,
    required this.startDate1,
    required this.startDate2,
    required this.isPpo,
    required this.isPpoSalaryDisclosed,
    required this.ppoSalary,
    required this.ppoSalary2,
    required this.ppoLabelValue,
    required this.toShowExtraLabel,
    required this.extraLabelValue,
    required this.isExtraLabelBlack,
    required this.campaignNames,
    required this.campaignName,
    required this.toShowInSearch,
    required this.campaignUrl,
    required this.campaignStartDateTime,
    required this.campaignLaunchDateTime,
    required this.campaignEarlyAccessStartDateTime,
    required this.campaignEndDateTime,
    required this.labels,
    required this.labelsApp,
    required this.labelsAppInCard,
    required this.isCovidWfhSelected,
    required this.toShowCardMessage,
    required this.message,
    required this.isApplicationCappingEnabled,
    required this.applicationCappingMessage,
    required this.overrideMetaDetails,
    required this.eligibleForEasyApply,
    required this.eligibleForB2BApplyNow,
    required this.toShowB2BLabel,
    required this.isInternationalJob,
    required this.toShowCoverLetter,
    required this.officeDays,
  });

  final int? id;
  final String? title;
  final String? employmentType;
  final ApplicationStatusMessage? applicationStatusMessage;
  final dynamic jobTitle;
  final bool? workFromHome;
  final String? segment;
  final dynamic segmentLabelValue;
  final dynamic internshipTypeLabelValue;
  final List<String> jobSegments;
  final String? companyName;
  final String? companyUrl;
  final bool? isPremium;
  final bool? isPremiumInternship;
  final String? employerName;
  final String? companyLogo;
  final String? type;
  final String? url;
  final int? isInternchallenge;
  final bool? isExternal;
  final bool? isActive;
  final DateTime? expiresAt;
  final String? closedAt;
  final String? profileName;
  final bool? partTime;
  final String? startDate;
  final String? duration;
  final Stipend? stipend;
  final dynamic salary;
  final dynamic jobExperience;
  final String? experience;
  final String? postedOn;
  final int? postedOnDateTime;
  final String? applicationDeadline;
  final String? expiringIn;
  final String? postedByLabel;
  final String? postedByLabelType;
  final List<String> locationNames;
  final List<Location> locations;
  final DateTime? startDateComparisonFormat;
  final DateTime? startDate1;
  final DateTime? startDate2;
  final bool? isPpo;
  final bool? isPpoSalaryDisclosed;
  final dynamic ppoSalary;
  final dynamic ppoSalary2;
  final String? ppoLabelValue;
  final bool? toShowExtraLabel;
  final String? extraLabelValue;
  final bool? isExtraLabelBlack;
  final List<dynamic> campaignNames;
  final String? campaignName;
  final bool? toShowInSearch;
  final String? campaignUrl;
  final dynamic campaignStartDateTime;
  final dynamic campaignLaunchDateTime;
  final dynamic campaignEarlyAccessStartDateTime;
  final dynamic campaignEndDateTime;
  final List<Label> labels;
  final String? labelsApp;
  final List<String> labelsAppInCard;
  final bool? isCovidWfhSelected;
  final bool? toShowCardMessage;
  final String? message;
  final bool? isApplicationCappingEnabled;
  final String? applicationCappingMessage;
  final List<dynamic> overrideMetaDetails;
  final bool? eligibleForEasyApply;
  final bool? eligibleForB2BApplyNow;
  final bool? toShowB2BLabel;
  final bool? isInternationalJob;
  final bool? toShowCoverLetter;
  final String? officeDays;

  factory InternshipsMeta.fromJson(Map<String, dynamic> json) {
    return InternshipsMeta(
      id: json["id"],
      title: json["title"],
      employmentType: json["employment_type"],
      applicationStatusMessage: json["application_status_message"] == null
          ? null
          : ApplicationStatusMessage.fromJson(
              json["application_status_message"]),
      jobTitle: json["job_title"],
      workFromHome: json["work_from_home"],
      segment: json["segment"],
      segmentLabelValue: json["segment_label_value"],
      internshipTypeLabelValue: json["internship_type_label_value"],
      jobSegments: json["job_segments"] == null
          ? []
          : List<String>.from(json["job_segments"]!.map((x) => x)),
      companyName: json["company_name"],
      companyUrl: json["company_url"],
      isPremium: json["is_premium"],
      isPremiumInternship: json["is_premium_internship"],
      employerName: json["employer_name"],
      companyLogo: json["company_logo"],
      type: json["type"],
      url: json["url"],
      isInternchallenge: json["is_internchallenge"],
      isExternal: json["is_external"],
      isActive: json["is_active"],
      expiresAt: DateTime.tryParse(json["expires_at"] ?? ""),
      closedAt: json["closed_at"],
      profileName: json["profile_name"],
      partTime: json["part_time"],
      startDate: json["start_date"],
      duration: json["duration"],
      stipend:
          json["stipend"] == null ? null : Stipend.fromJson(json["stipend"]),
      salary: json["salary"],
      jobExperience: json["job_experience"],
      experience: json["experience"],
      postedOn: json["posted_on"],
      postedOnDateTime: json["postedOnDateTime"],
      applicationDeadline: json["application_deadline"],
      expiringIn: json["expiring_in"],
      postedByLabel: json["posted_by_label"],
      postedByLabelType: json["posted_by_label_type"],
      locationNames: json["location_names"] == null
          ? []
          : List<String>.from(json["location_names"]!.map((x) => x)),
      locations: json["locations"] == null
          ? []
          : List<Location>.from(
              json["locations"]!.map((x) => Location.fromJson(x))),
      startDateComparisonFormat:
          DateTime.tryParse(json["start_date_comparison_format"] ?? ""),
      startDate1: DateTime.tryParse(json["start_date1"] ?? ""),
      startDate2: DateTime.tryParse(json["start_date2"] ?? ""),
      isPpo: json["is_ppo"],
      isPpoSalaryDisclosed: json["is_ppo_salary_disclosed"],
      ppoSalary: json["ppo_salary"],
      ppoSalary2: json["ppo_salary2"],
      ppoLabelValue: json["ppo_label_value"],
      toShowExtraLabel: json["to_show_extra_label"],
      extraLabelValue: json["extra_label_value"],
      isExtraLabelBlack: json["is_extra_label_black"],
      campaignNames: json["campaign_names"] == null
          ? []
          : List<dynamic>.from(json["campaign_names"]!.map((x) => x)),
      campaignName: json["campaign_name"],
      toShowInSearch: json["to_show_in_search"],
      campaignUrl: json["campaign_url"],
      campaignStartDateTime: json["campaign_start_date_time"],
      campaignLaunchDateTime: json["campaign_launch_date_time"],
      campaignEarlyAccessStartDateTime:
          json["campaign_early_access_start_date_time"],
      campaignEndDateTime: json["campaign_end_date_time"],
      labels: json["labels"] == null
          ? []
          : List<Label>.from(json["labels"]!.map((x) => Label.fromJson(x))),
      labelsApp: json["labels_app"],
      labelsAppInCard: json["labels_app_in_card"] == null
          ? []
          : List<String>.from(json["labels_app_in_card"]!.map((x) => x)),
      isCovidWfhSelected: json["is_covid_wfh_selected"],
      toShowCardMessage: json["to_show_card_message"],
      message: json["message"],
      isApplicationCappingEnabled: json["is_application_capping_enabled"],
      applicationCappingMessage: json["application_capping_message"],
      overrideMetaDetails: json["override_meta_details"] == null
          ? []
          : List<dynamic>.from(json["override_meta_details"]!.map((x) => x)),
      eligibleForEasyApply: json["eligible_for_easy_apply"],
      eligibleForB2BApplyNow: json["eligible_for_b2b_apply_now"],
      toShowB2BLabel: json["to_show_b2b_label"],
      isInternationalJob: json["is_international_job"],
      toShowCoverLetter: json["to_show_cover_letter"],
      officeDays: json["office_days"],
    );
  }
}

class ApplicationStatusMessage {
  ApplicationStatusMessage({
    required this.toShow,
    required this.message,
    required this.type,
  });

  final bool? toShow;
  final String? message;
  final String? type;

  factory ApplicationStatusMessage.fromJson(Map<String, dynamic> json) {
    return ApplicationStatusMessage(
      toShow: json["to_show"],
      message: json["message"],
      type: json["type"],
    );
  }
}

class Label {
  Label({
    required this.labelValue,
    required this.labelMobile,
    required this.labelApp,
    required this.labelsAppInCard,
  });

  final List<String> labelValue;
  final List<String> labelMobile;
  final List<String> labelApp;
  final List<String> labelsAppInCard;

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      labelValue: json["label_value"] == null
          ? []
          : List<String>.from(json["label_value"]!.map((x) => x)),
      labelMobile: json["label_mobile"] == null
          ? []
          : List<String>.from(json["label_mobile"]!.map((x) => x)),
      labelApp: json["label_app"] == null
          ? []
          : List<String>.from(json["label_app"]!.map((x) => x)),
      labelsAppInCard: json["labels_app_in_card"] == null
          ? []
          : List<String>.from(json["labels_app_in_card"]!.map((x) => x)),
    );
  }
}

class Location {
  Location({
    required this.string,
    required this.link,
    required this.country,
    required this.region,
    required this.locationName,
  });

  final String? string;
  final String? link;
  final String? country;
  final String? region;
  final String? locationName;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      string: json["string"],
      link: json["link"],
      country: json["country"],
      region: json["region"],
      locationName: json["locationName"],
    );
  }
}

class Stipend {
  Stipend({
    required this.salary,
    required this.tooltip,
    required this.salaryValue1,
    required this.salaryValue2,
    required this.salaryType,
    required this.currency,
    required this.scale,
    required this.largeStipendText,
  });

  final String? salary;
  final dynamic tooltip;
  final int? salaryValue1;
  final dynamic salaryValue2;
  final String? salaryType;
  final String? currency;
  final String? scale;
  final bool? largeStipendText;

  factory Stipend.fromJson(Map<String, dynamic> json) {
    return Stipend(
      salary: json["salary"],
      tooltip: json["tooltip"],
      salaryValue1: json["salaryValue1"],
      salaryValue2: json["salaryValue2"],
      salaryType: json["salaryType"],
      currency: json["currency"],
      scale: json["scale"],
      largeStipendText: json["large_stipend_text"],
    );
  }
}
