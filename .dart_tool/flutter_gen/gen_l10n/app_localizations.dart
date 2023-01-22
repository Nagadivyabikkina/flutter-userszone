
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
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
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// User email address
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @textUserName.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get textUserName;

  /// No description provided for @textEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get textEditProfile;

  /// No description provided for @textWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to users zone!'**
  String get textWelcome;

  /// No description provided for @textLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get textLogin;

  /// No description provided for @textCreateUser.
  ///
  /// In en, this message translates to:
  /// **'Create User'**
  String get textCreateUser;

  /// No description provided for @textLoginError.
  ///
  /// In en, this message translates to:
  /// **'Login Error'**
  String get textLoginError;

  /// No description provided for @textCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get textCancel;

  /// No description provided for @textInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Enter valid username and password'**
  String get textInvalidCredentials;

  /// No description provided for @textFullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get textFullName;

  /// No description provided for @textContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get textContinue;

  /// No description provided for @textSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get textSaveChanges;

  /// No description provided for @textEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter valid email'**
  String get textEnterValidEmail;

  /// No description provided for @textEmailIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get textEmailIsRequired;

  /// No description provided for @textEnterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter Full Name'**
  String get textEnterFullName;

  /// No description provided for @textUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get textUsers;

  /// No description provided for @textServerError.
  ///
  /// In en, this message translates to:
  /// **'It looks like there was an error on our end.'**
  String get textServerError;

  /// No description provided for @textPleaseTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Please try again later.'**
  String get textPleaseTryAgain;

  /// No description provided for @textAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get textAbout;

  /// No description provided for @textAboutFlutterDeveloper.
  ///
  /// In en, this message translates to:
  /// **'I love to solve problems using technology that improves user’s life on a major scale. Over the last several years, I have been developing and leading various mobile apps in different areas. More than just programming, I love to write technical articles. I have written many high-quality technical articles.'**
  String get textAboutFlutterDeveloper;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
