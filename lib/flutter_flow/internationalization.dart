import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ta', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? taText = '',
    String? hiText = '',
  }) =>
      [enText, taText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    '5g9tuka4': {
      'en': 'Login',
      'hi': '',
      'ta': '',
    },
    'rw839xq7': {
      'en': 'Email Address',
      'hi': '',
      'ta': '',
    },
    '6zlqcrpc': {
      'en': 'Enter your email...',
      'hi': '',
      'ta': '',
    },
    'ml7ko9bs': {
      'en': 'Password',
      'hi': '',
      'ta': '',
    },
    'a5brkm9z': {
      'en': 'Enter your password...',
      'hi': '',
      'ta': '',
    },
    'arsopmji': {
      'en': 'Login',
      'hi': '',
      'ta': '',
    },
    'fn5srg7y': {
      'en': 'Forgot Password',
      'hi': '',
      'ta': '',
    },
    '5xaqdzr5': {
      'en': 'Continue as Guest',
      'hi': '',
      'ta': '',
    },
    'g5rax75q': {
      'en': 'Register',
      'hi': '',
      'ta': '',
    },
    'abevjb4f': {
      'en': 'Email Address',
      'hi': '',
      'ta': '',
    },
    'dwvk5rfh': {
      'en': 'Enter your email...',
      'hi': '',
      'ta': '',
    },
    'jgm3osf5': {
      'en': 'Password',
      'hi': '',
      'ta': '',
    },
    '9koh3nk9': {
      'en': 'Enter your password...',
      'hi': '',
      'ta': '',
    },
    '1idmlbxs': {
      'en': 'Confirm Password',
      'hi': '',
      'ta': '',
    },
    'h98bavld': {
      'en': 'Enter your password...',
      'hi': '',
      'ta': '',
    },
    'vmuxaxii': {
      'en': 'Create Account',
      'hi': '',
      'ta': '',
    },
    'knr8ceiv': {
      'en': 'Continue as Guest',
      'hi': '',
      'ta': '',
    },
    'g7zbnezx': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // completeProfile
  {
    'rbq6ovq8': {
      'en': 'Complete Profile',
      'hi': '',
      'ta': '',
    },
    'g49an4nq': {
      'en': 'Upload a photo for us to easily identify you.',
      'hi': '',
      'ta': '',
    },
    'rdzi2ti6': {
      'en': 'Your Name',
      'hi': '',
      'ta': '',
    },
    'pvjugzeq': {
      'en': 'Full Name',
      'hi': '',
      'ta': '',
    },
    'ydkgjxwg': {
      'en': 'Phone Number',
      'hi': '',
      'ta': '',
    },
    '1fauezvk': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'jyjp0uon': {
      'en': 'Date Of Birth',
      'hi': '',
      'ta': '',
    },
    '2skmke0m': {
      'en': 'Your Birth Sex',
      'hi': '',
      'ta': '',
    },
    '1zh9f1zq': {
      'en': 'Male',
      'hi': '',
      'ta': '',
    },
    'bun9bjud': {
      'en': 'Female',
      'hi': '',
      'ta': '',
    },
    'u1zrlcbq': {
      'en': 'Undisclosed',
      'hi': '',
      'ta': '',
    },
    'rhw1xydv': {
      'en': 'Profession',
      'hi': '',
      'ta': '',
    },
    'sk10evde': {
      'en': 'Patient',
      'hi': '',
      'ta': '',
    },
    'xwuaytol': {
      'en': 'Faculty',
      'hi': '',
      'ta': '',
    },
    'hb9k94bw': {
      'en': 'Qualification',
      'hi': '',
      'ta': '',
    },
    '9vmebhe2': {
      'en': 'Below SSLC',
      'hi': '',
      'ta': '',
    },
    't6qgu8jz': {
      'en': 'HSLC',
      'hi': '',
      'ta': '',
    },
    '2ukpt10q': {
      'en': 'Undergrad',
      'hi': '',
      'ta': '',
    },
    'q3hjrz1l': {
      'en': 'Postgrad',
      'hi': '',
      'ta': '',
    },
    'ivwmx58n': {
      'en': 'Above Postgrad',
      'hi': '',
      'ta': '',
    },
    'hkqrhu74': {
      'en': 'Add Another Profile',
      'hi': '',
      'ta': '',
    },
    'nfukjqqv': {
      'en': 'Complete Profile',
      'hi': '',
      'ta': '',
    },
    'std5d757': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // forgotPassword
  {
    'pf8sjmwv': {
      'en': 'Forgot Password',
      'hi': '',
      'ta': '',
    },
    '16dw8x99': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'hi': '',
      'ta': '',
    },
    'huwqbam9': {
      'en': 'Email Address',
      'hi': '',
      'ta': '',
    },
    '03h7ba8s': {
      'en': 'Enter your email...',
      'hi': '',
      'ta': '',
    },
    'hg3qr64w': {
      'en': 'Send Reset Link',
      'hi': '',
      'ta': '',
    },
    '73am4rs8': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // addAnotherProfile
  {
    'vnhl61pj': {
      'en': 'Add Another Profile',
      'hi': '',
      'ta': '',
    },
    'bi2gchak': {
      'en': 'Upload a photo for us to easily identify this person.',
      'hi': '',
      'ta': '',
    },
    'uqvz87xi': {
      'en': 'Persons Name',
      'hi': '',
      'ta': '',
    },
    '2lu06j3b': {
      'en': 'Official name here...',
      'hi': '',
      'ta': '',
    },
    'ugl4dw2q': {
      'en': 'Persons Age',
      'hi': '',
      'ta': '',
    },
    'uplvh3d5': {
      'en': 'i.e. 34',
      'hi': '',
      'ta': '',
    },
    '7hw492ss': {
      'en': 'Persons Ailments',
      'hi': '',
      'ta': '',
    },
    'tjp6sdjl': {
      'en': 'What types of allergies do they have..',
      'hi': '',
      'ta': '',
    },
    '8yczakjb': {
      'en': 'Location',
      'hi': '',
      'ta': '',
    },
    'nstc7ys2': {
      'en': 'Please enter a valid email...',
      'hi': '',
      'ta': '',
    },
    'd84mr710': {
      'en': 'Persons Birth Sex',
      'hi': '',
      'ta': '',
    },
    '89tub0ty': {
      'en': 'Male',
      'hi': '',
      'ta': '',
    },
    'srjz2uvd': {
      'en': 'Female',
      'hi': '',
      'ta': '',
    },
    '9eoj1hmp': {
      'en': 'Undisclosed',
      'hi': '',
      'ta': '',
    },
    'q1pul6au': {
      'en': 'Complete Profile',
      'hi': '',
      'ta': '',
    },
    'dw98zc21': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // onboarding
  {
    '22kc8fdm': {
      'en': 'Knowledge is Health',
      'hi': '',
      'ta': '',
    },
    'qot46jr1': {
      'en': 'Check your Drug-Food Interactions with single touch.',
      'hi': '',
      'ta': '',
    },
    '7m0ajt7k': {
      'en': 'Seamless Safety',
      'hi': '',
      'ta': '',
    },
    '8unop8sw': {
      'en': 'Your Medications are more Safe Now.',
      'hi': '',
      'ta': '',
    },
    '4mevxhw9': {
      'en': 'Nourish & Recover',
      'hi': '',
      'ta': '',
    },
    'bxkdt7fq': {
      'en': 'Avoid Drug-Food Interactions and Recover Better than before.',
      'hi': '',
      'ta': '',
    },
    '7vypzmyr': {
      'en': 'Be Safe',
      'hi': '',
      'ta': '',
    },
    'dt3xgoqg': {
      'en': 'Before using it, seek Advice from your Health Care Provider.',
      'hi': '',
      'ta': '',
    },
    'pf100x14': {
      'en': 'Continue',
      'hi': '',
      'ta': '',
    },
    'jsp2dj0e': {
      'en': 'Next',
      'hi': '',
      'ta': '',
    },
    'fogkoxym': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // homePage
  {
    'woeqq2hr': {
      'en': 'Hello,',
      'hi': '',
      'ta': '',
    },
    'p5n5w5ye': {
      'en': 'About Us',
      'hi': '',
      'ta': '',
    },
    '4qx9dlbe': {
      'en': 'References',
      'hi': '',
      'ta': '',
    },
    'k791pyri': {
      'en': 'Team',
      'hi': '',
      'ta': '',
    },
    'jq637gav': {
      'en': 'Contact Us',
      'hi': '',
      'ta': '',
    },
    '9ef12suy': {
      'en': '•',
      'hi': '',
      'ta': '',
    },
  },
  // medicinePage
  {
    'a5z8v318': {
      'en': 'Medicines',
      'hi': '',
      'ta': '',
    },
    'st1emt0b': {
      'en': 'Search medicines...',
      'hi': '',
      'ta': '',
    },
    'flnq7uvt': {
      'en': 'Look here for all the',
      'hi': '',
      'ta': '',
    },
    'aa668cch': {
      'en': 'medicines you',
      'hi': '',
      'ta': '',
    },
    'kwhf0u3f': {
      'en': 'intake!',
      'hi': '',
      'ta': '',
    },
    '3wasf6cx': {
      'en': '•',
      'hi': '',
      'ta': '',
    },
  },
  // profilePage
  {
    'ny5az425': {
      'en': '•',
      'hi': '',
      'ta': '',
    },
  },
  // editProfile
  {
    '53traxpl': {
      'en': 'Edit Profile',
      'hi': '',
      'ta': '',
    },
    'lggvkz3g': {
      'en': 'Change Photo',
      'hi': '',
      'ta': '',
    },
    'e3ufnh57': {
      'en': 'Your Name',
      'hi': '',
      'ta': '',
    },
    '2hx3ekjq': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '1ou5h74o': {
      'en': 'Email Address',
      'hi': '',
      'ta': '',
    },
    'wxe0u26e': {
      'en': 'Your email',
      'hi': '',
      'ta': '',
    },
    '9j6diapb': {
      'en': 'Your Age',
      'hi': '',
      'ta': '',
    },
    '6k3k2gkf': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'xyl15lmk': {
      'en': 'Your Birth Sex',
      'hi': '',
      'ta': '',
    },
    'yoo00614': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '1u5j0p6a': {
      'en': 'Profession',
      'hi': '',
      'ta': '',
    },
    '73bkvk4c': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'kir2bxqz': {
      'en': 'Save Changes',
      'hi': '',
      'ta': '',
    },
    'j9v07m4d': {
      'en': 'Home',
      'hi': '',
      'ta': '',
    },
  },
  // reminder
  {
    'iyyg5sfw': {
      'en': 'Medicine Reminders',
      'hi': '',
      'ta': '',
    },
    'xo4eunzp': {
      'en': 'Today\'s Reminders',
      'hi': '',
      'ta': '',
    },
    'zx24qaub': {
      'en': 'Medicine Name',
      'hi': '',
      'ta': '',
    },
    'sj0oibws': {
      'en': 'Time',
      'hi': '',
      'ta': '',
    },
    'rkg8n008': {
      'en': 'Medicine A',
      'hi': '',
      'ta': '',
    },
    'g6n0j40e': {
      'en': '9:00 AM',
      'hi': '',
      'ta': '',
    },
    'c0r3zvf7': {
      'en': 'Medicine B',
      'hi': '',
      'ta': '',
    },
    'mp5bp46q': {
      'en': '12:30 PM',
      'hi': '',
      'ta': '',
    },
    'h6fhe213': {
      'en': 'Medicine C',
      'hi': '',
      'ta': '',
    },
    '51p42u4q': {
      'en': '6:00 PM',
      'hi': '',
      'ta': '',
    },
    '45cin9dw': {
      'en': 'Create Reminder',
      'hi': '',
      'ta': '',
    },
    'fbty00q4': {
      'en': '•',
      'hi': '',
      'ta': '',
    },
  },
  // updateProfilePhoto
  {
    'mkismxs0': {
      'en': 'Choose Photo',
      'hi': '',
      'ta': '',
    },
    '7n5hspo9': {
      'en': 'Save',
      'hi': '',
      'ta': '',
    },
    'avw24w99': {
      'en': 'Cancel',
      'hi': '',
      'ta': '',
    },
  },
  // team
  {
    'h9j92ka0': {
      'en': 'Hamid Rizvi',
      'hi': '',
      'ta': '',
    },
    'yvnt1q1x': {
      'en': 'Application Developer',
      'hi': '',
      'ta': '',
    },
    'a4ck0tou': {
      'en': 'Aklanta Niraz Bhuyan',
      'hi': '',
      'ta': '',
    },
    'l9gcpk8q': {
      'en': 'Application Developer',
      'hi': '',
      'ta': '',
    },
    'h6b7pvdg': {
      'en': 'Rudra Pratap Singh',
      'hi': '',
      'ta': '',
    },
    'rc25yr5o': {
      'en': 'Application developer',
      'hi': '',
      'ta': '',
    },
    '14mlfmii': {
      'en': 'Vaibhavi Tandon',
      'hi': '',
      'ta': '',
    },
    'm6zn9ljk': {
      'en': 'UI/UX Designer',
      'hi': '',
      'ta': '',
    },
    '5b9v3pi4': {
      'en': 'Team Members',
      'hi': '',
      'ta': '',
    },
  },
  // contactus
  {
    'atksqj6v': {
      'en': 'Contact Us',
      'hi': '',
      'ta': '',
    },
    'h3jy0b8s': {
      'en': 'We\'re here to help!',
      'hi': '',
      'ta': '',
    },
    'hmqby69y': {
      'en': 'Email Us :  jagadeem1@srmist.edu.in',
      'hi': '',
      'ta': '',
    },
    'b4eegt3x': {
      'en': 'Call Us : +917449277556',
      'hi': '',
      'ta': '',
    },
    'reefn536': {
      'en': 'Contact Us',
      'hi': '',
      'ta': '',
    },
  },
  // about_us
  {
    'fslrjhj3': {
      'en': 'About us',
      'hi': '',
      'ta': '',
    },
    '6pt177vp': {
      'en':
          'Introducing Medic Food: Where Medication Meets Smart Nutrition\n\nDiscover a New Era of Health and Wellness\n\nAre you tired of wondering whether your food choices are impacting your medications? Look no further! Medic Food is here to revolutionize the way you approach your health and ensure your medication journey is as smooth as can be. Say goodbye to the guesswork and hello to informed decisions that keep you safe and thriving.\n\n\n\nUnveiling the Power of Food-Drug Interactions\n\nMedic Food is your ultimate guide to navigating the intricate relationship between what you eat and the medications you take. Delve into a vast database of medicines and drugs, empowering you with comprehensive information on potential food interactions. Say farewell to unexpected surprises and confidently make informed choices about your diet.\n\nStay Safe, Stay Informed 💡\n\nYour health and safety are our top priorities. Medic Food equips you with crucial insights into which foods to avoid while taking specific medications, minimizing the risk of adverse reactions. We provide detailed, up-to-date information from trusted medical references, ensuring you have the knowledge you need to take control of your well-being.\n\nYour Data, Your Privacy 🛡️\n\nWe take your privacy seriously. Rest assured that all data you input into Medic Food is handled with the utmost care and is fully encrypted. We comply with the most stringent security standards, keeping your personal information safe and confidential at all times.\n\nDownload Medic Food Now and Transform Your Medication Experience!\n\nDon\'t let food-drug interactions hold you back from living your best life. Empower yourself with the knowledge and tools to make informed decisions about your health. Join the Medic Food community today and experience the peace of mind that comes from knowing you have the power to optimize your well-being. Together, let\'s unlock a new world where medication meets smart nutrition!\n',
      'hi': '',
      'ta': '',
    },
  },
  // References
  {
    'yzqpmgx1': {
      'en': 'References',
      'hi': '',
      'ta': '',
    },
    'l51qm0dz': {
      'en':
          'US Food and Drug Administration. Avoid food-drug interactions: a guide from the National Consumers League and US Food and Drug Administration.\nIsmail MY, Yaheya M. Drug-food interactions and role of pharmacist. Asian journal of pharmaceutical and clinical research. 2009 Oct;2(4):1-0.\nFrankel EH, McCabe BJ, Wolfe JJ, editors. Handbook of Food-Drug Interactions. CRC Press; 2003.\nMcCabe-Sellers B, Frankel EH, Wolfe JJ. Pharmacy: Basic Concepts. InHandbook of Food-Drug Interactions 2003 Apr 29 (pp. 15-28). CRC Press.\nBoullata JI, Armenti VT, editors. Handbook of drug\'nutrient interactions. Springer Science & Business Media; 2004 Apr 17.\nBailey DG, Spence JD, Munoz C, Arnold JM. Interaction of citrus juices with felodipine and nifedipine. The Lancet. 1991 Feb 2;337(8736):268-9.\nCarol M. Bareuther, RD. Dangerous Food-Drug Interactions. Today’s Geriatric Medicine; 2008:1(4).\nChu SY, Park Y, Locke C, Wilson DS, Cavanaugh JC. Drug‐food interaction potential of clarithromycin, a new macrolide antimicrobial. The Journal of Clinical Pharmacology. 1992 Jan;32(1):32-6.\nCusinato DA, Martinez EZ, Cintra MT, Filgueira GC, Berretta AA, Lanchote VL, Coelho EB. Evaluation of potential herbal-drug interactions of a standardized propolis extract (EPP-AF®) using an in vivo cocktail approach. Journal of ethnopharmacology. 2019 Dec 5;245:112174.\nCelli GB, Liu Y, Dadmohammadi Y, Tiwari R, Raghupathi K, Mutilangi W, Abbaspourrad A. Instantaneous interaction of mucin with pectin-and carrageenan-coated nanoemulsions. Food chemistry. 2020 Mar 30;309:125795.\nJensen K, Ni Y, Panagiotou G, Kouskoumvekaki I. Developing a molecular roadmap of drug-food interactions. PLoS Comput Biol. 2015 Feb 10;11(2):e1004048.\nYamazaki A, Kumagai Y, Fujita T, Hasunuma T, Yokota S, Maeda M, Otani Y, Majima M. Different effects of light food on pharmacokinetics and pharmacodynamics of three benzodiazepines, quazepam, nitrazepam and diazepam. Journal of clinical pharmacy and therapeutics. 2007 Feb;32(1):31-9.\nHuang SM, Lesko LJ. Drug‐Drug, Drug—Dietary Supplement, and Drug—Citrus Fruit and Other Food Interactions: What Have We Learned?. The Journal of Clinical Pharmacology. 2004 Jun;44(6):559-69.\nBushra R, Aslam N, Khan AY. Food-drug interactions. Oman medical journal. 2011 Mar;26(2):77.\nBland SE, Vermeulen L. Drug-food interactions. Journal of the Pharmacy Society of Wisconsin. 1998 Nov:28-35.\nKearney BP, Sayre JR, Flaherty JF, Chen SS, Kaul S, Cheng AK. Drug‐drug and drug‐food interactions between tenofovir disoproxil fumarate and didanosine. The Journal of Clinical Pharmacology. 2005 Dec;45(12):1360-7.\nIsmail MY, Yaheya M. Drug-food interactions and role of pharmacist. Asian journal of pharmaceutical and clinical research. 2009 Oct;2(4):1-0.\nWelling PG. How food and fluid affect drug absorption: results of initial studies. Postgraduate Medicine. 1977 Jul 1;62(1):73-82.\nSchmidt LE, Dalhoff K. Food-drug interactions. Drugs. 2002 Jul 1;62(10):1481-502.\nMasuko K, Tohma S, Matsui T. Potential food‐drug interactions in patients with rheumatoid arthritis. International journal of rheumatic diseases. 2013 Apr;16(2):122-8.\nDahan A, Altman H. Food–drug interaction: grapefruit juice augments drug bioavailability—mechanism, extent and relevance. European journal of clinical nutrition. 2004 Jan;58(1):1-9.\nBailey DG. Fruit juice inhibition of uptake transport: a new type of food–drug interaction. British journal of clinical pharmacology. 2010 Nov;70(5):645-55.\nWerba JP, Misaka S, Giroli MG, Shimomura K, Amato M, Simonelli N, Vigo L, Tremoli E. Update of green tea interactions with cardiovascular drugs and putative mechanisms. journal of food and drug analysis. 2018 Apr 1;26(2):S72-7.\nSelf TH, Chrisman CR, Baciewicz AM, Bronze MS. Isoniazid drug and food interactions. The American journal of the medical sciences. 1999 May 1;317(5):304-11.\nAman SF, Hassan F, Naqvi BS, Hasan SM. Studies of food drug interactions. Pakistan journal of pharmaceutical sciences. 2010 Jul 1;23(3).\nSansone R, Ottaviani JI, Rodriguez-Mateos A, Heinen Y, Noske D, Spencer JP, Crozier A, Merx MW, Kelm M, Schroeter H, Heiss C. Methylxanthines enhance the effects of cocoa flavanols on cardiovascular function: randomized, double-masked controlled studies. The American journal of clinical nutrition. 2017 Feb 1;105(2):352-60.\nNongonierma AB, FitzGerald RJ. Dipeptidyl peptidase IV inhibitory properties of a whey protein hydrolysate: Influence of fractionation, stability to simulated gastrointestinal digestion and food–drug interaction. International Dairy Journal. 2013 Sep 1;32(1):33-9.\nHolbrook AM, Pereira JA, Labiris R, McDonald H, Douketis JD, Crowther M, Wells PS. Systematic overview of warfarin and its drug and food interactions. Archives of internal medicine. 2005 May 23;165(10):1095-106.\nIrish AB, Viecelli AK, Hawley CM, et al. Effect of Fish Oil Supplementation and Aspirin Use on Arteriovenous Fistula Failure in Patients Requiring Hemodialysis: A Randomized Clinical Trial. JAMA Intern Med. 2017;177(2):184–193. doi:10.1001/jamainternmed.2016.8029\nMouly S, Lloret-Linares C, Sellier PO, Sene D, Bergmann JF. Is the clinical relevance of drug-food and drug-herb interactions limited to grapefruit juice and Saint-John’s Wort?. Pharmacological research. 2017 Apr 1;118:82-92.\nJudith AL, Richard VH, Daylily SO, Gay J. Effects of short-term inhaled budesonide and beclomethasone dipropionate on serum osteocalcin in premenopausal women. Am. Rev. Respir. Dis. 1993;148:113.\nMasri KR, Peters T, Moore J. Fish Oil Associated Myopathy. Kansas Journal of Medicine. 2011 Nov 23;4(4):117-8.\nPohl O, Marchand L, Gotteland JP, Coates S, Täubel J, Lorch U. Coadministration of the prostaglandin F2α receptor antagonist preterm labour drug candidate OBE022 with magnesium sulfate, atosiban, nifedipine and betamethasone. British Journal of Clinical Pharmacology. 2019 Jul;85(7):1516-27.\nChidlow G, Melena J, Osborne NN. Betaxolol, a β1‐adrenoceptor antagonist, reduces Na+ influx into cortical synaptosomes by direct interaction with Na+ channels: comparison with other β‐adrenoceptor antagonists. British journal of pharmacology. 2000 Jun;130(4):759-66.\nFradet Y. Bicalutamide (Casodex®) in the treatment of prostate cancer. Expert review of anticancer therapy. 2004 Feb 1;4(1):37-48.\nYamreudeewong W, Henann NE, Fazio A, Lower DL, Cassidy TG. Drug-food interactions in clinical practice. Journal of Family Practice. 1995 Apr 1;40(4):376-85.\nWilliams, B., MacDonald, T.M., Morant, S., Webb, D.J., Sever, P., McInnes, G., Ford, I., Cruickshank, J.K., Caulfield, M.J., Salsbury, J. and Mackenzie, I., 2015. Spironolactone versus placebo, bisoprolol, and doxazosin to determine the optimal treatment for drug-resistant hypertension (PATHWAY-2): a randomised, double-blind, crossover trial. The Lancet, 386(10008), pp.2059-2068.\nShah JJ, Kuhn DJ, Orlowski RZ. Bortezomib and EGCG: no green tea for you?. Blood, The Journal of the American Society of Hematology. 2009 Jun 4;113(23):5695-6.\nKirsch P, Reuter M, Mier D, Lonsdorf T, Stark R, Gallhofer B, Vaitl D, Hennig J. Imaging gene–substance interactions: The effect of the DRD2 TaqIA polymorphism and the dopamine agonist bromocriptine on the brain activation during the anticipation of reward. Neuroscience letters. 2006 Sep 25;405(3):196-201.\nButtini F, Colombo P, Wenger MP, Mesquida P, Marriott C, Jones SA. Back to basics: The development of a simple, homogenous, two‐component dry‐powder inhaler formulation for the delivery of budesonide using miscible vinyl polymers. Journal of pharmaceutical sciences. 2008 Mar 1;97(3):1257-67.\nChandler P, Herxheimer A. Unexpected aggressive behaviour: interaction of bupropion and alcohol. International Journal of Risk & Safety in Medicine. 2011 Jan 1;23(3):133-7.\nLilja JJ, Kivistö KT, Backman JT, Lamberg TS, Neuvonen PJ. Grapefruit juice substantially increases plasma concentrations of buspirone. Clinical Pharmacology & Therapeutics. 1998 Dec;64(6):655-60.\nNomoto M, Nomura T, Nakatsuka A, Nagai M, Yabe Y. Pharmacokinetic study on the interaction between cabergoline and clarithromycin in healthy volunteers and patients with parkinson\'s disease. Clinical Pharmacology & Therapeutics. 2004 Feb;75(2):P79-.\nPápai K, Budai M, Ludányi K, Antal I, Klebovich I. In vitro food–drug interaction study: Which milk component has a decreasing effect on the bioavailability of ciprofloxacin?. Journal of pharmaceutical and biomedical analysis. 2010 May 1;52(1):37-42.\nKamalakkannan V, Puratchikody A, Ramanathan L. Development and characterization of controlled release polar lipid microparticles of candesartan cilexetil by solid dispersion. Research in pharmaceutical sciences. 2013 Apr;8(2):125.\nStefanelli B, Sellitto C, De Bellis E, Torsiello M, Bertini N, Pezzullo AM, Corbi G, Sabbatino F, Pepe S, Tesse A, Conti V. Concomitant Administration of Capecitabine and Folate Supplements: Need to Encourage Medication Reconciliation. Pharmaceuticals. 2022 Nov 10;15(11):1388.\nGarg SK, Kumar N, Bhargava VK, Prabhakar SK. Effect of grapefruit juice on carbamazepine bioavailability in patients with epilepsy. Clinical Pharmacology & Therapeutics. 1998 Sep;64(3):286-8. \nCampbell NR, Hasinoff BB. Iron supplements: a common cause of drug interactions. British journal of clinical pharmacology. 1991 Mar;31(3):251-5.\nOpie LH. Drug interactions of antihypertensive agents: SA Hypertension Society Supplement. South African Family Practice. 2012 Apr 1;54(2):23-5.\nMohammadsour F, Khezri M, Ghasemi A. Evaluation of various treatments on disinfestation of tomato seeds infected with Clavibacter michiganensis subsp. Michiganensis. Journal of Applied Research in Plant Protection. 2021 Mar 21;10(1):57-70.\nMOONEY MT, DEGUCHI S, TADA T, FUJIOKA M, OKAMOTO Y, YASUDA T. Interaction of cefdinir with iron in aqueous solution. Chemical and pharmaceutical bulletin. 1995 Mar 15;43(3):374-7.\nBuening MK, Wold JS. Ethanol-moxalactam interactions in vivo. Clinical Infectious Diseases. 1982 Nov 1;4(Supplement_3):S555-63.\nChan AW, Greizerstein HB, Strauss W. Alcohol-chlordiazepoxide interaction. Pharmacology Biochemistry and Behavior. 1982 Jul 1;17(1):141-5.\nMahmoud BM, Ali HM, Homeida MM, Bennett JL. Significant reduction in chloroquine bioavailablity following coadministration with the sudanese beverages aradaib, karkadi and lemon. Journal of Antimicrobial Chemotherapy. 1994 May 1;33(5):1005-9.\nDudkowski C, Karim A, Munsaka M. Effects of food intake on the pharmacokinetics of azilsartan medoxomil and chlorthalidone alone and in fixed‐dose combination in healthy adults. Clinical Pharmacology in Drug Development. 2016 Sep;5(5):393-8.\nTaniguchi K, Ohtani H, Ikemoto T, Miki A, Hori S, Sawada Y. Possible case of potentiation of the antiplatelet effect of cilostazol by grapefruit juice. Journal of clinical pharmacy and therapeutics. 2007 Oct;32(5):457-9.\nNeuvonen PJ, Kivistö KT, Lehto P. Interference of dairy products with the absorption of ciprofloxacin. Clinical Pharmacology & Therapeutics. 1991 Nov;50(5-1):498-502.\nCheng KL, Nafziger AN, Peloquin CA, Amsden GW. Effect of grapefruit juice on clarithromycin pharmacokinetics. Antimicrobial agents and chemotherapy. 1998 Apr 1;42(4):927-9.\nTaeuber K, Badian M, Brettel HF, Royen TH, Rupp W, Sittig W, Uihlein M. Kinetic and dynamic interaction of clobazam and alcohol. British Journal of Clinical Pharmacology. 1979;7(Suppl 1):91S.\nOesterheld J, Kallepalli BR. Grapefruit juice and clomipramine: shifting metabolitic ratios. Journal of clinical psychopharmacology. 1997 Feb 1;17(1):62-3.\nJacauna JS, Rodrigues Junior OM. Pharmacological care in drug interaction: clonazepam with alcohol.\nHolmberg MT, Tornio A, Neuvonen M, Neuvonen PJ, Backman JT, Niemi M. Grapefruit juice inhibits the metabolic activation of clopidogrel. Clinical Pharmacology & Therapeutics. 2014 Mar;95(3):307-13.\nEagles SK, Gross AS, McLachlan AJ. The Effects of Cruciferous Vegetable‐Enriched Diets on Drug Metabolism: A Systematic Review and Meta‐Analysis of Dietary Intervention Trials in Humans. Clinical Pharmacology & Therapeutics. 2020 Aug;108(2):212-27.\nAl-Harrasi A, Bhatia S, Behl T, Kaushik D, Mittal V, Sharma A. Antibacterial Interactions between EOs and Currently Employed Antibiotics. InRole of Essential Oils in the Management of COVID-19 2022 Mar 30 (pp. 211-226). CRC Press.\nAl-Harrasi A, Bhatia S, Behl T, Kaushik D, Mittal V, Sharma A. Antibacterial Interactions between EOs and Currently Employed Antibiotics. InRole of Essential Oils in the Management of COVID-19 2022 Mar 30 (pp. 211-226). CRC Press.\nGliozzi M, Malara N, Muscoli S, Mollace V. The treatment of hyperuricemia. International journal of cardiology. 2016 Jun 15;213:23-7.\nReynolds NA, Curran MP. Alendronate/colecalciferol. Treatments in Endocrinology. 2005 Dec;4:371-7.\nPfrunder A, Schiesser M, Gerber S, Haschke M, Bitzer J, Drewe J. Interaction of St John\'s wort with low‐dose oral contraceptive therapy: a randomized controlled trial. British journal of clinical pharmacology. 2003 Dec;56(6):683-90.\nDaveluy A, Raignoux C, Miremont-Salamé G, Girodet PO, Moore N, Haramburu F, Molimard M. Drug interactions between inhaled corticosteroids and enzymatic inhibitors. European journal of clinical pharmacology. 2009 Jul;65:743-5.\nWang Z, Gorski JC, Hamman MA, Huang SM, Lesko LJ, Hall SD. The effects of St John\'s wort (Hypericum perforatum) on human cytochrome P450 activity. Clinical Pharmacology & Therapeutics. 2001 Oct;70(4):317-26.\nVan Steveninck AL, Gieschke R, Schoemaker RC, Roncari G, Tuk B, Pieters MS, Breimer DD, Cohen AF. Pharmacokinetic and pharmacodynamic interactions of bretazenil and diazepam with alcohol. British journal of clinical pharmacology. 1996 Jun;41(6):565-73.\nMorris DJ. Adverse effects and drug interactions of clinical importance with antiviral drugs. Drug safety. 1994 Apr;10(4):281-91.\nSpiteri Staines S. Herbal medicines: adverse effects and drug-herb interactions.\nLee KJ, Park HJ, Shin YH, Lee CH. Effect of glycyrrhizic acid on protein binding of diltiazem, verapamil, and nifedipine. Archives of pharmacal research. 2004 Sep;27:978-83.\nBurns M, Moskowitz H. Effects of diphenhydramine and alcohol on skills performance. European journal of clinical pharmacology. 1980 Jul;17:259-66.\nBeach CA, Mays DC, Guiler RC, Jacober CH, Gerber N. Inhibition of elimination of caffeine by disulfiram in normal subjects and recovering alcoholics. Clinical Pharmacology & Therapeutics. 1986 Mar;39(3):265-70.\nSalcedo J, Kern MJ. Effects of caffeine and theophylline on coronary hyperemia induced by adenosine or dipyridamole. Catheterization and Cardiovascular Interventions. 2009 Oct 1;74(4):598-605.\nValenzuela B, Rebollo J, Pérez T, Brugarolas A, Pérez-Ruixo JJ. Effect of grapefruit juice on the pharmacokinetics of docetaxel in cancer patients: a case report. British journal of clinical pharmacology. 2011 Dec;72(6):978.\nCritchley P, Langdon N, Parkes JD, Quinn NP, Shindler JS, Marsden CD. Domperidone. British Medical Journal (Clinical research ed.). 1985 Mar 3;290(6470):788. \nKaufman PL. Marijuana and glaucoma. Archives of Ophthalmology. 1998 Nov 1;116(11):1512-3.\nKoski A, Vuori E, Ojanperä I. Newer antidepressants: evaluation of fatal toxicity index and interaction with alcohol based on Finnish postmortem data. International Journal of Legal Medicine. 2005 Nov;119:344-8.\nAhmed IS, Hassan MA, Kondo T. Effect of lyophilized grapefruit juice on P-glycoprotein-mediated drug transport in-vitro and in-vivo. Drug development and industrial pharmacy. 2015 Mar 4;41(3):375-81.\nMergenhagen KA, Wattengel BA, Skelly MK, Clark CM, Russo TA. Fact versus fiction: a review of the evidence behind alcohol and antibiotic interactions. Antimicrobial Agents and Chemotherapy. 2020 Feb 21;64(3):10-128.\nKnadler MP, Lobo E, Chappell J, Bergstrom R. Duloxetine: clinical pharmacokinetics and drug interactions. Clinical pharmacokinetics. 2011 May;50:281-94.\nKane GC, Lipsky JJ. Drug–grapefruit juice interactions. InMayo Clinic Proceedings 2000 Sep 1 (Vol. 75, No. 9, pp. 933-942). Elsevier.\nMcCance-Katz EF, Gruber VA, Beatty G, Lum PJ, Rainey PM. Interactions between alcohol and the antiretroviral medications ritonavir or efavirenz. Journal of addiction medicine. 2013 Jul;7(4):264.\nMojtahedin A. Study of anxiolytic effect of hydro-alcoholic leaf extract of Plantago major L. in rats and interaction with epinephrine: Role of Adrenergic system. Der Pharm. Lett. 2016;8:202-6.\nTonin G, Klen J. Eptifibatide, an Older Therapeutic Peptide with New Indications: From Clinical Pharmacology to Everyday Clinical Practice. International Journal of Molecular Sciences. 2023 Mar 13;24(6):5446.\nAusband SC. Ergotamine interaction. Reactions. 2002 Feb 23;890:23.\nCarpenter JS, Guthrie KA, Larson JC, Freeman EW, Joffe H, Reed SD, Ensrud KE, LaCroix AZ. Effect of escitalopram on hot flash interference: a randomized, controlled trial. Fertility and sterility. 2012 Jun 1;97(6):1399-404.\nSchubert W, Cullberg G, Edgar B, Hedner T. Inhibition of 17β-estradiol metabolism by grapefruit juice in ovariectomized women. Maturitas. 1994 Dec 1;20(2-3):155-63.\nBailey DG, Dresser G, Arnold JM. Grapefruit–medication interactions: Forbidden fruit or avoidable consequences?. Cmaj. 2013 Mar 5;185(4):309-16.\nArbex MA, Varella MD, Siqueira HR, Mello FA. Antituberculosis drugs: drug interactions, adverse effects, and use in special situations-part 1: first-line drugs. Jornal Brasileiro de Pneumologia. 2010;36:626-40.\nMurphy PA, Kern SE, Stanczyk FZ, Westhoff CL. Interaction of St. John\'s Wort with oral contraceptives: effects on the pharmacokinetics of norethindrone and ethinyl estradiol, ovarian activity and breakthrough bleeding. Contraception. 2005 Jun 1;71(6):402-8.\nMergenhagen KA, Wattengel BA, Skelly MK, Clark CM, Russo TA. Fact versus fiction: a review of the evidence behind alcohol and antibiotic interactions. Antimicrobial Agents and Chemotherapy. 2020 Feb 21;64(3):10-128.\nNielsen S, McAuley A. Etizolam: a rapid review on pharmacology, non‐medical use and harms. Drug and Alcohol Review. 2020 May;39(4):330-6.\nBailey DG. Fruit juice inhibition of uptake transport: a new type of food–drug interaction. British journal of clinical pharmacology. 2010 Nov;70(5):645-55.\nGugler R. H2-antagonists and alcohol: do they interact?. Drug safety. 1994 Apr;10(4):271-80.\nBailey DG, Dresser GK, Kreeft JH, Munoz C, Freeman DJ, Bend JR. Grapefruit‐felodipine interaction: effect of unprocessed fruit and probable active ingredients. Clinical Pharmacology & Therapeutics. 2000 Nov;68(5):468-77.\nMiller DB, Spence JD. Clinical pharmacokinetics of fibric acid derivatives (fibrates). Clinical pharmacokinetics. 1998 Feb;34:155-62.\nKharasch ED, Whittington D, Hoffer C. Influence of hepatic and intestinal cytochrome P4503A activity on the acute disposition and effects of oral transmucosal fentanyl citrate. The Journal of the American Society of Anesthesiologists. 2004 Sep 1;101(3):729-37.\nJavaid N, Haschke F, Pietschnig B, Schuster E, Huemer C, Shebaz A, Ganesh P, Steffan I, Hurrel R, Secretin MC. Interactions between infections, malnutrition and ironnutritional status in Pakistani infants a longitudinal study. Acta Paediatrica. 1991 Apr;80:141-50.\nBailey DG. Fruit juice inhibition of uptake transport: a new type of food–drug interaction. British journal of clinical pharmacology. 2010 Nov;70(5):645-55.\nSingh BN, Malhotra BK. Effects of food on the clinical pharmacokinetics of anticancer agents: underlying mechanisms and implications for oral chemotherapy. Clinical pharmacokinetics. 2004 Dec;43:1127-56.\nKumar S. Profile of diseases prevalent in a tribal locality in Jharkhand, India: A family medicine practitioner\'s perspective. Journal of Family Medicine and Primary Care. 2015 Jan;4(1):110.\nAlemdaroglu NC, Dietz U, Wolffram S, Spahn‐Langguth H, Langguth P. Influence of green and black tea on folic acid pharmacokinetics in healthy volunteers: potential risk of diminished folic acid bioavailability. Biopharmaceutics & drug disposition. 2008 Sep;29(6):335-48.\nAmbreen Z, Faran SA, Daniel A, Khalid SH, Khan IU, Asif M, Rehman A, Mehmood HQ, Asghar S. Physicochemical, rheological and antifungal evaluation of miconazole nitrate organogels for topical delivery. Pak. J. Pharm. Sci. 2022 Jul 1;35:1215-21.\nJansman FG, Jansen AJ, Coenen JL, de Graaf JC, Smit WM, Sleijfer DT, Brouwers JR. Assessing the clinical significance of drug interactions with fluorouracil in patients with colorectal cancer. American journal of health-system pharmacy. 2005 Sep 1;62(17):1788-93.\nSong YQ, Jin Q, Wang DD, Hou J, Zou LW, Ge GB. Carboxylesterase inhibitors from clinically available medicines and their impact on drug metabolism. Chemico-Biological Interactions. 2021 Aug 25;345:109566.\nVullioud P, Bshary R, Ros AF. Intra-and interspecific aggression do not modulate androgen levels in dusky gregories, yet male aggression is reduced by an androgen blocker. Hormones and behavior. 2013 Aug 1;64(3):430-8.\nPulkkinen V, Manson ML, Säfholm J, Adner M, Dahlén SE. The bitter taste receptor (TAS2R) agonists denatonium and chloroquine display distinct patterns of relaxation of the guinea pig trachea. American Journal of Physiology-Lung Cellular and Molecular Physiology. 2012 Dec 1;303(11):L956-66.\nde Roode DF, Vuorinen PJ, Bosveld AT. Effects of furazolidone, PCB77, PCB126, Aroclor 1248, paraquat and p, p′-DDE on transketolase activity in embryonal chicken brain. Toxicology. 2002 May 1;173(3):203-10.\nSaid HM, Ortiz A, Kumar CK, Chatterjee N, Dudeja PK, Rubin S. Transport of thiamine in human intestine: mechanism and regulation in intestinal epithelial cell model Caco-2. American Journal of Physiology-Cell Physiology. 1999 Oct 1;277(4):C645-51.\nFakih, M.G., Trump, D.L., Muindi, J.R., Black, J.D., Bernardi, R.J., Creaven, P.J., Schwartz, J., Brattain, M.G., Hutson, A., French, R. and Johnson, C.S., 2007. A phase I pharmacokinetic and pharmacodynamic study of intravenous calcitriol in combination with oral gefitinib in patients with advanced solid tumors. Clinical Cancer Research, 13(4), pp.1216-1223.\nSantos CA, Boullata JI. An approach to evaluating drug‐nutrient interactions. Pharmacotherapy: The Journal of Human Pharmacology and Drug Therapy. 2005 Dec;25(12):1789-800.\n',
      'hi': '',
      'ta': '',
    },
  },
  // profile1
  {
    'v5i0x9u6': {
      'en': 'Age: ',
      'hi': '',
      'ta': '',
    },
    '20jt4kzu': {
      'en': 'Your Account',
      'hi': '',
      'ta': '',
    },
    '4ppspg7k': {
      'en': 'Edit Profile',
      'hi': '',
      'ta': '',
    },
    '286dz0mn': {
      'en': 'App Settings',
      'hi': '',
      'ta': '',
    },
    'zphe64vr': {
      'en': 'Support',
      'hi': '',
      'ta': '',
    },
    'od90f3es': {
      'en': 'Terms of Service',
      'hi': '',
      'ta': '',
    },
    'qhj2m3jf': {
      'en': 'Log Out',
      'hi': '',
      'ta': '',
    },
  },
  // meddetails
  {
    '83snjkbt': {
      'en': 'When To Take:',
      'hi': '',
      'ta': '',
    },
    '847gbgmg': {
      'en': 'Interacting With:',
      'hi': '',
      'ta': '',
    },
    'mjdd64cp': {
      'en': 'Description:',
      'hi': '',
      'ta': '',
    },
    'fk1har31': {
      'en': 'Food To Avoid:',
      'hi': '',
      'ta': '',
    },
    'qzhekrdv': {
      'en': 'Food To Take:',
      'hi': '',
      'ta': '',
    },
    '7e27tnp0': {
      'en': 'Back',
      'hi': '',
      'ta': '',
    },
  },
  // Miscellaneous
  {
    'l5rlhqrc': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'e6a31hcv': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '38b677vn': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'dhu5vgwb': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'gzu10l0z': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '1wydoap2': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '950m8lbw': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'nk1i3y2x': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '91eotcan': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'bgo0j879': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '12263htx': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '4xt0yvep': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'tkziw1n9': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'j3euu6w1': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '6lwdjpko': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '9bh7podr': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'a66f6l9p': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '6nt5t7q7': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'sfe7jnoe': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'qavjs9el': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'ja6eycut': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'd7q6vjsb': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'cisypb1x': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    'e4wtlz7h': {
      'en': '',
      'hi': '',
      'ta': '',
    },
    '7ppm6cyy': {
      'en': '',
      'hi': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));
