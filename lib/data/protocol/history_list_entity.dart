class HistoryListEntity {
	String date;
	String eId;
	String title;
	String day;

	HistoryListEntity({this.date, this.eId, this.title, this.day});

	HistoryListEntity.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		eId = json['e_id'];
		title = json['title'];
		day = json['day'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['e_id'] = this.eId;
		data['title'] = this.title;
		data['day'] = this.day;
		return data;
	}
}
