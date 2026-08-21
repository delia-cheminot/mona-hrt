///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsFr extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsFr(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.fr,
              overrides: overrides ?? {},
              cardinalResolver: cardinalResolver,
              ordinalResolver: ordinalResolver,
            ),
        super(
            cardinalResolver: cardinalResolver,
            ordinalResolver: ordinalResolver) {
    super.$meta.setFlatMapFunction(
        $meta.getTranslation); // copy base translations to super.$meta
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <fr>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsFr _root = this; // ignore: unused_field

  @override
  TranslationsFr $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsFr(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Prises';
  @override
  String get nav_levels => 'Taux';
  @override
  String get nav_supplies => 'Pharmacie';
  @override
  String get takeAnIntake => 'Prendre une prise';
  @override
  String get addAnItem => 'Ajouter un élément';
  @override
  String get empty_home =>
      'Commencez par ajouter un planning dans les paramètres';
  @override
  String get allDone => 'Terminé !';
  @override
  String get noIntakesDue => 'Aucune prise prévue aujourd\'hui';
  @override
  String get upcoming => 'À venir';
  @override
  String get asNeeded => 'Au besoin';
  @override
  String get taken => 'Pris';
  @override
  String get yesterday => 'hier';
  @override
  String get tomorrow => 'demain';
  @override
  String get lastTaken => 'Dernière prise';
  @override
  String get neverTakenYet => 'Jamais pris auparavant';
  @override
  String get scheduleFrequencyDaily => 'Quotidien';
  @override
  String get scheduleFrequencyDailyDescription =>
      'Tous les jours, à des heures précises';
  @override
  String get scheduleFrequencyInterval => 'Intervalle';
  @override
  String get scheduleFrequencyIntervalDescription => 'Tous les quelques jours';
  @override
  String get scheduleFrequencyWeekly => 'Hebdomadaire';
  @override
  String get scheduleFrequencyWeeklyDescription =>
      'Certains jours de la semaine';
  @override
  String get scheduleFrequencyMonthly => 'Mensuel';
  @override
  String get scheduleFrequencyMonthlyDescription => 'Le même jour chaque mois';
  @override
  String get scheduleFrequencyAsNeeded => 'Au besoin';
  @override
  String get scheduleFrequencyAsNeededDescription => 'Pas de programme fixe';
  @override
  String get newUpdateAvailable => 'Une nouvelle mise à jour est disponible !';
  @override
  String get goToSettings => 'Aller aux paramètres';
  @override
  String get settingsTitle => 'Paramètres';
  @override
  String get notifications => 'Notifications';
  @override
  String get schedulesAndNotifications => 'Plannings et notifications';
  @override
  String get general => 'Général';
  @override
  String get schedules => 'Plannings';
  @override
  String get noSchedules => 'Aucun planning';
  @override
  String get language => 'Langue';
  @override
  String get languageFollowDevice => 'Suivre la langue de l’appareil';
  @override
  String get selectLanguage => 'Sélectionner la langue';
  @override
  String get enableNotifications => 'Activer les notifications';
  @override
  String get enableNotificationsDescription => 'Envoyer des rappels';
  @override
  String get anchorToLastIntake => 'Recalculer à chaque prise';
  @override
  String get anchorToLastIntakeDescription =>
      'Programme la prochaine prise un intervalle après votre dernière prise';
  @override
  String get notificationsDisabledTitle => 'Les notifications sont désactivées';
  @override
  String get clickToOpenSettings => 'Cliquez pour ouvrir les paramètres';
  @override
  String get exactRemindersDisabled =>
      'Les heures de rappel exactes sont désactivées';
  @override
  String get remindersDelayed =>
      'Les rappels peuvent être légèrement retardés. Appuyez pour ouvrir les paramètres.';
  @override
  String get medicalSettings => 'Paramètres médicaux';
  @override
  String get theme => 'Thème';
  @override
  String get themeCustomizeColors =>
      'Personnaliser les couleurs de l\'application';
  @override
  String get customThemeEnabled => 'Thème personnalisé';
  @override
  String get themeGenerate => 'Générer';
  @override
  String get themeVariant => 'Variante';
  @override
  String get themeContrast => 'Contraste';
  @override
  String get themeContrastStandard => 'Standard';
  @override
  String get themeContrastMedium => 'Moyen';
  @override
  String get themeContrastHigh => 'Élevé';
  @override
  String get autoUpdate => 'Mise à jour automatique';
  @override
  String get autoUpdateDescription =>
      'Vérifier automatiquement les nouvelles mises à jour au lancement de l\'application';
  @override
  String get checkForUpdates => 'Vérifier les mises à jour';
  @override
  String get checkForUpdatesDescription =>
      'Vérifier manuellement la dernière version\nCela vous connectera à Internet\n(Aucune donnée ne sera envoyée)';
  @override
  String appVersion({required Object version}) => 'Mona version ${version}';
  @override
  String backupSavedTo({required Object path}) =>
      'Sauvegarde enregistrée dans : ${path}';
  @override
  String exportFailed({required Object error}) =>
      'Échec de l\'exportation : ${error}';
  @override
  String get importDataTitle => 'Importer des données';
  @override
  String get importDataSubtitle =>
      'Restaurer les données depuis une sauvegarde JSON';
  @override
  String get importDataOverwriteWarning =>
      'Cela remplacera toutes vos données actuelles par la sauvegarde. Cette action est irréversible. Voulez-vous continuer ?';
  @override
  String get importConfirm => 'Importer';
  @override
  String get importSuccessfulTitle => 'Import réussi';
  @override
  String get importRestartRequired =>
      'Veuillez redémarrer l\'application pour appliquer les données restaurées.';
  @override
  String get closeApp => 'Fermer l\'application';
  @override
  String importFailed({required Object error}) =>
      'Échec de l\'importation : ${error}';
  @override
  String get updates => 'Mises à jour';
  @override
  String get dataManagement => 'Gestion des données';
  @override
  String get exportDataTitle => 'Exporter les données';
  @override
  String get exportDataSubtitle =>
      'Enregistrer vos données dans un fichier JSON';
  @override
  String get units => 'Unités';
  @override
  String get updateNoCompatibleApk =>
      'Aucune mise à jour compatible avec votre appareil.';
  @override
  String get updateAppUpToDate => 'Votre application est à jour !';
  @override
  String get updateCheckNetworkError =>
      'Impossible de vérifier les mises à jour pour le moment.';
  @override
  String get updateDialogTitle => 'Mise à jour disponible';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'La version ${latest} est disponible ! (Actuelle : ${current})\n\nUne mise à jour compatible avec votre appareil est prête à être installée.';
  @override
  String get updateDownloadAndInstall => 'Télécharger et installer';
  @override
  String get updateInstallPermissionRequired =>
      'Une autorisation est requise pour installer les mises à jour.';
  @override
  String get updateDownloadingTitle => 'Téléchargement de la mise à jour...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Échec de l\'ouverture de l\'installateur : ${message}';
  @override
  String get updateDownloadFailed =>
      'Échec du téléchargement. Vérifiez votre connexion.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Il est temps de prendre ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Prévu pour le ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Prévu pour ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Prévu pour ${weekday}';
  @override
  String get addSchedule => 'Ajouter un planning';
  @override
  String get addScheduleToGetStarted => 'Ajoutez un planning pour commencer.';
  @override
  String get newSchedule => 'Nouveau planning';
  @override
  String get every => 'Tous les';
  @override
  String get days => 'jours';
  @override
  String get dayOfMonth => 'Jour du mois';
  @override
  String get months => 'mois';
  @override
  String get startDate => 'Date de début';
  @override
  String get pickATime => 'Choisir une heure';
  @override
  String get addIntakeTime => 'Ajouter une heure';
  @override
  String get editScheduleInfo => 'Modifier les informations du planning';
  @override
  String get scheduling => 'Programme';
  @override
  String get editSchedule => 'Modifier le planning';
  @override
  String deleteSchedule({required Object name}) => 'Supprimer ${name} ?';
  @override
  String get addNotification => 'Ajouter une notification';
  @override
  String get empty_intakes => 'Les prises enregistrées apparaîtront ici';
  @override
  String get HrtCounter => 'Temps sous THS';
  @override
  String get HrtCounterDescription =>
      'Affiche depuis combien de temps vous êtes sous THS et votre nombre total de prises';
  @override
  String get hrtWidgetPlaceholder =>
      'Ouvrir Mona pour enregistrer votre première prise';
  @override
  String get hrtWidgetPreviewSample => 'Sous THS depuis 8 mois';
  @override
  String get hrtWidgetPreviewIntakeSample => '16 prises enregistrées';
  @override
  String get startOfDay => 'Début de la journée';
  @override
  String startOfDayDescription({required Object time}) =>
      'Les heures avant ${time} comptent pour la veille';
  @override
  String get chooseSchedule => 'Choisir un planning';
  @override
  String get addSchedulesFirst => 'Ajoutez d\'abord des plannings.';
  @override
  String get editIntake => 'Modifier la prise';
  @override
  String get date => 'Date';
  @override
  String get amount => 'Quantité';
  @override
  String get takenAmount => 'Quantité prise';
  @override
  String get wastedAmount => 'Quantité perdue';
  @override
  String get none => 'Aucun';
  @override
  String get supplyItem => 'Consommable';
  @override
  String get chooseItem => 'Choisir un consommable';
  @override
  String get noItemsToAdd => 'Aucun élément disponible';
  @override
  String get injectionSide => 'Côté';
  @override
  String get deleteIntake => 'Supprimer cette prise ?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Prendre ${scheduleName}';
  @override
  String get takeIntake => 'Prendre';
  @override
  String get intakeRecorded => 'Prise enregistrée';
  @override
  String get needleDeadSpace => 'Espace mort de l\'aiguille';
  @override
  String get notes => 'Notes';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get empty_levels =>
      'Ajoutez une prise de sang ou enregistrez une injection d’estradiol pour commencer';
  @override
  String get bloodTestsTitle => 'Prises de sang';
  @override
  String get estradiolLevelsTitle => 'Taux d\'estradiol';
  @override
  String get empty_blood_tests =>
      'Les prises de sang enregistrées s’afficheront ici. Commencez avec le bouton Ajouter !';
  @override
  String get addBloodTest => 'Ajouter une analyse de sang';
  @override
  String get editBloodTest => 'Modifier la prise de sang';
  @override
  String get newBloodTest => 'Nouvelle prise de sang';
  @override
  String get deleteBloodTest => 'Supprimer cette prise de sang ?';
  @override
  String get estradiolLevelLabel => 'Taux d\'estradiol';
  @override
  String get testosteroneLevelLabel => 'Taux de testostérone';
  @override
  String get bloodTestDateLabel => 'Date de la prise';
  @override
  String chartNowConcentration({required Object value}) =>
      'Maintenant ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date} : ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date} : ${level}';
  @override
  String get empty_supplies =>
      'Aucun consommable. Ajoutez un élément pour commencer.';
  @override
  String get newItem => 'Nouvel élément';
  @override
  String get adminRoute => 'Voie d\'administration';
  @override
  String get totalAmount => 'Quantité totale';
  @override
  String get concentration => 'Concentration';
  @override
  String concentrationLabelPerUnit({required Object unit}) =>
      'Dose par ${unit}';
  @override
  String get editItem => 'Modifier l\'élément';
  @override
  String get usedAmount => 'Quantité utilisée';
  @override
  String deleteItem({required Object name}) => 'Supprimer ${name} ?';
  @override
  String get allItemsFilter => 'Tout';
  @override
  String get medicationItemsFilter => 'Médicaments';
  @override
  String get genericItems => 'Matériel';
  @override
  String get medicationItemType => 'Médicament';
  @override
  String get genericItemType => 'Matériel';
  @override
  String get supplyType => 'Type';
  @override
  String get syringe => 'Seringues';
  @override
  String get wipe => 'Lingettes';
  @override
  String get needle => 'Aiguilles';
  @override
  String get gloves => 'Gants';
  @override
  String get bandage => 'Pansements';
  @override
  String get add => 'Ajouter';
  @override
  String get save => 'Enregistrer';
  @override
  String get cancel => 'Annuler';
  @override
  String get next => 'Suivant';
  @override
  String get delete => 'Supprimer';
  @override
  String get deleteElement => 'Supprimer cet élément ?';
  @override
  String get irreversibleAction => 'Cette action est irréversible.';
  @override
  String get name => 'Nom';
  @override
  String get molecule => 'Molécule';
  @override
  String get ester => 'Ester';
  @override
  String get estradiol => 'Œstradiol';
  @override
  String get progesterone => 'Progestérone';
  @override
  String get testosterone => 'Testostérone';
  @override
  String get nandrolone => 'Nandrolone';
  @override
  String get dihydrotestosterone => 'Dihydrotestostérone';
  @override
  String get spironolactone => 'Spironolactone';
  @override
  String get cyproteroneAcetate => 'Acétate de cyprotérone';
  @override
  String get leuprorelinAcetate => 'Acétate de leuproréline';
  @override
  String get bicalutamide => 'Bicalutamide';
  @override
  String get decapeptyl => 'Décapéptyl';
  @override
  String get raloxifene => 'Raloxifène';
  @override
  String get tamoxifen => 'Tamoxifène';
  @override
  String get finasteride => 'Finastéride';
  @override
  String get dutasteride => 'Dutastéride';
  @override
  String get minoxidil => 'Minoxidil';
  @override
  String get pioglitazone => 'Pioglitazone';
  @override
  String get enanthate => 'Énanthate';
  @override
  String get valerate => 'Valérate';
  @override
  String get cypionate => 'Cypionate';
  @override
  String get undecylate => 'Undécylate';
  @override
  String get benzoate => 'Benzoate';
  @override
  String get cypionateSuspension => 'Suspension de cypionate';
  @override
  String get medicationEstradiolEnanthate => 'Énanthate d\'œstradiol';
  @override
  String get medicationEstradiolValerate => 'Valérate d\'œstradiol';
  @override
  String get medicationEstradiolCypionate => 'Cypionate d\'œstradiol';
  @override
  String get medicationEstradiolUndecylate => 'Undécylate d\'œstradiol';
  @override
  String get medicationEstradiolBenzoate => 'Benzoate d\'œstradiol';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Suspension de cypionate d\'œstradiol';
  @override
  String get medicationTestosteroneEnanthate => 'Énanthate de testostérone';
  @override
  String get medicationTestosteroneValerate => 'Valérate de testostérone';
  @override
  String get medicationTestosteroneCypionate => 'Cypionate de testostérone';
  @override
  String get medicationTestosteroneUndecylate => 'Undécylate de testostérone';
  @override
  String get medicationTestosteroneBenzoate => 'Benzoate de testostérone';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Suspension de cypionate de testostérone';
  @override
  String get injection => 'Injection';
  @override
  String get oral => 'Oral';
  @override
  String get sublingual => 'Sublingual';
  @override
  String get patch => 'Patch';
  @override
  String get gel => 'Gel';
  @override
  String get implant => 'Implant';
  @override
  String get suppository => 'Suppositoire';
  @override
  String get transdermalSpray => 'Spray transdermique';
  @override
  String get transdermalDrops => 'Gouttes transdermiques';
  @override
  String get unitMilligram => 'mg';
  @override
  String get unitPgPerMl => 'pg/mL';
  @override
  String get unitPmolPerL => 'pmol/L';
  @override
  String get unitNgPerDl => 'ng/dL';
  @override
  String get unitNmolPerL => 'nmol/L';
  @override
  String get unitNgPerMl => 'ng/mL';
  @override
  String get injectionSideLeft => 'Gauche';
  @override
  String get injectionSideRight => 'Droite';
  @override
  String get placementLeft => 'Côté gauche';
  @override
  String get placementRight => 'Côté droit';
  @override
  String get placementLeftThigh => 'Cuisse gauche';
  @override
  String get placementRightThigh => 'Cuisse droite';
  @override
  String get placementLeftArm => 'Bras gauche';
  @override
  String get placementRightArm => 'Bras droit';
  @override
  String get placementLeftButtock => 'Fesse gauche';
  @override
  String get placementRightButtock => 'Fesse droite';
  @override
  String get placementLeftAbdomen => 'Abdomen (gauche)';
  @override
  String get placementRightAbdomen => 'Abdomen (droite)';
  @override
  String get injectionSites => 'Sites d\'injection';
  @override
  String get injectionSitesDescription => 'Gérez votre rotation de sites';
  @override
  String get addInjectionSite => 'Ajouter un site';
  @override
  String get customSiteLabel => 'Nom de site personnalisé';
  @override
  String get noInjectionSitesYet => 'Aucun site';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Ajoutez un site ci-dessous pour commencer.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Suggérer par planning';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Base la suggestion du site suivant sur ce planning uniquement.';
  @override
  String get requiredField => 'Champ obligatoire';
  @override
  String get mustBePositiveNumber => 'Doit être un nombre positif';
  @override
  String get mustBeBetween1And28 => 'Doit être entre 1 et 28';
  @override
  String get invalidTotalAmount => 'Montant total invalide';
  @override
  String get cannotExceedTotalCapacity =>
      'Ne peut pas dépasser la capacité totale';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'il y a ${count} jour',
        many: 'il y a ${count} de jours',
        other: 'il y a ${count} jours',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'dans ${count} jour',
        many: 'dans ${count} de jours',
        other: 'dans ${count} jours',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'Tous les jours',
        many: 'Tous les ${count} de jours',
        other: 'Tous les ${count} jours',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'Le ${day} de chaque mois',
        many: 'Le ${day}, tous les ${count} de mois',
        other: 'Le ${day}, tous les ${count} mois',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '${count} créé',
        many: '${count} créés',
        other: '${count} créés',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '1 jour sous THS',
        many: '${count} de jours sous THS',
        other: '${count} jours sous THS',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '1 semaine sous THS',
        many: '${count} de semaines sous THS',
        other: '${count} semaines sous THS',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '1 mois sous THS',
        many: '${count} de mois sous THS',
        other: '${count} mois sous THS',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '1 an sous THS',
        many: '${count} d\'années sous THS',
        other: '${count} ans sous THS',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '1 prise enregistrée',
        many: '${count} de prises enregistrées',
        other: '${count} prises enregistrées',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'Reste ${count} ${unit}',
        many: 'Reste ${count} de ${unit}',
        other: 'Reste ${count} ${unit}',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '${count} seringue restante',
        many: '${count} de seringues restantes',
        other: '${count} seringues restantes',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '${count} lingette restante',
        many: '${count} de lingettes restantes',
        other: '${count} lingettes restantes',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '${count} aiguille restante',
        many: '${count} d\'aiguilles restantes',
        other: '${count} aiguilles restantes',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '${count} gant restant',
        many: '${count} de gants restants',
        other: '${count} gants restants',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: '${count} pansement restant',
        many: '${count} de pansements restants',
        other: '${count} pansements restants',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'ml',
        many: 'de ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'comprimé',
        many: 'de comprimés',
        other: 'comprimés',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'patch',
        many: 'de patchs',
        other: 'patchs',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'pression',
        many: 'de pressions',
        other: 'pressions',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'implant',
        many: 'd\'implants',
        other: 'implants',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'suppositoire',
        many: 'de suppositoires',
        other: 'suppositoires',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
        count,
        one: 'pulvérisation',
        many: 'de pulvérisations',
        other: 'pulvérisations',
      );
}

/// The flat map containing all translations for locale <fr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsFr {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Prises',
      'nav_levels' => 'Taux',
      'nav_supplies' => 'Pharmacie',
      'takeAnIntake' => 'Prendre une prise',
      'addAnItem' => 'Ajouter un élément',
      'empty_home' => 'Commencez par ajouter un planning dans les paramètres',
      'allDone' => 'Terminé !',
      'noIntakesDue' => 'Aucune prise prévue aujourd\'hui',
      'upcoming' => 'À venir',
      'asNeeded' => 'Au besoin',
      'taken' => 'Pris',
      'yesterday' => 'hier',
      'tomorrow' => 'demain',
      'lastTaken' => 'Dernière prise',
      'neverTakenYet' => 'Jamais pris auparavant',
      'scheduleFrequencyDaily' => 'Quotidien',
      'scheduleFrequencyDailyDescription' =>
        'Tous les jours, à des heures précises',
      'scheduleFrequencyInterval' => 'Intervalle',
      'scheduleFrequencyIntervalDescription' => 'Tous les quelques jours',
      'scheduleFrequencyWeekly' => 'Hebdomadaire',
      'scheduleFrequencyWeeklyDescription' => 'Certains jours de la semaine',
      'scheduleFrequencyMonthly' => 'Mensuel',
      'scheduleFrequencyMonthlyDescription' => 'Le même jour chaque mois',
      'scheduleFrequencyAsNeeded' => 'Au besoin',
      'scheduleFrequencyAsNeededDescription' => 'Pas de programme fixe',
      'newUpdateAvailable' => 'Une nouvelle mise à jour est disponible !',
      'goToSettings' => 'Aller aux paramètres',
      'settingsTitle' => 'Paramètres',
      'notifications' => 'Notifications',
      'schedulesAndNotifications' => 'Plannings et notifications',
      'general' => 'Général',
      'schedules' => 'Plannings',
      'noSchedules' => 'Aucun planning',
      'language' => 'Langue',
      'languageFollowDevice' => 'Suivre la langue de l’appareil',
      'selectLanguage' => 'Sélectionner la langue',
      'enableNotifications' => 'Activer les notifications',
      'enableNotificationsDescription' => 'Envoyer des rappels',
      'anchorToLastIntake' => 'Recalculer à chaque prise',
      'anchorToLastIntakeDescription' =>
        'Programme la prochaine prise un intervalle après votre dernière prise',
      'notificationsDisabledTitle' => 'Les notifications sont désactivées',
      'clickToOpenSettings' => 'Cliquez pour ouvrir les paramètres',
      'exactRemindersDisabled' =>
        'Les heures de rappel exactes sont désactivées',
      'remindersDelayed' =>
        'Les rappels peuvent être légèrement retardés. Appuyez pour ouvrir les paramètres.',
      'medicalSettings' => 'Paramètres médicaux',
      'theme' => 'Thème',
      'themeCustomizeColors' => 'Personnaliser les couleurs de l\'application',
      'customThemeEnabled' => 'Thème personnalisé',
      'themeGenerate' => 'Générer',
      'themeVariant' => 'Variante',
      'themeContrast' => 'Contraste',
      'themeContrastStandard' => 'Standard',
      'themeContrastMedium' => 'Moyen',
      'themeContrastHigh' => 'Élevé',
      'autoUpdate' => 'Mise à jour automatique',
      'autoUpdateDescription' =>
        'Vérifier automatiquement les nouvelles mises à jour au lancement de l\'application',
      'checkForUpdates' => 'Vérifier les mises à jour',
      'checkForUpdatesDescription' =>
        'Vérifier manuellement la dernière version\nCela vous connectera à Internet\n(Aucune donnée ne sera envoyée)',
      'appVersion' => ({required Object version}) => 'Mona version ${version}',
      'backupSavedTo' => ({required Object path}) =>
          'Sauvegarde enregistrée dans : ${path}',
      'exportFailed' => ({required Object error}) =>
          'Échec de l\'exportation : ${error}',
      'importDataTitle' => 'Importer des données',
      'importDataSubtitle' =>
        'Restaurer les données depuis une sauvegarde JSON',
      'importDataOverwriteWarning' =>
        'Cela remplacera toutes vos données actuelles par la sauvegarde. Cette action est irréversible. Voulez-vous continuer ?',
      'importConfirm' => 'Importer',
      'importSuccessfulTitle' => 'Import réussi',
      'importRestartRequired' =>
        'Veuillez redémarrer l\'application pour appliquer les données restaurées.',
      'closeApp' => 'Fermer l\'application',
      'importFailed' => ({required Object error}) =>
          'Échec de l\'importation : ${error}',
      'updates' => 'Mises à jour',
      'dataManagement' => 'Gestion des données',
      'exportDataTitle' => 'Exporter les données',
      'exportDataSubtitle' => 'Enregistrer vos données dans un fichier JSON',
      'units' => 'Unités',
      'updateNoCompatibleApk' =>
        'Aucune mise à jour compatible avec votre appareil.',
      'updateAppUpToDate' => 'Votre application est à jour !',
      'updateCheckNetworkError' =>
        'Impossible de vérifier les mises à jour pour le moment.',
      'updateDialogTitle' => 'Mise à jour disponible',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'La version ${latest} est disponible ! (Actuelle : ${current})\n\nUne mise à jour compatible avec votre appareil est prête à être installée.',
      'updateDownloadAndInstall' => 'Télécharger et installer',
      'updateInstallPermissionRequired' =>
        'Une autorisation est requise pour installer les mises à jour.',
      'updateDownloadingTitle' => 'Téléchargement de la mise à jour...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Échec de l\'ouverture de l\'installateur : ${message}',
      'updateDownloadFailed' =>
        'Échec du téléchargement. Vérifiez votre connexion.',
      'notificationMedicationReminderTitle' => (
              {required Object scheduleName}) =>
          'Il est temps de prendre ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Prévu pour le ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Prévu pour ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Prévu pour ${weekday}',
      'addSchedule' => 'Ajouter un planning',
      'addScheduleToGetStarted' => 'Ajoutez un planning pour commencer.',
      'newSchedule' => 'Nouveau planning',
      'every' => 'Tous les',
      'days' => 'jours',
      'dayOfMonth' => 'Jour du mois',
      'months' => 'mois',
      'startDate' => 'Date de début',
      'pickATime' => 'Choisir une heure',
      'addIntakeTime' => 'Ajouter une heure',
      'editScheduleInfo' => 'Modifier les informations du planning',
      'scheduling' => 'Programme',
      'editSchedule' => 'Modifier le planning',
      'deleteSchedule' => ({required Object name}) => 'Supprimer ${name} ?',
      'addNotification' => 'Ajouter une notification',
      'empty_intakes' => 'Les prises enregistrées apparaîtront ici',
      'HrtCounter' => 'Temps sous THS',
      'HrtCounterDescription' =>
        'Affiche depuis combien de temps vous êtes sous THS et votre nombre total de prises',
      'hrtWidgetPlaceholder' =>
        'Ouvrir Mona pour enregistrer votre première prise',
      'hrtWidgetPreviewSample' => 'Sous THS depuis 8 mois',
      'hrtWidgetPreviewIntakeSample' => '16 prises enregistrées',
      'startOfDay' => 'Début de la journée',
      'startOfDayDescription' => ({required Object time}) =>
          'Les heures avant ${time} comptent pour la veille',
      'chooseSchedule' => 'Choisir un planning',
      'addSchedulesFirst' => 'Ajoutez d\'abord des plannings.',
      'editIntake' => 'Modifier la prise',
      'date' => 'Date',
      'amount' => 'Quantité',
      'takenAmount' => 'Quantité prise',
      'wastedAmount' => 'Quantité perdue',
      'none' => 'Aucun',
      'supplyItem' => 'Consommable',
      'chooseItem' => 'Choisir un consommable',
      'noItemsToAdd' => 'Aucun élément disponible',
      'injectionSide' => 'Côté',
      'deleteIntake' => 'Supprimer cette prise ?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Prendre ${scheduleName}',
      'takeIntake' => 'Prendre',
      'intakeRecorded' => 'Prise enregistrée',
      'needleDeadSpace' => 'Espace mort de l\'aiguille',
      'notes' => 'Notes',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'empty_levels' =>
        'Ajoutez une prise de sang ou enregistrez une injection d’estradiol pour commencer',
      'bloodTestsTitle' => 'Prises de sang',
      'estradiolLevelsTitle' => 'Taux d\'estradiol',
      'empty_blood_tests' =>
        'Les prises de sang enregistrées s’afficheront ici. Commencez avec le bouton Ajouter !',
      'addBloodTest' => 'Ajouter une analyse de sang',
      'editBloodTest' => 'Modifier la prise de sang',
      'newBloodTest' => 'Nouvelle prise de sang',
      'deleteBloodTest' => 'Supprimer cette prise de sang ?',
      'estradiolLevelLabel' => 'Taux d\'estradiol',
      'testosteroneLevelLabel' => 'Taux de testostérone',
      'bloodTestDateLabel' => 'Date de la prise',
      'chartNowConcentration' => ({required Object value}) =>
          'Maintenant ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date} : ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date} : ${level}',
      'empty_supplies' =>
        'Aucun consommable. Ajoutez un élément pour commencer.',
      'newItem' => 'Nouvel élément',
      'adminRoute' => 'Voie d\'administration',
      'totalAmount' => 'Quantité totale',
      'concentration' => 'Concentration',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Dose par ${unit}',
      'editItem' => 'Modifier l\'élément',
      'usedAmount' => 'Quantité utilisée',
      'deleteItem' => ({required Object name}) => 'Supprimer ${name} ?',
      'allItemsFilter' => 'Tout',
      'medicationItemsFilter' => 'Médicaments',
      'genericItems' => 'Matériel',
      'medicationItemType' => 'Médicament',
      'genericItemType' => 'Matériel',
      'supplyType' => 'Type',
      'syringe' => 'Seringues',
      'wipe' => 'Lingettes',
      'needle' => 'Aiguilles',
      'gloves' => 'Gants',
      'bandage' => 'Pansements',
      'add' => 'Ajouter',
      'save' => 'Enregistrer',
      'cancel' => 'Annuler',
      'next' => 'Suivant',
      'delete' => 'Supprimer',
      'deleteElement' => 'Supprimer cet élément ?',
      'irreversibleAction' => 'Cette action est irréversible.',
      'name' => 'Nom',
      'molecule' => 'Molécule',
      'ester' => 'Ester',
      'estradiol' => 'Œstradiol',
      'progesterone' => 'Progestérone',
      'testosterone' => 'Testostérone',
      'nandrolone' => 'Nandrolone',
      'dihydrotestosterone' => 'Dihydrotestostérone',
      'spironolactone' => 'Spironolactone',
      'cyproteroneAcetate' => 'Acétate de cyprotérone',
      'leuprorelinAcetate' => 'Acétate de leuproréline',
      'bicalutamide' => 'Bicalutamide',
      'decapeptyl' => 'Décapéptyl',
      'raloxifene' => 'Raloxifène',
      'tamoxifen' => 'Tamoxifène',
      'finasteride' => 'Finastéride',
      'dutasteride' => 'Dutastéride',
      'minoxidil' => 'Minoxidil',
      'pioglitazone' => 'Pioglitazone',
      'enanthate' => 'Énanthate',
      'valerate' => 'Valérate',
      'cypionate' => 'Cypionate',
      'undecylate' => 'Undécylate',
      'benzoate' => 'Benzoate',
      'cypionateSuspension' => 'Suspension de cypionate',
      'medicationEstradiolEnanthate' => 'Énanthate d\'œstradiol',
      'medicationEstradiolValerate' => 'Valérate d\'œstradiol',
      'medicationEstradiolCypionate' => 'Cypionate d\'œstradiol',
      'medicationEstradiolUndecylate' => 'Undécylate d\'œstradiol',
      'medicationEstradiolBenzoate' => 'Benzoate d\'œstradiol',
      'medicationEstradiolCypionateSuspension' =>
        'Suspension de cypionate d\'œstradiol',
      'medicationTestosteroneEnanthate' => 'Énanthate de testostérone',
      'medicationTestosteroneValerate' => 'Valérate de testostérone',
      'medicationTestosteroneCypionate' => 'Cypionate de testostérone',
      'medicationTestosteroneUndecylate' => 'Undécylate de testostérone',
      'medicationTestosteroneBenzoate' => 'Benzoate de testostérone',
      'medicationTestosteroneCypionateSuspension' =>
        'Suspension de cypionate de testostérone',
      'injection' => 'Injection',
      'oral' => 'Oral',
      'sublingual' => 'Sublingual',
      'patch' => 'Patch',
      'gel' => 'Gel',
      'implant' => 'Implant',
      'suppository' => 'Suppositoire',
      'transdermalSpray' => 'Spray transdermique',
      'transdermalDrops' => 'Gouttes transdermiques',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'unitNgPerMl' => 'ng/mL',
      'injectionSideLeft' => 'Gauche',
      'injectionSideRight' => 'Droite',
      'placementLeft' => 'Côté gauche',
      'placementRight' => 'Côté droit',
      'placementLeftThigh' => 'Cuisse gauche',
      'placementRightThigh' => 'Cuisse droite',
      'placementLeftArm' => 'Bras gauche',
      'placementRightArm' => 'Bras droit',
      'placementLeftButtock' => 'Fesse gauche',
      'placementRightButtock' => 'Fesse droite',
      'placementLeftAbdomen' => 'Abdomen (gauche)',
      'placementRightAbdomen' => 'Abdomen (droite)',
      'injectionSites' => 'Sites d\'injection',
      'injectionSitesDescription' => 'Gérez votre rotation de sites',
      'addInjectionSite' => 'Ajouter un site',
      'customSiteLabel' => 'Nom de site personnalisé',
      'noInjectionSitesYet' => 'Aucun site',
      'noInjectionAddOneToGetStarted' =>
        'Ajoutez un site ci-dessous pour commencer.',
      'placementSuggestionPerScheduleTitle' => 'Suggérer par planning',
      'placementSuggestionPerScheduleDescription' =>
        'Base la suggestion du site suivant sur ce planning uniquement.',
      'requiredField' => 'Champ obligatoire',
      'mustBePositiveNumber' => 'Doit être un nombre positif',
      'mustBeBetween1And28' => 'Doit être entre 1 et 28',
      'invalidTotalAmount' => 'Montant total invalide',
      'cannotExceedTotalCapacity' => 'Ne peut pas dépasser la capacité totale',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'il y a ${count} jour',
            many: 'il y a ${count} de jours',
            other: 'il y a ${count} jours',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'dans ${count} jour',
            many: 'dans ${count} de jours',
            other: 'dans ${count} jours',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'Tous les jours',
            many: 'Tous les ${count} de jours',
            other: 'Tous les ${count} jours',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'Le ${day} de chaque mois',
            many: 'Le ${day}, tous les ${count} de mois',
            other: 'Le ${day}, tous les ${count} mois',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '${count} créé',
            many: '${count} créés',
            other: '${count} créés',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '1 jour sous THS',
            many: '${count} de jours sous THS',
            other: '${count} jours sous THS',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '1 semaine sous THS',
            many: '${count} de semaines sous THS',
            other: '${count} semaines sous THS',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '1 mois sous THS',
            many: '${count} de mois sous THS',
            other: '${count} mois sous THS',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '1 an sous THS',
            many: '${count} d\'années sous THS',
            other: '${count} ans sous THS',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '1 prise enregistrée',
            many: '${count} de prises enregistrées',
            other: '${count} prises enregistrées',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'Reste ${count} ${unit}',
            many: 'Reste ${count} de ${unit}',
            other: 'Reste ${count} ${unit}',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '${count} seringue restante',
            many: '${count} de seringues restantes',
            other: '${count} seringues restantes',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '${count} lingette restante',
            many: '${count} de lingettes restantes',
            other: '${count} lingettes restantes',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '${count} aiguille restante',
            many: '${count} d\'aiguilles restantes',
            other: '${count} aiguilles restantes',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '${count} gant restant',
            many: '${count} de gants restants',
            other: '${count} gants restants',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: '${count} pansement restant',
            many: '${count} de pansements restants',
            other: '${count} pansements restants',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'ml',
            many: 'de ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'comprimé',
            many: 'de comprimés',
            other: 'comprimés',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'patch',
            many: 'de patchs',
            other: 'patchs',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'pression',
            many: 'de pressions',
            other: 'pressions',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'implant',
            many: 'd\'implants',
            other: 'implants',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'suppositoire',
            many: 'de suppositoires',
            other: 'suppositoires',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('fr'))(
            count,
            one: 'pulvérisation',
            many: 'de pulvérisations',
            other: 'pulvérisations',
          ),
      _ => null,
    };
  }
}
