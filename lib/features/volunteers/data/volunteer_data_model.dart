class VolunteerApplication {
  final String userId;
  final String postId;
  final String volunteerName;
  final String volunteerEmail;
  List<String>? volunteerInterests;
  final String volunteerExperience;
  final String volunteerAddress;
  final Volunteer volunteer;
  final Post post;
  List<String>? volunteerQualification;
  final String volunteerCreatedAt;
  final String volunteerContactNum;
  List<String>? volunteerSkills;

  VolunteerApplication({
    required this.userId,
    required this.postId,
    required this.volunteerName,
    required this.volunteer,
    required this.post,
    required this.volunteerEmail,
    this.volunteerInterests,
    required this.volunteerExperience,
    required this.volunteerAddress,
    this.volunteerQualification,
    required this.volunteerCreatedAt,
    required this.volunteerContactNum,
    this.volunteerSkills,
  });

  // factory VolunteerApplication.fromJson(Map<String, dynamic> json) {
  //   return VolunteerApplication(
  //     userId: json['userId'],
  //     postId: json['postId'],
  //     volunteerEmail: json['volunteerEmail'],
  //     volunteerName: json['volunteerFullName'],
  //     volunteerContactNum: json['volunteerContactNumber'],
  //     volunteerInterests: json['volunteerInterests'],
  //     volunteerExperience: json['volunteerExperience'],
  //     volunteerQualification: json['volunteerQualification'],
  //     volunteerAddress: json['volunteerAddress'],
  //     volunteer: json['volunteer'],
  //     post: json['posts'],
  //     volunteerCreatedAt: json['volunteerDate'],
  //     volunteerSkills: json['volunteerSkills'],
  //   );
  // }

  factory VolunteerApplication.fromJson(Map<String, dynamic> json) {
    return VolunteerApplication(
      userId: json['userId'],
      postId: json['postId'],
      volunteerName: json['volunteerFullName'],
      volunteerEmail: json['volunteerEmail'],
      volunteerInterests: (json['volunteerInterests'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      volunteerExperience: json['volunteerExperience'],
      volunteerAddress: json['volunteerAddress'],
      volunteer: json['volunteer'],
      post: json['posts'],
      volunteerQualification: (json['volunteerQualification'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      volunteerCreatedAt: json['volunteerDate'],
      volunteerContactNum: json['volunteerContactNumber'],
      volunteerSkills: (json['volunteerSkills'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }
}

class Volunteer {
  final String userName;
  final String userEmail;
  String? volunteerId;

  Volunteer({
    required this.userName,
    required this.userEmail,
    this.volunteerId,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      userName: "${json['firstname']} ${json['lastname']}",
      userEmail: json['email'],
      volunteerId: json['userId'],
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
  final String? postId;
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
