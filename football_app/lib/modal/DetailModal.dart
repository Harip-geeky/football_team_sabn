class DetailsModal {
  Team? team;

  DetailsModal({this.team});

  DetailsModal.fromJson(Map<String, dynamic> json) {
    team = json['Team'] != null ? new Team.fromJson(json['Team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['Team'] = this.team!.toJson();
    }
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? fifaCode;
  String? iso2;
  String? flag;
  String? emoji;
  String? emojiString;

  Team(
      {this.id,
        this.name,
        this.fifaCode,
        this.iso2,
        this.flag,
        this.emoji,
        this.emojiString});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fifaCode = json['fifaCode'];
    iso2 = json['iso2'];
    flag = json['flag'];
    emoji = json['emoji'];
    emojiString = json['emojiString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fifaCode'] = this.fifaCode;
    data['iso2'] = this.iso2;
    data['flag'] = this.flag;
    data['emoji'] = this.emoji;
    data['emojiString'] = this.emojiString;
    return data;
  }
}
