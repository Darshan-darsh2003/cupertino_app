class DeletedCodeNote {
  final int id;
  final String title;
  final String content;
  final DateTime deletionTimestamp;

  DeletedCodeNote({
    required this.id,
    required this.title,
    required this.content,
    required this.deletionTimestamp,
  });
}
