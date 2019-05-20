class HistoryInfoEntity {
	String picNo;
	List<HistoryInfoPicurl> picUrl;
	String eId;
	String title;
	String content;

	HistoryInfoEntity({this.picNo, this.picUrl, this.eId, this.title, this.content});

	HistoryInfoEntity.fromJson(Map<String, dynamic> json) {
		picNo = json['picNo'];
		if (json['picUrl'] != null) {
			picUrl = new List<HistoryInfoPicurl>();(json['picUrl'] as List).forEach((v) { picUrl.add(new HistoryInfoPicurl.fromJson(v)); });
		}
		eId = json['e_id'];
		title = json['title'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['picNo'] = this.picNo;
		if (this.picUrl != null) {
      data['picUrl'] =  this.picUrl.map((v) => v.toJson()).toList();
    }
		data['e_id'] = this.eId;
		data['title'] = this.title;
		data['content'] = this.content;
		return data;
	}
}

class HistoryInfoPicurl {
	String picTitle;
	int id;
	String url;

	HistoryInfoPicurl({this.picTitle, this.id, this.url});

	HistoryInfoPicurl.fromJson(Map<String, dynamic> json) {
		picTitle = json['pic_title'];
		id = json['id'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pic_title'] = this.picTitle;
		data['id'] = this.id;
		data['url'] = this.url;
		return data;
	}
}
