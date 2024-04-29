class TextNote {
  int? id;
  String title;
  String content;
  String createdDate;
  String createdTime;
  String? lastModified;

  TextNote({
    this.id,
    required this.title,
    required this.content,
    required this.createdDate,
    required this.createdTime,
    this.lastModified,
  });
}
