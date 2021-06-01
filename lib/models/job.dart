class Job {
  String id;
  String type;
  String url;
  String createdAt;
  String company;
  String companyUrl;
  String location;
  String title;
  String description;
  String mechanism;
  String companyLogo;

  Job({
    this.id = "",
    this.type = "",
    this.url = "",
    this.createdAt = "",
    this.company = "",
    this.companyUrl = "",
    this.location = "",
    this.title = "",
    this.description = "",
    this.mechanism = "",
    this.companyLogo = ""
  });


  Job.fromJson(Map<String, dynamic> json) :
        id = json['id'] == null ? '' : json['id'],
        type = json['type'] == null ? '' : json['type'],
        url = json['url'] == null ? '' : json['url'],
        createdAt = json['created_at'] == null ? '' : json['created_at'],
        company = json['company'] == null ? '' : json['company'],
        companyUrl = json['company_url'] == null ? '' : json['company_url'],
        location = json['location'] == null ? '' : json['location'],
        title = json['title'] == null ? '' : json['title'],
        description = json['description'] == null ? '' : json['description'],
        mechanism = json['how_to_apply'] == null ? '' : json['how_to_apply'],
        companyLogo = json['company_logo'] == null ? '' : json['company_logo'];

}

