import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:websiteportfilio/l10n/app_localizations.dart';

typedef TechString = String Function(AppLocalizations l10n);

class TechTool {
  const TechTool({
    required this.name,
    required this.color,
    required this.category,
    required this.detail,
    this.icon,
    this.letters,
  });

  final String name;
  final Color color;
  final TechString category;
  final TechString detail;
  final IconData? icon;
  final String? letters;
}

class TechFamily {
  const TechFamily({
    required this.id,
    required this.title,
    required this.line,
    required this.proof,
    required this.color,
    required this.icon,
    required this.tools,
  });

  final String id;
  final TechString title;
  final TechString line;
  final TechString proof;
  final Color color;
  final IconData icon;
  final List<TechTool> tools;
}

const techCatalog = <TechFamily>[
  TechFamily(
    id: 'flutter',
    title: _flutterTitle,
    line: _flutterLine,
    proof: _flutterProof,
    color: SimpleIconColors.flutter,
    icon: SimpleIcons.flutter,
    tools: [
      TechTool(
        name: 'Flutter',
        color: SimpleIconColors.flutter,
        icon: SimpleIcons.flutter,
        category: _catProduct,
        detail: _flutterDetail,
      ),
      TechTool(
        name: 'Dart',
        color: SimpleIconColors.dart,
        icon: SimpleIcons.dart,
        category: _catLanguage,
        detail: _dartDetail,
      ),
      TechTool(
        name: 'go_router',
        color: Color(0xFF0288D1),
        letters: 'go',
        category: _catNavigation,
        detail: _goRouterDetail,
      ),
      TechTool(
        name: 'Dio',
        color: Color(0xFF0F766E),
        letters: 'dio',
        category: _catNetwork,
        detail: _dioDetail,
      ),
      TechTool(
        name: 'Retrofit',
        color: Color(0xFFC2410C),
        letters: 'Rt',
        category: _catNetwork,
        detail: _retrofitDetail,
      ),
      TechTool(
        name: 'GetX',
        color: SimpleIconColors.getx,
        icon: SimpleIcons.getx,
        category: _catState,
        detail: _getxDetail,
      ),
      TechTool(
        name: 'BLoC',
        color: Color(0xFF3949AB),
        letters: 'BLoC',
        category: _catState,
        detail: _blocDetail,
      ),
      TechTool(
        name: 'Cubit',
        color: Color(0xFF6D4C9A),
        icon: Icons.view_in_ar,
        category: _catState,
        detail: _cubitDetail,
      ),
      TechTool(
        name: 'Riverpod',
        color: Color(0xFF0E7490),
        icon: Icons.water_drop,
        category: _catState,
        detail: _riverpodDetail,
      ),
      TechTool(
        name: 'Firebase',
        color: SimpleIconColors.firebase,
        icon: SimpleIcons.firebase,
        category: _catPlatform,
        detail: _firebaseDetail,
      ),
      TechTool(
        name: 'Firebase Analytics',
        color: SimpleIconColors.firebase,
        icon: Icons.insights,
        category: _catPlatform,
        detail: _analyticsDetail,
      ),
      TechTool(
        name: 'Crashlytics',
        color: SimpleIconColors.firebase,
        icon: Icons.bug_report,
        category: _catRelease,
        detail: _crashDetail,
      ),
      TechTool(
        name: 'App Distribution',
        color: SimpleIconColors.firebase,
        icon: Icons.send_to_mobile,
        category: _catRelease,
        detail: _distributeDetail,
      ),
      TechTool(
        name: 'Cloud Messaging',
        color: SimpleIconColors.firebase,
        icon: Icons.forum,
        category: _catPlatform,
        detail: _messagingDetail,
      ),
      TechTool(
        name: 'Serverpod',
        color: Color(0xFF15803D),
        letters: 'Sp',
        category: _catBackend,
        detail: _serverpodDetail,
      ),
    ],
  ),
  TechFamily(
    id: 'nest',
    title: _nestTitle,
    line: _nestLine,
    proof: _nestProof,
    color: SimpleIconColors.nestjs,
    icon: SimpleIcons.nestjs,
    tools: [
      TechTool(
        name: 'NestJS',
        color: SimpleIconColors.nestjs,
        icon: SimpleIcons.nestjs,
        category: _catFramework,
        detail: _nestDetail,
      ),
      TechTool(
        name: 'TypeScript',
        color: SimpleIconColors.typescript,
        icon: SimpleIcons.typescript,
        category: _catLanguage,
        detail: _typescriptDetail,
      ),
      TechTool(
        name: 'Multi-tenant',
        color: Color(0xFF4C3C8C),
        icon: Icons.apartment,
        category: _catArchitecture,
        detail: _tenantDetail,
      ),
      TechTool(
        name: 'GraphQL',
        color: SimpleIconColors.graphql,
        icon: SimpleIcons.graphql,
        category: _catApi,
        detail: _graphqlDetail,
      ),
      TechTool(
        name: 'REST',
        color: Color(0xFF0369A1),
        letters: 'API',
        category: _catApi,
        detail: _restDetail,
      ),
      TechTool(
        name: 'PostgreSQL',
        color: SimpleIconColors.postgresql,
        icon: SimpleIcons.postgresql,
        category: _catData,
        detail: _postgresDetail,
      ),
      TechTool(
        name: 'MongoDB',
        color: SimpleIconColors.mongodb,
        icon: SimpleIcons.mongodb,
        category: _catData,
        detail: _mongoDetail,
      ),
    ],
  ),
  TechFamily(
    id: 'also',
    title: _alsoTitle,
    line: _alsoLine,
    proof: _alsoProof,
    color: Color(0xFF4C3C8C),
    icon: Icons.apps,
    tools: [
      TechTool(
        name: 'Java',
        color: Color(0xFF007396),
        icon: SimpleIcons.openjdk,
        category: _catLanguage,
        detail: _javaDetail,
      ),
      TechTool(
        name: 'Spring Boot',
        color: SimpleIconColors.springboot,
        icon: SimpleIcons.springboot,
        category: _catFramework,
        detail: _springDetail,
      ),
      TechTool(
        name: 'Express.js',
        color: Color(0xFF1B1730),
        icon: SimpleIcons.express,
        category: _catBackend,
        detail: _expressDetail,
      ),
      TechTool(
        name: 'React',
        color: Color(0xFF087EA4),
        icon: SimpleIcons.react,
        category: _catClient,
        detail: _reactDetail,
      ),
      TechTool(
        name: 'Angular',
        color: Color(0xFFDD0031),
        icon: SimpleIcons.angular,
        category: _catClient,
        detail: _angularDetail,
      ),
      TechTool(
        name: 'System design',
        color: Color(0xFF4C3C8C),
        icon: Icons.hub,
        category: _catArchitecture,
        detail: _designDetail,
      ),
      TechTool(
        name: 'Git',
        color: SimpleIconColors.git,
        icon: SimpleIcons.git,
        category: _catDelivery,
        detail: _gitDetail,
      ),
      TechTool(
        name: 'CI/CD',
        color: Color(0xFFC2410C),
        icon: Icons.rocket_launch,
        category: _catDelivery,
        detail: _cicdDetail,
      ),
      TechTool(
        name: 'SwiftUI',
        color: SimpleIconColors.swift,
        icon: SimpleIcons.swift,
        category: _catClient,
        detail: _swiftDetail,
      ),
      TechTool(
        name: 'Ionic',
        color: SimpleIconColors.ionic,
        icon: SimpleIcons.ionic,
        category: _catClient,
        detail: _ionicDetail,
      ),
      TechTool(
        name: 'Android',
        color: SimpleIconColors.android,
        icon: SimpleIcons.android,
        category: _catRelease,
        detail: _androidDetail,
      ),
      TechTool(
        name: 'iOS',
        color: Color(0xFF1B1730),
        icon: SimpleIcons.apple,
        category: _catRelease,
        detail: _iosDetail,
      ),
    ],
  ),
];

TechFamily? techFamilyById(String? id) {
  for (final family in techCatalog) {
    if (family.id == id) {
      return family;
    }
  }
  return null;
}

String _flutterTitle(AppLocalizations l10n) => l10n.stackFlutterTitle;

String _flutterLine(AppLocalizations l10n) => l10n.stackFlutterLine;

String _flutterProof(AppLocalizations l10n) => l10n.stackFlutterProof;

String _nestTitle(AppLocalizations l10n) => l10n.stackNestTitle;

String _nestLine(AppLocalizations l10n) => l10n.stackNestLine;

String _nestProof(AppLocalizations l10n) => l10n.stackNestProof;

String _alsoTitle(AppLocalizations l10n) => l10n.stackAlsoTitle;

String _alsoLine(AppLocalizations l10n) => l10n.stackAlsoLine;

String _alsoProof(AppLocalizations l10n) => l10n.stackAlsoProof;

String _catProduct(AppLocalizations l10n) => l10n.techCatProduct;

String _catLanguage(AppLocalizations l10n) => l10n.techCatLanguage;

String _catNavigation(AppLocalizations l10n) => l10n.techCatNavigation;

String _catNetwork(AppLocalizations l10n) => l10n.techCatNetwork;

String _catState(AppLocalizations l10n) => l10n.techCatState;

String _catPlatform(AppLocalizations l10n) => l10n.techCatPlatform;

String _catBackend(AppLocalizations l10n) => l10n.techCatBackend;

String _catFramework(AppLocalizations l10n) => l10n.techCatFramework;

String _catArchitecture(AppLocalizations l10n) => l10n.techCatArchitecture;

String _catApi(AppLocalizations l10n) => l10n.techCatApi;

String _catData(AppLocalizations l10n) => l10n.techCatData;

String _catDelivery(AppLocalizations l10n) => l10n.techCatDelivery;

String _catClient(AppLocalizations l10n) => l10n.techCatClient;

String _catRelease(AppLocalizations l10n) => l10n.techCatRelease;

String _flutterDetail(AppLocalizations l10n) => l10n.techFlutterDetail;

String _dartDetail(AppLocalizations l10n) => l10n.techDartDetail;

String _goRouterDetail(AppLocalizations l10n) => l10n.techGoRouterDetail;

String _dioDetail(AppLocalizations l10n) => l10n.techDioDetail;

String _retrofitDetail(AppLocalizations l10n) => l10n.techRetrofitDetail;

String _getxDetail(AppLocalizations l10n) => l10n.techGetxDetail;

String _blocDetail(AppLocalizations l10n) => l10n.techBlocDetail;

String _cubitDetail(AppLocalizations l10n) => l10n.techCubitDetail;

String _riverpodDetail(AppLocalizations l10n) => l10n.techRiverpodDetail;

String _firebaseDetail(AppLocalizations l10n) => l10n.techFirebaseDetail;

String _serverpodDetail(AppLocalizations l10n) => l10n.techServerpodDetail;

String _nestDetail(AppLocalizations l10n) => l10n.techNestDetail;

String _typescriptDetail(AppLocalizations l10n) => l10n.techTypescriptDetail;

String _tenantDetail(AppLocalizations l10n) => l10n.techTenantDetail;

String _graphqlDetail(AppLocalizations l10n) => l10n.techGraphqlDetail;

String _restDetail(AppLocalizations l10n) => l10n.techRestDetail;

String _postgresDetail(AppLocalizations l10n) => l10n.techPostgresDetail;

String _mongoDetail(AppLocalizations l10n) => l10n.techMongoDetail;

String _javaDetail(AppLocalizations l10n) => l10n.techJavaDetail;

String _designDetail(AppLocalizations l10n) => l10n.techDesignDetail;

String _gitDetail(AppLocalizations l10n) => l10n.techGitDetail;

String _cicdDetail(AppLocalizations l10n) => l10n.techCicdDetail;

String _swiftDetail(AppLocalizations l10n) => l10n.techSwiftDetail;

String _ionicDetail(AppLocalizations l10n) => l10n.techIonicDetail;

String _androidDetail(AppLocalizations l10n) => l10n.techAndroidDetail;

String _iosDetail(AppLocalizations l10n) => l10n.techIosDetail;

String _analyticsDetail(AppLocalizations l10n) => l10n.techAnalyticsDetail;

String _crashDetail(AppLocalizations l10n) => l10n.techCrashDetail;

String _distributeDetail(AppLocalizations l10n) => l10n.techDistributeDetail;

String _messagingDetail(AppLocalizations l10n) => l10n.techMessagingDetail;

String _springDetail(AppLocalizations l10n) => l10n.techSpringDetail;

String _expressDetail(AppLocalizations l10n) => l10n.techExpressDetail;

String _reactDetail(AppLocalizations l10n) => l10n.techReactDetail;

String _angularDetail(AppLocalizations l10n) => l10n.techAngularDetail;
