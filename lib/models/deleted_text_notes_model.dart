class DeletedTextNote {
  final int id;
  final String title;
  final String content;
  final DateTime deletionTimestamp;

  DeletedTextNote({
    required this.id,
    required this.title,
    required this.content,
    required this.deletionTimestamp,
  });
}
