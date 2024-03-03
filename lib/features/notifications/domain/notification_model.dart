

class NotificationModel {
  final String title;
  final String body;
  final String applicationId;
  final String receiverId;
  final String createdAt;

  NotificationModel({
    required this.title,
    required this.body,
    required this.applicationId,
    required this.receiverId,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      body: json['body'],
      applicationId: json['applicationId'],
      receiverId: json['receiverId'],
      createdAt: json['createdAt'],
    );
  }
}
