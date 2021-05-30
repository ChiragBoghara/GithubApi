import 'package:flutter/cupertino.dart';

class User {
  String loginName;
  String name;
  String avatarUrl;
  int followers;
  int following;
  int publicRepos;
  String createdAt;
  String bio;
  String location;
  String htmlUrl;
  String notes;
  User({
    @required this.name,
    @required this.location,
    @required this.avatarUrl,
    @required this.bio,
    @required this.createdAt,
    @required this.followers,
    @required this.following,
    @required this.loginName,
    @required this.publicRepos,
    @required this.htmlUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      avatarUrl: json["avatar_url"],
      bio: json["bio"],
      createdAt: json["created_at"],
      followers: json["followers"],
      following: json["following"],
      location: json["location"],
      loginName: json["login"],
      publicRepos: json["public_repos"],
      htmlUrl: json["html_url"],
    );
  }
}
