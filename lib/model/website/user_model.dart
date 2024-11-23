class UserModel {
  String userId;
  String userEmail;
  String userPassword;

  // Constructor
  UserModel({
    required this.userId,
    required this.userEmail,
    required this.userPassword,
  });

  // Convert UserModel to Map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }

  // Create UserModel from Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userPassword: map['userPassword'] ?? '',
    );
  }

  // Override toString method
  @override
  String toString() {
    return 'UserModel{userId: $userId, userEmail: $userEmail, userPassword: $userPassword}';
  }
}
