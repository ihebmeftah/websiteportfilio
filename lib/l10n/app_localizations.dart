import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('de'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Iheb Meftah'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get navWork;

  /// No description provided for @navStack.
  ///
  /// In en, this message translates to:
  /// **'Stack'**
  String get navStack;

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @menuTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open menu'**
  String get menuTooltip;

  /// No description provided for @themeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Change theme'**
  String get themeTooltip;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @heroKicker.
  ///
  /// In en, this message translates to:
  /// **'Flutter lead'**
  String get heroKicker;

  /// No description provided for @heroName.
  ///
  /// In en, this message translates to:
  /// **'Iheb Meftah'**
  String get heroName;

  /// No description provided for @heroRole.
  ///
  /// In en, this message translates to:
  /// **'Flutter mobile engineer'**
  String get heroRole;

  /// No description provided for @heroSummary.
  ///
  /// In en, this message translates to:
  /// **'Mobile developer in Germany, looking for a new position and a new way to contribute. I ship Flutter applications for iOS and Android, from the first feature through release, and I also work with Java and system design. At EdTrust I led EdTeacher, EdManager, EdStudent, and EdParent.'**
  String get heroSummary;

  /// No description provided for @profileMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile developer'**
  String get profileMobile;

  /// No description provided for @profileSoftware.
  ///
  /// In en, this message translates to:
  /// **'Software engineer'**
  String get profileSoftware;

  /// No description provided for @heroKickerSoftware.
  ///
  /// In en, this message translates to:
  /// **'Software engineer'**
  String get heroKickerSoftware;

  /// No description provided for @heroRoleSoftware.
  ///
  /// In en, this message translates to:
  /// **'Software engineer'**
  String get heroRoleSoftware;

  /// No description provided for @heroSummarySoftware.
  ///
  /// In en, this message translates to:
  /// **'Software engineer in Germany, looking for a new position and a new way to contribute on a product team. I design mobile products and the services behind them, with Java, system design, Flutter, and REST. At EdTrust I led EdTeacher, EdManager, EdStudent, and EdParent.'**
  String get heroSummarySoftware;

  /// No description provided for @ctaWork.
  ///
  /// In en, this message translates to:
  /// **'View work'**
  String get ctaWork;

  /// No description provided for @ctaContact.
  ///
  /// In en, this message translates to:
  /// **'Get in touch'**
  String get ctaContact;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get location;

  /// No description provided for @locationTitle.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get locationTitle;

  /// No description provided for @statSinceValue.
  ///
  /// In en, this message translates to:
  /// **'2022'**
  String get statSinceValue;

  /// No description provided for @statSinceLabel.
  ///
  /// In en, this message translates to:
  /// **'From intern to team lead at EdTrust'**
  String get statSinceLabel;

  /// No description provided for @statAppsValue.
  ///
  /// In en, this message translates to:
  /// **'4'**
  String get statAppsValue;

  /// No description provided for @statAppsLabel.
  ///
  /// In en, this message translates to:
  /// **'Production apps for school communities'**
  String get statAppsLabel;

  /// No description provided for @statPlaceValue.
  ///
  /// In en, this message translates to:
  /// **'DE'**
  String get statPlaceValue;

  /// No description provided for @statPlaceLabel.
  ///
  /// In en, this message translates to:
  /// **'Based in Germany'**
  String get statPlaceLabel;

  /// No description provided for @sectionWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get sectionWork;

  /// No description provided for @sectionProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get sectionProjects;

  /// No description provided for @sectionContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get sectionContact;

  /// No description provided for @workIntro.
  ///
  /// In en, this message translates to:
  /// **'Production mobile work, from the EdTrust internship to team leadership and contract products.'**
  String get workIntro;

  /// No description provided for @workIntroSoftware.
  ///
  /// In en, this message translates to:
  /// **'Production software work, from system design and team leadership to contract products.'**
  String get workIntroSoftware;

  /// No description provided for @projectsIntro.
  ///
  /// In en, this message translates to:
  /// **'Selected products across Flutter, backend services, and native clients.'**
  String get projectsIntro;

  /// No description provided for @contactIntro.
  ///
  /// In en, this message translates to:
  /// **'Open to mobile and product engineering conversations.'**
  String get contactIntro;

  /// No description provided for @contactIntroSoftware.
  ///
  /// In en, this message translates to:
  /// **'Open to software engineering conversations, including mobile, Java, and system design.'**
  String get contactIntroSoftware;

  /// No description provided for @educationTitle.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get educationTitle;

  /// No description provided for @educationDegree.
  ///
  /// In en, this message translates to:
  /// **'Engineer\'s degree, Computer Software Engineering'**
  String get educationDegree;

  /// No description provided for @educationSchool.
  ///
  /// In en, this message translates to:
  /// **'TEK-UP University of Digital Sciences, Ariana, Tunisia'**
  String get educationSchool;

  /// No description provided for @educationDates.
  ///
  /// In en, this message translates to:
  /// **'2023 – 2026'**
  String get educationDates;

  /// No description provided for @skillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Stack'**
  String get skillsTitle;

  /// No description provided for @languagesTitle.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languagesTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneLabel;

  /// No description provided for @linkedinLabel.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkedinLabel;

  /// No description provided for @githubLabel.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get githubLabel;

  /// No description provided for @availability.
  ///
  /// In en, this message translates to:
  /// **'Currently in Germany. Happy to talk about Flutter, product architecture, Java, and teams shipping on iOS and Android.'**
  String get availability;

  /// No description provided for @availabilitySoftware.
  ///
  /// In en, this message translates to:
  /// **'Currently in Germany. Happy to talk about system design, Java, Flutter, and teams shipping on iOS and Android.'**
  String get availabilitySoftware;

  /// No description provided for @job1Title.
  ///
  /// In en, this message translates to:
  /// **'Flutter Lead (Full-time)'**
  String get job1Title;

  /// No description provided for @job1Org.
  ///
  /// In en, this message translates to:
  /// **'EdTrust, Tunis'**
  String get job1Org;

  /// No description provided for @job1Dates.
  ///
  /// In en, this message translates to:
  /// **'July 2024 – Present'**
  String get job1Dates;

  /// No description provided for @job1Body.
  ///
  /// In en, this message translates to:
  /// **'Full-time Flutter lead, working hybrid. Led development and deployment of EdTeacher, EdManager, EdStudent, and EdParent. These apps are used by thousands of teachers, students, administrators, and parents for school communication and monitoring. The work covers system design, a scalable architecture, Flutter, GetX, Firebase, CI/CD, and API integrations, through release on iOS and Android.'**
  String get job1Body;

  /// No description provided for @job2Title.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer (Part-time)'**
  String get job2Title;

  /// No description provided for @job2Org.
  ///
  /// In en, this message translates to:
  /// **'EdTrust, Tunis'**
  String get job2Org;

  /// No description provided for @job2Dates.
  ///
  /// In en, this message translates to:
  /// **'September 2022 – July 2024'**
  String get job2Dates;

  /// No description provided for @job2Body.
  ///
  /// In en, this message translates to:
  /// **'Part-time Flutter developer, working remotely, on the EdTrust applications. Built features, connected APIs, and supported releases on iOS and Android.'**
  String get job2Body;

  /// No description provided for @job3Title.
  ///
  /// In en, this message translates to:
  /// **'Flutter Intern'**
  String get job3Title;

  /// No description provided for @job3Org.
  ///
  /// In en, this message translates to:
  /// **'EdTrust, Tunis'**
  String get job3Org;

  /// No description provided for @job3Dates.
  ///
  /// In en, this message translates to:
  /// **'June 2022 – August 2022'**
  String get job3Dates;

  /// No description provided for @job3Body.
  ///
  /// In en, this message translates to:
  /// **'Flutter intern on the mobile team. Contributed to the Flutter applications for teachers, students, parents, and school administrators.'**
  String get job3Body;

  /// No description provided for @job4Title.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer (Contract)'**
  String get job4Title;

  /// No description provided for @job4Org.
  ///
  /// In en, this message translates to:
  /// **'Invertech'**
  String get job4Org;

  /// No description provided for @job4Dates.
  ///
  /// In en, this message translates to:
  /// **'September 2024 – July 2026'**
  String get job4Dates;

  /// No description provided for @job4Body.
  ///
  /// In en, this message translates to:
  /// **'Built an inventory application that keeps working online and offline. It scans barcodes, tracks missions in real time, and stays in sync through REST APIs, local storage, and live communication.'**
  String get job4Body;

  /// No description provided for @job5Title.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer (Contract)'**
  String get job5Title;

  /// No description provided for @job5Org.
  ///
  /// In en, this message translates to:
  /// **'Azombwe'**
  String get job5Org;

  /// No description provided for @job5Dates.
  ///
  /// In en, this message translates to:
  /// **'January 2024 – June 2024'**
  String get job5Dates;

  /// No description provided for @job5Body.
  ///
  /// In en, this message translates to:
  /// **'Developed an education app of interactive quizzes on African culture, together with the British Council. Designed the interface and connected it to Firebase and REST APIs.'**
  String get job5Body;

  /// No description provided for @job6Title.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer Intern'**
  String get job6Title;

  /// No description provided for @job6Org.
  ///
  /// In en, this message translates to:
  /// **'Rooly'**
  String get job6Org;

  /// No description provided for @job6Dates.
  ///
  /// In en, this message translates to:
  /// **'February 2023 – August 2023'**
  String get job6Dates;

  /// No description provided for @job6Body.
  ///
  /// In en, this message translates to:
  /// **'Worked on a roadside-assistance application that connects drivers with nearby service providers. Added geolocation, maps, authentication, and the API integration that supports those interactions in real time.'**
  String get job6Body;

  /// No description provided for @project1Title.
  ///
  /// In en, this message translates to:
  /// **'Sip & Sync POS'**
  String get project1Title;

  /// No description provided for @project1Body.
  ///
  /// In en, this message translates to:
  /// **'Flutter client with a Serverpod backend. Multi-location café operations, real-time orders, and inventory. Serverpod Flutter Hackathon (Devpost).'**
  String get project1Body;

  /// No description provided for @project2Title.
  ///
  /// In en, this message translates to:
  /// **'GraphQL API'**
  String get project2Title;

  /// No description provided for @project2Body.
  ///
  /// In en, this message translates to:
  /// **'TypeScript service with NestJS and GraphQL.'**
  String get project2Body;

  /// No description provided for @project3Title.
  ///
  /// In en, this message translates to:
  /// **'E-commerce application'**
  String get project3Title;

  /// No description provided for @project3Body.
  ///
  /// In en, this message translates to:
  /// **'Flutter, GetX, Firebase, and MVC for mobile and web.'**
  String get project3Body;

  /// No description provided for @project4Title.
  ///
  /// In en, this message translates to:
  /// **'Movies applications'**
  String get project4Title;

  /// No description provided for @project4Body.
  ///
  /// In en, this message translates to:
  /// **'Ionic/TypeScript client and a native SwiftUI client, against the same product idea.'**
  String get project4Body;

  /// No description provided for @langArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get langArabic;

  /// No description provided for @langArabicLevel.
  ///
  /// In en, this message translates to:
  /// **'Native'**
  String get langArabicLevel;

  /// No description provided for @langFrench.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get langFrench;

  /// No description provided for @langFrenchLevel.
  ///
  /// In en, this message translates to:
  /// **'Second language'**
  String get langFrenchLevel;

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// No description provided for @langEnglishLevel.
  ///
  /// In en, this message translates to:
  /// **'Full professional proficiency'**
  String get langEnglishLevel;

  /// No description provided for @langGerman.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get langGerman;

  /// No description provided for @langGermanLevel.
  ///
  /// In en, this message translates to:
  /// **'A2 — currently learning'**
  String get langGermanLevel;

  /// No description provided for @viewProject.
  ///
  /// In en, this message translates to:
  /// **'View project'**
  String get viewProject;

  /// No description provided for @sectionStack.
  ///
  /// In en, this message translates to:
  /// **'Technologies'**
  String get sectionStack;

  /// No description provided for @stackIntro.
  ///
  /// In en, this message translates to:
  /// **'The tools I use to design a product, ship it, and run the service behind it.'**
  String get stackIntro;

  /// No description provided for @stackOpen.
  ///
  /// In en, this message translates to:
  /// **'See the stack'**
  String get stackOpen;

  /// No description provided for @stackFamilyCta.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get stackFamilyCta;

  /// No description provided for @stackWhere.
  ///
  /// In en, this message translates to:
  /// **'Where it shows up'**
  String get stackWhere;

  /// No description provided for @stackFlutterTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter'**
  String get stackFlutterTitle;

  /// No description provided for @stackFlutterLine.
  ///
  /// In en, this message translates to:
  /// **'iOS and Android, from the first feature through the store release.'**
  String get stackFlutterLine;

  /// No description provided for @stackFlutterProof.
  ///
  /// In en, this message translates to:
  /// **'At EdTrust I led EdTeacher, EdManager, EdStudent, and EdParent, used by thousands of teachers, students, administrators, and parents. Those apps run on GetX. Around that I use BLoC and Cubit when a feature wants an explicit state model, Riverpod for scoped state, and go_router, Dio, and Retrofit when navigation and API clients should stay typed.'**
  String get stackFlutterProof;

  /// No description provided for @stackNestTitle.
  ///
  /// In en, this message translates to:
  /// **'NestJS'**
  String get stackNestTitle;

  /// No description provided for @stackNestLine.
  ///
  /// In en, this message translates to:
  /// **'Services for more than one organization, with GraphQL, REST, and a database that fits the data.'**
  String get stackNestLine;

  /// No description provided for @stackNestProof.
  ///
  /// In en, this message translates to:
  /// **'I reach for NestJS when a mobile app needs a real service. Multi-tenant isolation lets more than one organization share a deployment. GraphQL fits when the client should ask for specific fields, and REST fits when a resource API is the clearer contract. PostgreSQL or MongoDB sits behind that, depending on the model. The public GraphQL service is one example.'**
  String get stackNestProof;

  /// No description provided for @stackAlsoTitle.
  ///
  /// In en, this message translates to:
  /// **'Also shipping'**
  String get stackAlsoTitle;

  /// No description provided for @stackAlsoLine.
  ///
  /// In en, this message translates to:
  /// **'Languages, design, and the path from a branch to the stores.'**
  String get stackAlsoLine;

  /// No description provided for @stackAlsoProof.
  ///
  /// In en, this message translates to:
  /// **'Java and system design sit next to the mobile work. CI/CD carries a build through to the App Store and Play Store. The movies project ships as both a SwiftUI client and an Ionic client.'**
  String get stackAlsoProof;

  /// No description provided for @techCatProduct.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get techCatProduct;

  /// No description provided for @techCatLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get techCatLanguage;

  /// No description provided for @techCatNavigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get techCatNavigation;

  /// No description provided for @techCatNetwork.
  ///
  /// In en, this message translates to:
  /// **'Networking'**
  String get techCatNetwork;

  /// No description provided for @techCatState.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get techCatState;

  /// No description provided for @techCatPlatform.
  ///
  /// In en, this message translates to:
  /// **'Platform'**
  String get techCatPlatform;

  /// No description provided for @techCatBackend.
  ///
  /// In en, this message translates to:
  /// **'Backend'**
  String get techCatBackend;

  /// No description provided for @techCatFramework.
  ///
  /// In en, this message translates to:
  /// **'Framework'**
  String get techCatFramework;

  /// No description provided for @techCatArchitecture.
  ///
  /// In en, this message translates to:
  /// **'Architecture'**
  String get techCatArchitecture;

  /// No description provided for @techCatApi.
  ///
  /// In en, this message translates to:
  /// **'API'**
  String get techCatApi;

  /// No description provided for @techCatData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get techCatData;

  /// No description provided for @techCatDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get techCatDelivery;

  /// No description provided for @techCatClient.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get techCatClient;

  /// No description provided for @techCatRelease.
  ///
  /// In en, this message translates to:
  /// **'Release'**
  String get techCatRelease;

  /// No description provided for @techFlutterDetail.
  ///
  /// In en, this message translates to:
  /// **'Interfaces for iOS, Android, and web'**
  String get techFlutterDetail;

  /// No description provided for @techDartDetail.
  ///
  /// In en, this message translates to:
  /// **'The language on the client, and on Serverpod'**
  String get techDartDetail;

  /// No description provided for @techGoRouterDetail.
  ///
  /// In en, this message translates to:
  /// **'Typed routes, guards, and deep links'**
  String get techGoRouterDetail;

  /// No description provided for @techDioDetail.
  ///
  /// In en, this message translates to:
  /// **'HTTP with interceptors, timeouts, and retries'**
  String get techDioDetail;

  /// No description provided for @techRetrofitDetail.
  ///
  /// In en, this message translates to:
  /// **'Generated clients from the API contract'**
  String get techRetrofitDetail;

  /// No description provided for @techGetxDetail.
  ///
  /// In en, this message translates to:
  /// **'State, injection, and navigation on the EdTrust apps'**
  String get techGetxDetail;

  /// No description provided for @techBlocDetail.
  ///
  /// In en, this message translates to:
  /// **'Events and states for larger features'**
  String get techBlocDetail;

  /// No description provided for @techCubitDetail.
  ///
  /// In en, this message translates to:
  /// **'The same model, without event classes'**
  String get techCubitDetail;

  /// No description provided for @techRiverpodDetail.
  ///
  /// In en, this message translates to:
  /// **'Scoped providers. This site runs on it'**
  String get techRiverpodDetail;

  /// No description provided for @techFirebaseDetail.
  ///
  /// In en, this message translates to:
  /// **'Auth, data, and the release path'**
  String get techFirebaseDetail;

  /// No description provided for @techServerpodDetail.
  ///
  /// In en, this message translates to:
  /// **'Dart backend for live orders and inventory'**
  String get techServerpodDetail;

  /// No description provided for @techNestDetail.
  ///
  /// In en, this message translates to:
  /// **'Modules, injection, and a clear server boundary'**
  String get techNestDetail;

  /// No description provided for @techTypescriptDetail.
  ///
  /// In en, this message translates to:
  /// **'Typed contracts from the service to the client'**
  String get techTypescriptDetail;

  /// No description provided for @techTenantDetail.
  ///
  /// In en, this message translates to:
  /// **'One deployment, isolated data per organization'**
  String get techTenantDetail;

  /// No description provided for @techGraphqlDetail.
  ///
  /// In en, this message translates to:
  /// **'Schema-first APIs the client can query precisely'**
  String get techGraphqlDetail;

  /// No description provided for @techRestDetail.
  ///
  /// In en, this message translates to:
  /// **'Resource APIs the Flutter apps already call'**
  String get techRestDetail;

  /// No description provided for @techPostgresDetail.
  ///
  /// In en, this message translates to:
  /// **'Relational data when the model is strict'**
  String get techPostgresDetail;

  /// No description provided for @techMongoDetail.
  ///
  /// In en, this message translates to:
  /// **'Documents when the shape needs to move'**
  String get techMongoDetail;

  /// No description provided for @techJavaDetail.
  ///
  /// In en, this message translates to:
  /// **'Systems work alongside the mobile products'**
  String get techJavaDetail;

  /// No description provided for @techDesignDetail.
  ///
  /// In en, this message translates to:
  /// **'Architecture for apps a whole school uses'**
  String get techDesignDetail;

  /// No description provided for @techCicdDetail.
  ///
  /// In en, this message translates to:
  /// **'Pipelines from the branch to the stores'**
  String get techCicdDetail;

  /// No description provided for @techGitDetail.
  ///
  /// In en, this message translates to:
  /// **'History, review, and the release branch'**
  String get techGitDetail;

  /// No description provided for @techSwiftDetail.
  ///
  /// In en, this message translates to:
  /// **'Native iOS client for the movies project'**
  String get techSwiftDetail;

  /// No description provided for @techIonicDetail.
  ///
  /// In en, this message translates to:
  /// **'TypeScript client beside that same product'**
  String get techIonicDetail;

  /// No description provided for @techAndroidDetail.
  ///
  /// In en, this message translates to:
  /// **'Play Store releases'**
  String get techAndroidDetail;

  /// No description provided for @techIosDetail.
  ///
  /// In en, this message translates to:
  /// **'App Store releases'**
  String get techIosDetail;

  /// No description provided for @techAnalyticsDetail.
  ///
  /// In en, this message translates to:
  /// **'How the shipped apps are actually used'**
  String get techAnalyticsDetail;

  /// No description provided for @techCrashDetail.
  ///
  /// In en, this message translates to:
  /// **'Crashes from devices, tied to a release'**
  String get techCrashDetail;

  /// No description provided for @techDistributeDetail.
  ///
  /// In en, this message translates to:
  /// **'Test builds before the store release'**
  String get techDistributeDetail;

  /// No description provided for @techMessagingDetail.
  ///
  /// In en, this message translates to:
  /// **'Push messages to installed apps'**
  String get techMessagingDetail;

  /// No description provided for @techSpringDetail.
  ///
  /// In en, this message translates to:
  /// **'Java services with Spring Boot'**
  String get techSpringDetail;

  /// No description provided for @techExpressDetail.
  ///
  /// In en, this message translates to:
  /// **'Node.js APIs beside the NestJS services'**
  String get techExpressDetail;

  /// No description provided for @techReactDetail.
  ///
  /// In en, this message translates to:
  /// **'Component interfaces for the web'**
  String get techReactDetail;

  /// No description provided for @techAngularDetail.
  ///
  /// In en, this message translates to:
  /// **'Structured applications in the browser'**
  String get techAngularDetail;

  /// No description provided for @footerCvTitle.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get footerCvTitle;

  /// No description provided for @footerCvBody.
  ///
  /// In en, this message translates to:
  /// **'Choose English or German. The PDF matches the selected profile: {profile}.'**
  String footerCvBody(String profile);

  /// No description provided for @footerCvEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get footerCvEnglish;

  /// No description provided for @footerCvGerman.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get footerCvGerman;

  /// No description provided for @footerBuilt.
  ///
  /// In en, this message translates to:
  /// **'I designed and built this website.'**
  String get footerBuilt;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
