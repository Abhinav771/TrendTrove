class NewsModel {
  String? articleId;
  String? title;
  String? link;
  List<String>? keywords; // Changed from Null to List<String>?
  List<String>? creator;
  String? videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  String? sourceName;
  String? sourceUrl;
  String? sourceIcon;
  String? language;
  List<String>? country;
  List<String>? category;
  String? aiTag;
  String? sentiment;
  String? sentimentStats;
  String? aiRegion;
  String? aiOrg;
  bool? duplicate;

  NewsModel({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.sourceName,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.aiTag,
    this.sentiment,
    this.sentimentStats,
    this.aiRegion,
    this.aiOrg,
    this.duplicate,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    articleId = json['article_id'];
    title = json['title'];
    link = json['link'];
    keywords = json['keywords'] != null ? List<String>.from(json['keywords']) : null;
    creator = json['creator'] != null ? List<String>.from(json['creator']) : null;
    videoUrl = json['video_url'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    sourcePriority = json['source_priority'];
    sourceName = json['source_name'];
    sourceUrl = json['source_url'];
    sourceIcon = json['source_icon'];
    language = json['language'];
    country = json['country'] != null ? List<String>.from(json['country']) : null;
    category = json['category'] != null ? List<String>.from(json['category']) : null;
    aiTag = json['ai_tag'];
    sentiment = json['sentiment'];
    sentimentStats = json['sentiment_stats'];
    aiRegion = json['ai_region'];
    aiOrg = json['ai_org'];
    duplicate = json['duplicate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['article_id'] = articleId;
    data['title'] = title;
    data['link'] = link;
    data['keywords'] = keywords;
    data['creator'] = creator;
    data['video_url'] = videoUrl;
    data['description'] = description;
    data['content'] = content;
    data['pubDate'] = pubDate;
    data['image_url'] = imageUrl;
    data['source_id'] = sourceId;
    data['source_priority'] = sourcePriority;
    data['source_name'] = sourceName;
    data['source_url'] = sourceUrl;
    data['source_icon'] = sourceIcon;
    data['language'] = language;
    data['country'] = country;
    data['category'] = category;
    data['ai_tag'] = aiTag;
    data['sentiment'] = sentiment;
    data['sentiment_stats'] = sentimentStats;
    data['ai_region'] = aiRegion;
    data['ai_org'] = aiOrg;
    data['duplicate'] = duplicate;
    return data;
  }
}