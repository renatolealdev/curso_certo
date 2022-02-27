
class Details {
  List details = [];

  Details(this.details);
}

class DataDetails {
  String subtitle;
  String banner;
  String resume;
  String objective;

  DataDetails(this.subtitle, this.banner, this.resume, this.objective);

  factory DataDetails.fromJson(Map<String, dynamic> json) {
    return DataDetails(
      json['subtitle'],
      json['banner'],
      json['resume'],
      json['objective'],
    );
  }

  Map<String, dynamic> toJson() => {
        'subtitle': this.subtitle,
        'banner': this.banner,
        'resume' : this.resume,
        'objective' : this.objective,
      };
}
