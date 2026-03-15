class AppStrings {
  final String languageCode;
  AppStrings(this.languageCode);

  String _t(String en, String hi, String ml) {
    switch (languageCode) {
      case 'hi':
        return hi;
      case 'ml':
        return ml;
      default:
        return en;
    }
  }

  // ── Navigation tabs ───────────────────────────────────────────────────────
  String get tabIntakes => _t('Intakes', 'सेवन', 'ഉപഭോഗം');
  String get tabLevels => _t('Levels', 'स्तर', 'ലെവലുകൾ');
  String get tabSupplies => _t('Supplies', 'आपूर्ति', 'ശേഖരം');
  String get addAnItem =>
      _t('Add an item', 'एक आइटम जोड़ें', 'ഒരു ഇനം ചേർക്കുക');

  // ── Settings / Profile ────────────────────────────────────────────────────
  String get settings =>
      _t('Settings', 'सेटिंग्स', 'ക്രമീകരണങ്ങൾ');
  String get schedules =>
      _t('Schedules', 'अनुसूचियाँ', 'ഷെഡ്യൂളുകൾ');
  String get noSchedules =>
      _t('No schedules', 'कोई अनुसूची नहीं', 'ഷെഡ്യൂളുകൾ ഇല്ല');
  String schedulesCount(int n) =>
      _t('$n created', '$n बनाई गई', '$n ചേർത്തു');
  String get notifications =>
      _t('Notifications', 'सूचनाएं', 'അറിയിപ്പുകൾ');
  String notificationsEnabledAt(String time) =>
      _t('Enabled at $time', '$time पर सक्षम', '$time-ൽ പ്രവർത്തനക്ഷം');
  String get notificationsDisabled =>
      _t('Disabled', 'अक्षम', 'പ്രവർത്തനരഹിതം');

  // ── Languages ─────────────────────────────────────────────────────────────
  String get languages => _t('Languages', 'भाषाएं', 'ഭാഷകൾ');
  String get currentLanguageName {
    switch (languageCode) {
      case 'hi':
        return 'हिंदी';
      case 'ml':
        return 'മലയാളം';
      default:
        return 'English';
    }
  }

  String get english => _t('English', 'अंग्रेज़ी', 'ഇംഗ്ലീഷ്');
  String get hindi => _t('Hindi', 'हिंदी', 'ഹിന്ദി');
  String get malayalam => _t('Malayalam', 'मलयालम', 'മലയാളം');

  // ── Home page ─────────────────────────────────────────────────────────────
  String get startByAddingSchedule => _t(
        'Start by adding a schedule in Settings',
        'सेटिंग्स में एक अनुसूची जोड़कर शुरू करें',
        'ക്രമീകരണങ്ങളിൽ ഒരു ഷെഡ്യൂൾ ചേർത്ത് ആരംഭിക്കുക',
      );
  String get today => _t('Today', 'आज', 'ഇന്ന്');
  String get upcoming => _t('Upcoming', 'आगामी', 'വരാനിരിക്കുന്നത്');
  String get allDone => _t('All done !', 'सब हो गया !', 'എല്ലാം പൂർത്തിയായി !');
  String get noIntakesToday =>
      _t('No intakes due today', 'आज कोई खुराक नहीं', 'ഇന്ന് ഉപഭോഗം ഇല്ല');

  // ── Intake tile ───────────────────────────────────────────────────────────
  String get taken => _t('taken', 'लिया गया', 'കഴിച്ചു');
  String daysAgo(int n) =>
      _t('$n days ago', '$n दिन पहले', '$n ദിവസം മുൻപ്');
  String inDays(int n) =>
      _t('in $n days', '$n दिन में', '$n ദിവസത്തിൽ');
  String get neverTakenYet =>
      _t('Never taken yet', 'अभी तक नहीं लिया गया', 'ഇതുവരെ കഴിച്ചിട്ടില്ല');
  String lastTakenDaysAgo(int n, String date) => _t(
        'Last taken $n days ago ($date)',
        'आखरी बार $n दिन पहले ($date) लिया',
        'അവസാനം $n ദിവസം മുൻപ് ($date) കഴിച്ചു',
      );
  String get side => _t('side', 'तरफ', 'ഭാഗം');
  String get leftSide => _t('Left', 'बायाँ', 'ഇടത്ത്');
  String get rightSide => _t('Right', 'दायाँ', 'വലത്ത്');
  String injectionSideName(String enumName) {
    switch (enumName) {
      case 'left':
        return leftSide;
      case 'right':
        return rightSide;
      default:
        return enumName[0].toUpperCase() + enumName.substring(1);
    }
  }

  // ── Take medication page ──────────────────────────────────────────────────
  String get takeIntake =>
      _t('Take intake', 'खुराक लें', 'ഉപഭോഗം ചെയ്യുക');
  String get date => _t('Date', 'दिनांक', 'തീയതി');
  String get amount => _t('Amount', 'मात्रा', 'അളവ്');
  String get none => _t('None', 'कोई नहीं', 'ഒന്നുമില്ല');
  String get supplyItem =>
      _t('Supply item', 'आपूर्ति वस्तु', 'ശേഖര ഇനം');
  String get injectionSideLabel =>
      _t('Injection side', 'इंजेक्शन की तरफ', 'കുത്തിവയ്പ്പ് ഭാഗം');

  // ── Schedules page ────────────────────────────────────────────────────────
  String get addScheduleToGetStarted => _t(
        'Add a schedule to get started.',
        'शुरू करने के लिए एक अनुसूची जोड़ें।',
        'ആരംഭിക്കാൻ ഒരു ഷെഡ്യൂൾ ചേർക്കുക.',
      );
  String get addASchedule =>
      _t('Add a schedule', 'अनुसूची जोड़ें', 'ഷെഡ്യൂൾ ചേർക്കുക');

  // ── Notifications page ────────────────────────────────────────────────────
  String get notificationsAreDisabled => _t(
        'Notifications are disabled',
        'सूचनाएं अक्षम हैं',
        'അറിയിപ്പുകൾ പ്രവർത്തനരഹിതമാണ്',
      );
  String get clickToOpenSettings => _t(
        'Click to open settings',
        'सेटिंग्स खोलने के लिए क्लिक करें',
        'ക്രമീകരണങ്ങൾ തുറക്കാൻ ക്ലിക്ക് ചെയ്യുക',
      );
  String get enableNotifications => _t(
        'Enable notifications',
        'सूचनाएं सक्षम करें',
        'അറിയിപ്പുകൾ പ്രവർത്തനക്ഷമാക്കുക',
      );
  String get notificationTime =>
      _t('Notification time', 'सूचना समय', 'അറിയിപ്പ് സമയം');

  // ── Schedule form ─────────────────────────────────────────────────────────
  String get newSchedule =>
      _t('New schedule', 'नई अनुसूची', 'പുതിയ ഷെഡ്യൂൾ');
  String get editSchedule =>
      _t('Edit schedule', 'अनुसूची संपादित करें', 'ഷെഡ്യൂൾ തിരുത്തുക');
  String get add => _t('Add', 'जोड़ें', 'ചേർക്കുക');
  String get save => _t('Save', 'सहेजें', 'സംരക്ഷിക്കുക');
  String get name => _t('Name', 'नाम', 'പേര്');
  String get molecule => _t('Molecule', 'अणु', 'മോളിക്യൂൾ');
  String get administrationRoute =>
      _t('Administration route', 'प्रशासन मार्ग', 'നൽകൽ മാർഗ്ഗം');
  String get ester => _t('Ester', 'एस्टर', 'എസ്റ്റർ');
  String get every => _t('Every', 'हर', 'എല്ലാ');
  String get days => _t('days', 'दिन', 'ദിവസം');
  String get startDate =>
      _t('Start date', 'प्रारंभ दिनांक', 'ആരംഭ തീയതി');

  // ── Chart page ────────────────────────────────────────────────────────────
  String get chartEmptyMessage => _t(
        'Estradiol injections will display in this tab',
        'एस्ट्राडियोल इंजेक्शन इस टैब में दिखाई देंगे',
        'ഈ ടാബിൽ എസ്ട്രഡിയോൾ ഇൻജക്ഷനുകൾ കാണിക്കും',
      );

  // ── Intakes page ──────────────────────────────────────────────────────────
  String get intakesEmptyMessage => _t(
        'Taken intakes will appear here',
        'ली गई खुराकें यहां दिखाई देंगी',
        'കഴിച്ച ഉപഭോഗങ്ങൾ ഇവിടെ കാണിക്കും',
      );

  // ── Pharmacy page ─────────────────────────────────────────────────────────
  String get noSuppliesMessage => _t(
        'No supplies. Add an item to get started!',
        'कोई आपूर्ति नहीं। शुरू करने के लिए एक आइटम जोड़ें!',
        'ശേഖരം ഇല്ല. ആരംഭിക്കാൻ ഒരു ഇനം ചേർക്കുക!',
      );

  // ── Supply item card ──────────────────────────────────────────────────────
  String get remaining => _t('remaining', 'शेष', 'ബാക്കി');

  // ── Item form ─────────────────────────────────────────────────────────────
  String get newItem => _t('New item', 'नई वस्तु', 'പുതിയ ഇനം');
  String get editItem =>
      _t('Edit item', 'वस्तु संपादित करें', 'ഇനം തിരുത്തുക');
  String get totalAmount => _t('Total amount', 'कुल मात्रा', 'ആകെ അളവ്');
  String get usedAmount =>
      _t('Used amount', 'उपयोग की गई मात्रा', 'ഉപയോഗിച്ച അളവ്');
  String get concentration => _t('Concentration', 'सांद्रता', 'ഗാഢത');

  // ── Dialogs ───────────────────────────────────────────────────────────────
  String get deleteThisElement => _t(
        'Delete this element?',
        'इस तत्व को हटाएं?',
        'ഈ ഇനം ഇല്ലാതാക്കണോ?',
      );
  String get actionCannotBeUndone => _t(
        'This action cannot be undone.',
        'यह क्रिया पूर्ववत नहीं की जा सकती।',
        'ഈ പ്രവർത്തനം തിരിച്ചെടുക്കാൻ കഴിയില്ല.',
      );
  String get cancel => _t('Cancel', 'रद्द करें', 'റദ്ദ് ചെയ്യുക');
  String get delete => _t('Delete', 'हटाएं', 'ഇല്ലാതാക്കുക');
}
