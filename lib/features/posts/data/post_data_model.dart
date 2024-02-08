

class PostData {
  final String postHeadline;
  final String postContent;
  final String postAddress;
  final String postContact;
  final String? postImageUrl;
  final String postDate;
  final String postId;
  String khaltiNo;
  List<String> skills;
  List<String> interests;
  List<String> qualifications;

  PostData({
    required this.postHeadline,
    required this.postContent,
    required this.postAddress,
    required this.postContact,
    this.postImageUrl,
    required this.postDate,
    required this.postId,
    required this.khaltiNo,
    required this.skills,
    required this.interests,
    required this.qualifications,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      postAddress: json['postAddress'],
      postContent: json['postContent'],
      postHeadline: json['postHeadline'],
      postImageUrl: json['postImageUrl'],
      postContact: json['postContact'],
      postId: json['postId'],
      postDate: json['postCreatedAt'],
      khaltiNo: json['khaltiNo'],
      skills: List<String>.from(json['skills']),
      interests: List<String>.from(json['interests']),
      qualifications: List<String>.from(json['qualifications']),
    );
  }
}
