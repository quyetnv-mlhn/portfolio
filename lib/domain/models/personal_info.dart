class PersonalInfo {
  final String name;
  final List<SocialLinkInfo> socialLinks;

  const PersonalInfo({required this.name, required this.socialLinks});

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      name: json['name'] as String,
      socialLinks:
          (json['social_links'] as List)
              .map((e) => SocialLinkInfo.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class SocialLinkInfo {
  final String platform;
  final String url;

  const SocialLinkInfo({required this.platform, required this.url});

  factory SocialLinkInfo.fromJson(Map<String, dynamic> json) {
    return SocialLinkInfo(
      platform: json['platform'] as String,
      url: json['url'] as String,
    );
  }
}
