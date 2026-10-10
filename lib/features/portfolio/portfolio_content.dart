import 'package:websiteportfilio/l10n/app_localizations.dart';

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
  static const skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'BLoC',
    'GetX',
    'Serverpod',
    'REST',
    'NestJS',
    'PostgreSQL',
    'CI/CD',
  ];
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
      url:
          'https://github.com/ihebmeftah/E-commerce-Full-App-Web-Getx---Firebase-Mvc',
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
