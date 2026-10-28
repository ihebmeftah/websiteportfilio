import 'package:websiteportfilio/l10n/app_localizations.dart';
import 'package:websiteportfilio/providers/settings_providers.dart';

class ExperienceItem {
  const ExperienceItem({
    required this.title,
    required this.org,
    required this.dates,
    required this.body,
  });

  final String title;
  final String org;
  final String dates;
  final String body;
}

class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.body,
    required this.url,
    required this.image,
  });

  final String title;
  final String body;
  final String url;
  final String image;
}

class LanguageItem {
  const LanguageItem({
    required this.name,
    required this.level,
    required this.fluency,
  });

  final String name;
  final String level;
  final double fluency;
}

abstract final class PortfolioLinks {
  static const email = 'mailto:ihebmeftah666@gmail.com';
  static const phone = 'tel:+4915511063642';
  static const emailText = 'ihebmeftah666@gmail.com';
  static const phoneText = '+49 155 11063642';
  static const linkedin = 'https://www.linkedin.com/in/ihebmeftah666/';
  static const github = 'https://github.com/ihebmeftah';
  static const repository = 'https://github.com/ihebmeftah/websiteportfilio';
  static const repositoryLabel = 'github.com/ihebmeftah/websiteportfilio';
  static const mobileSkills = [
    'Flutter',
    'Dart',
    'Firebase',
    'BLoC',
    'GetX',
    'Serverpod',
    'REST',
    'NestJS',
    'Express',
    'React',
    'Angular',
    'PostgreSQL',
    'Java',
    'Spring Boot',
    'System design',
    'CI/CD',
  ];

  static const softwareSkills = [
    'Java',
    'Spring Boot',
    'System design',
    'Architecture',
    'TypeScript',
    'React',
    'Angular',
    'Express',
    'Dart',
    'Flutter',
    'NestJS',
    'PostgreSQL',
    'MongoDB',
    'GraphQL',
    'REST',
    'CI/CD',
  ];
}

class ProfileCopy {
  const ProfileCopy({
    required this.kicker,
    required this.role,
    required this.summary,
    required this.workIntro,
    required this.contactIntro,
    required this.availability,
    required this.skills,
  });

  final String kicker;
  final String role;
  final String summary;
  final String workIntro;
  final String contactIntro;
  final String availability;
  final List<String> skills;
}

ProfileCopy profileCopyOf(AppLocalizations l10n, ProfileFocus focus) {
  final software = focus == ProfileFocus.software;
  return ProfileCopy(
    kicker: software ? l10n.heroKickerSoftware : l10n.heroKicker,
    role: software ? l10n.heroRoleSoftware : l10n.heroRole,
    summary: software ? l10n.heroSummarySoftware : l10n.heroSummary,
    workIntro: software ? l10n.workIntroSoftware : l10n.workIntro,
    contactIntro: software ? l10n.contactIntroSoftware : l10n.contactIntro,
    availability: software ? l10n.availabilitySoftware : l10n.availability,
    skills: software
        ? PortfolioLinks.softwareSkills
        : PortfolioLinks.mobileSkills,
  );
}

List<ExperienceItem> experienceOf(AppLocalizations l10n) {
  return [
    ExperienceItem(
      title: l10n.job1Title,
      org: l10n.job1Org,
      dates: l10n.job1Dates,
      body: l10n.job1Body,
    ),
    ExperienceItem(
      title: l10n.job2Title,
      org: l10n.job2Org,
      dates: l10n.job2Dates,
      body: l10n.job2Body,
    ),
    ExperienceItem(
      title: l10n.job3Title,
      org: l10n.job3Org,
      dates: l10n.job3Dates,
      body: l10n.job3Body,
    ),
    ExperienceItem(
      title: l10n.job4Title,
      org: l10n.job4Org,
      dates: l10n.job4Dates,
      body: l10n.job4Body,
    ),
    ExperienceItem(
      title: l10n.job5Title,
      org: l10n.job5Org,
      dates: l10n.job5Dates,
      body: l10n.job5Body,
    ),
    ExperienceItem(
      title: l10n.job6Title,
      org: l10n.job6Org,
      dates: l10n.job6Dates,
      body: l10n.job6Body,
    ),
  ];
}

List<ProjectItem> projectsOf(AppLocalizations l10n) {
  return [
    ProjectItem(
      title: l10n.project1Title,
      body: l10n.project1Body,
      url: 'https://github.com/ihebmeftah/sip_sync',
      image: 'assets/images/sip_sync.jpg',
    ),
    ProjectItem(
      title: l10n.project2Title,
      body: l10n.project2Body,
      url: 'https://github.com/ihebmeftah/nest_graphql',
      image: 'assets/images/graphql.jpg',
    ),
    ProjectItem(
      title: l10n.project3Title,
      body: l10n.project3Body,
      url: 'https://github.com/ihebmeftah/E-commerce-Full-App-Web-Getx---Firebase-Mvc',
      image: 'assets/images/commerce.jpg',
    ),
    ProjectItem(
      title: l10n.project4Title,
      body: l10n.project4Body,
      url: 'https://github.com/ihebmeftah/movieapp_ios_swiftui',
      image: 'assets/images/movies.jpg',
    ),
  ];
}

List<LanguageItem> languagesOf(AppLocalizations l10n) {
  return [
    LanguageItem(
      name: l10n.langArabic,
      level: l10n.langArabicLevel,
      fluency: 1,
    ),
    LanguageItem(
      name: l10n.langFrench,
      level: l10n.langFrenchLevel,
      fluency: 0.92,
    ),
    LanguageItem(
      name: l10n.langEnglish,
      level: l10n.langEnglishLevel,
      fluency: 0.84,
    ),
    LanguageItem(
      name: l10n.langGerman,
      level: l10n.langGermanLevel,
      fluency: 0.4,
    ),
  ];
}
