class VolunteerApplication {
  final String userId;
  final String postId;
  final String volunteerName;
  final String volunteerEmail;
  final List<String> volunteerInterests;
  final String volunteerExperience;
  final String volunteerAddress;
  final Volunteer volunteer;
  final Post post;
  final String volunteerQualification;
  final String volunteerCreatedAt;
  final String volunteerContactNum;
  final List<String> volunteerSkills;

  VolunteerApplication({
    required this.userId,
    required this.postId,
    required this.volunteerName,
    required this.volunteer,
    required this.post,
    required this.volunteerEmail,
    required this.volunteerInterests,
    required this.volunteerExperience,
    required this.volunteerAddress,
    required this.volunteerQualification,
    required this.volunteerCreatedAt,
    required this.volunteerContactNum,
    required this.volunteerSkills,
  });

  factory VolunteerApplication.fromJson(Map<String, dynamic> json) {
    return VolunteerApplication(
      userId: json['userId'],
      postId: json['postId'],
      volunteerEmail: json['volunteerEmail'],
      volunteerName: json['volunteerFullName'],
      volunteerContactNum: json['volunteerContactNumber'],
      volunteerInterests: List<String>.from(json['volunteerInterests']),
      volunteerExperience: json['volunteerExperience'],
      volunteerQualification: json['volunteerQualification'],
      volunteerAddress: json['volunteerAddress'],
      volunteer: json['volunteer'],
      post: json['posts'],
      volunteerCreatedAt: json['volunteerDate'],
      volunteerSkills: List<String>.from(json['volunteerSkills']),
    );
  }
}

class Volunteer {
  final String volunteerName;
  final String volunteerEmail;

  Volunteer({
    required this.volunteerName,
    required this.volunteerEmail,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      volunteerName: "${json['firstname']} ${json['lastname']}",
      volunteerEmail: json['email'],
    );
  }
}

class Post {
  final String postHeadline;
  final String postContent;
  final String postAddress;
  final String postContact;
  final String postImageUrl;
  final String postDate;
  final String postId;
  Post({
    required this.postHeadline,
    required this.postContent,
    required this.postAddress,
    required this.postContact,
    required this.postImageUrl,
    required this.postDate,
    required this.postId,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postAddress: json['postAddress'],
      postContent: json['postContent'],
      postHeadline: json['postHeadline'],
      postImageUrl: json['postImageUrl'],
      postContact: json['postContact'],
      postId: json['postId'],
      postDate: json['postCreatedAt'],
    );
  }
}
