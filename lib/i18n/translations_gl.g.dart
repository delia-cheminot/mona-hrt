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
class TranslationsGl extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsGl(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.gl,
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

  /// Metadata for the translations of <gl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsGl _root = this; // ignore: unused_field

  @override
  TranslationsGl $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsGl(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Tomas';
  @override
  String get nav_levels => 'Niveis';
  @override
  String get nav_supplies => 'Provisións';
  @override
  String get takeAnIntake => 'Rexistrar unha toma';
  @override
  String get addAnItem => 'Engadir un elemento';
  @override
  String get empty_home => 'Comeza engadindo un horario na Configuración';
  @override
  String get allDone => 'Todo feito!';
  @override
  String get noIntakesDue => 'Non hai tomas pendentes hoxe';
  @override
  String get upcoming => 'Seguintes';
  @override
  String get taken => 'Tomado';
  @override
  String get yesterday => 'onte';
  @override
  String get tomorrow => 'mañá';
  @override
  String get lastTaken => 'Última toma';
  @override
  String get neverTakenYet => 'Non tomado nunca';
  @override
  String get scheduleFrequencyDaily => 'Tódolos días';
  @override
  String get scheduleFrequencyInterval => 'Intervalo';
  @override
  String get scheduleFrequencyWeekly => 'Semanalmente';
  @override
  String get newUpdateAvailable => 'Hai unha nova actualización dispoñible!';
  @override
  String get goToSettings => 'Ir a Configuración';
  @override
  String get settingsTitle => 'Configuración';
  @override
  String get notifications => 'Notificacións';
  @override
  String get schedulesAndNotifications => 'Horarios e notificacións';
  @override
  String get general => 'Xeral';
  @override
  String get schedules => 'Horarios';
  @override
  String get noSchedules => 'Sen horarios';
  @override
  String get language => 'Idioma';
  @override
  String get languageFollowDevice => 'Seguir o idioma do dispositivo';
  @override
  String get selectLanguage => 'Seleccionar idioma';
  @override
  String get enableNotifications => 'Activar notificacións';
  @override
  String get enableNotificationsDescription => 'Enviar recordatorios';
  @override
  String get notificationsDisabledTitle =>
      'As notificacións están desactivadas';
  @override
  String get clickToOpenSettings => 'Preme para abrir a configuración';
  @override
  String get exactRemindersDisabled =>
      'Os recordatorio exactos están desactivados';
  @override
  String get remindersDelayed =>
      'Os recordatorios poden ter unha lixeira demora. Preme para abrir a configuración.';
  @override
  String get medicalSettings => 'Configuración médica';
  @override
  String get theme => 'Aspecto';
  @override
  String get themeCustomizeColors => 'Personaliza as cores da aplicación';
  @override
  String get customThemeEnabled => 'Aspecto personalizado';
  @override
  String get themeGenerate => 'Xerar';
  @override
  String get themeVariant => 'Variante';
  @override
  String get themeContrast => 'Contraste';
  @override
  String get themeContrastStandard => 'Estándar';
  @override
  String get themeContrastMedium => 'Medio';
  @override
  String get themeContrastHigh => 'Alto';
  @override
  String get autoUpdate => 'Actualización automática';
  @override
  String get autoUpdateDescription =>
      'Buscar actualizacións automaticamente cando se inicie a aplicación';
  @override
  String get checkForUpdates => 'Buscar actualizacións';
  @override
  String get checkForUpdatesDescription =>
      'Busca a última versión manualmente\nIsto conectarache ao Internet\n(Non se enviarán datos)';
  @override
  String appVersion({required Object version}) => 'Versión ${version} de Mona';
  @override
  String backupSavedTo({required Object path}) =>
      'Copia de seguridade gardada en: ${path}';
  @override
  String exportFailed({required Object error}) => 'Error ao exportar: ${error}';
  @override
  String get importDataTitle => 'Importar Datos';
  @override
  String get importDataSubtitle => 'Restaurar datos dende unha copia JSON';
  @override
  String get importDataOverwriteWarning =>
      'Isto sobrescribirá todos os teus datos actuais coa copia. Esta acción non se pode desfacer. Queres continuar?';
  @override
  String get importConfirm => 'Importar';
  @override
  String get importSuccessfulTitle => 'Importación exitosa';
  @override
  String get importRestartRequired =>
      'Por favor reinicia a aplicación para aplicar os datos restaurados.';
  @override
  String get closeApp => 'Cerrar Aplicación';
  @override
  String importFailed({required Object error}) => 'Error ao importar: ${error}';
  @override
  String get updates => 'Actualizacións';
  @override
  String get dataManagement => 'Xestión de Datos';
  @override
  String get exportDataTitle => 'Exportar Datos';
  @override
  String get exportDataSubtitle => 'Garda os teus datos a un arquivo JSON';
  @override
  String get units => 'Unidades';
  @override
  String get updateNoCompatibleApk =>
      'Non se encontraron actualizacións compatibles co teu dispositivo.';
  @override
  String get updateAppUpToDate => 'A túa aplicación está ao día!';
  @override
  String get updateCheckNetworkError =>
      'Non se puido buscar actualizacións en este momento.';
  @override
  String get updateDialogTitle => 'Actualización Dispoñible';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'A versión ${latest} está dispoñible! (Actual: ${current})\n\nUnha actualización compatible co teu dispositivo está lista para ser instalada.';
  @override
  String get updateDownloadAndInstall => 'Descargar e Instalar';
  @override
  String get updateInstallPermissionRequired =>
      'Fan falta permisos para instalar actualizacións.';
  @override
  String get updateDownloadingTitle => 'Descargando Actualización...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Error ao abrir o instalador: ${message}';
  @override
  String get updateDownloadFailed =>
      'Descarga errada. Por favor comproba a túa conexión.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Hora de tomar ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Programado para ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Programado para ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Programado para ${weekday}';
  @override
  String get addSchedule => 'Engadir un horario';
  @override
  String get addScheduleToGetStarted => 'Engade un horario para comezar.';
  @override
  String get newSchedule => 'Novo horario';
  @override
  String get every => 'Cada';
  @override
  String get days => 'días';
  @override
  String get startDate => 'Data de inicio';
  @override
  String get pickATime => 'Escolle unha hora';
  @override
  String get addIntakeTime => 'Engade unha hora';
  @override
  String get editScheduleInfo => 'Editar información do horario';
  @override
  String get scheduling => 'Programación';
  @override
  String get editSchedule => 'Editar horario';
  @override
  String deleteSchedule({required Object name}) => 'Eliminar ${name}?';
  @override
  String get addNotification => 'Engadir unha notificación';
  @override
  String get empty_intakes => 'As doses tomadas aparecerán aquí';
  @override
  String get chooseSchedule => 'Selecciona un horario';
  @override
  String get addSchedulesFirst => 'Engade horarios primeiro.';
  @override
  String get editIntake => 'Editar toma';
  @override
  String get date => 'Data';
  @override
  String get amount => 'Cantidade';
  @override
  String get takenAmount => 'Cantidade tomada';
  @override
  String get wastedAmount => 'Cantidade desperdiciada';
  @override
  String get none => 'Ningún';
  @override
  String get supplyItem => 'Elemento de provisións';
  @override
  String get injectionSide => 'Lado de inxección';
  @override
  String get deleteIntake => 'Eliminar esta toma?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Tomar ${scheduleName}';
  @override
  String get takeIntake => 'Rexistrar toma';
  @override
  String get intakeRecorded => 'Toma rexistrada';
  @override
  String get needleDeadSpace => 'Espazo morto da agulla';
  @override
  String get notes => 'Notas';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get bloodTestsTitle => 'Análises de sangue';
  @override
  String get empty_blood_tests =>
      'Os análises de sangue feitos aparecerán aquí. Comeza utilizando o botón de Engadir!';
  @override
  String get addBloodTest => 'Engadir análise de sangue';
  @override
  String get editBloodTest => 'Editar análise de sangue';
  @override
  String get newBloodTest => 'Novo análise de sangue';
  @override
  String get deleteBloodTest => 'Eliminar este análise de sangue?';
  @override
  String get estradiolLevelLabel => 'Nivel de Estradiol';
  @override
  String get testosteroneLevelLabel => 'Nivel de Testosterona';
  @override
  String get bloodTestDateLabel => 'Data da análise';
  @override
  String chartNowConcentration({required Object value}) => 'Agora ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies =>
      'Sen provisións. Engade un elemento para comezar.';
  @override
  String get newItem => 'Novo elemento';
  @override
  String get adminRoute => 'Ruta de administración';
  @override
  String get totalAmount => 'Cantidade total';
  @override
  String get concentration => 'Concentración';
  @override
  String get editItem => 'Editar elemento';
  @override
  String get usedAmount => 'Cantidade usada';
  @override
  String deleteItem({required Object name}) => 'Eliminar ${name}?';
  @override
  String get allItemsFilter => 'Todos';
  @override
  String get medicationItemsFilter => 'Medicación';
  @override
  String get genericItems => 'Consumibles';
  @override
  String get medicationItemType => 'Medicación';
  @override
  String get genericItemType => 'Consumible';
  @override
  String get supplyType => 'Tipo';
  @override
  String get syringe => 'Xiringa';
  @override
  String get wipe => 'Toalliñas';
  @override
  String get needle => 'Agullas';
  @override
  String get gloves => 'Guantes';
  @override
  String get bandage => 'Vendas';
  @override
  String get add => 'Engadir';
  @override
  String get save => 'Gardar';
  @override
  String get cancel => 'Cancelar';
  @override
  String get next => 'Seguinte';
  @override
  String get delete => 'Eliminar';
  @override
  String get deleteElement => 'Eliminar este elemento?';
  @override
  String get irreversibleAction => 'Esta acción non se pode desfacer.';
  @override
  String get name => 'Nome';
  @override
  String get molecule => 'Molécula';
  @override
  String get ester => 'Éster';
  @override
  String get estradiol => 'Estradiol';
  @override
  String get progesterone => 'Proxesterona';
  @override
  String get testosterone => 'Testosterona';
  @override
  String get nandrolone => 'Nandrolona';
  @override
  String get dihydrotestosterone => 'Dihidrotestosterona';
  @override
  String get spironolactone => 'Espironolactona';
  @override
  String get cyproteroneAcetate => 'Acetato de ciproterona';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: 'fai ${count} día',
        other: 'fai ${count} días',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: 'dentro de ${count} día',
        other: 'dentro de ${count} días',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: 'Cada ${count} día',
        other: 'Cada ${count} días',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: '${count} creado',
        other: '${count} creados',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: '${count} ${unit} restante',
        other: '${count} ${unit} restantes',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: 'Queda ${count} xiringa',
        other: 'Quedan ${count} xiringa',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: 'Queda ${count} toalliña',
        other: 'Quedan ${count} toalliñas',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: 'Queda ${count} agulla',
        other: 'Quedan ${count} agullas',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: 'Queda ${count} guante',
        other: 'Quedan ${count} guantes',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
        count,
        one: 'Queda ${count} venda',
        other: 'Quedan ${count} vendas',
      );
}

/// The flat map containing all translations for locale <gl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsGl {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Tomas',
      'nav_levels' => 'Niveis',
      'nav_supplies' => 'Provisións',
      'takeAnIntake' => 'Rexistrar unha toma',
      'addAnItem' => 'Engadir un elemento',
      'empty_home' => 'Comeza engadindo un horario na Configuración',
      'allDone' => 'Todo feito!',
      'noIntakesDue' => 'Non hai tomas pendentes hoxe',
      'upcoming' => 'Seguintes',
      'taken' => 'Tomado',
      'yesterday' => 'onte',
      'tomorrow' => 'mañá',
      'lastTaken' => 'Última toma',
      'neverTakenYet' => 'Non tomado nunca',
      'scheduleFrequencyDaily' => 'Tódolos días',
      'scheduleFrequencyInterval' => 'Intervalo',
      'scheduleFrequencyWeekly' => 'Semanalmente',
      'newUpdateAvailable' => 'Hai unha nova actualización dispoñible!',
      'goToSettings' => 'Ir a Configuración',
      'settingsTitle' => 'Configuración',
      'notifications' => 'Notificacións',
      'schedulesAndNotifications' => 'Horarios e notificacións',
      'general' => 'Xeral',
      'schedules' => 'Horarios',
      'noSchedules' => 'Sen horarios',
      'language' => 'Idioma',
      'languageFollowDevice' => 'Seguir o idioma do dispositivo',
      'selectLanguage' => 'Seleccionar idioma',
      'enableNotifications' => 'Activar notificacións',
      'enableNotificationsDescription' => 'Enviar recordatorios',
      'notificationsDisabledTitle' => 'As notificacións están desactivadas',
      'clickToOpenSettings' => 'Preme para abrir a configuración',
      'exactRemindersDisabled' => 'Os recordatorio exactos están desactivados',
      'remindersDelayed' =>
        'Os recordatorios poden ter unha lixeira demora. Preme para abrir a configuración.',
      'medicalSettings' => 'Configuración médica',
      'theme' => 'Aspecto',
      'themeCustomizeColors' => 'Personaliza as cores da aplicación',
      'customThemeEnabled' => 'Aspecto personalizado',
      'themeGenerate' => 'Xerar',
      'themeVariant' => 'Variante',
      'themeContrast' => 'Contraste',
      'themeContrastStandard' => 'Estándar',
      'themeContrastMedium' => 'Medio',
      'themeContrastHigh' => 'Alto',
      'autoUpdate' => 'Actualización automática',
      'autoUpdateDescription' =>
        'Buscar actualizacións automaticamente cando se inicie a aplicación',
      'checkForUpdates' => 'Buscar actualizacións',
      'checkForUpdatesDescription' =>
        'Busca a última versión manualmente\nIsto conectarache ao Internet\n(Non se enviarán datos)',
      'appVersion' => ({required Object version}) =>
          'Versión ${version} de Mona',
      'backupSavedTo' => ({required Object path}) =>
          'Copia de seguridade gardada en: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Error ao exportar: ${error}',
      'importDataTitle' => 'Importar Datos',
      'importDataSubtitle' => 'Restaurar datos dende unha copia JSON',
      'importDataOverwriteWarning' =>
        'Isto sobrescribirá todos os teus datos actuais coa copia. Esta acción non se pode desfacer. Queres continuar?',
      'importConfirm' => 'Importar',
      'importSuccessfulTitle' => 'Importación exitosa',
      'importRestartRequired' =>
        'Por favor reinicia a aplicación para aplicar os datos restaurados.',
      'closeApp' => 'Cerrar Aplicación',
      'importFailed' => ({required Object error}) =>
          'Error ao importar: ${error}',
      'updates' => 'Actualizacións',
      'dataManagement' => 'Xestión de Datos',
      'exportDataTitle' => 'Exportar Datos',
      'exportDataSubtitle' => 'Garda os teus datos a un arquivo JSON',
      'units' => 'Unidades',
      'updateNoCompatibleApk' =>
        'Non se encontraron actualizacións compatibles co teu dispositivo.',
      'updateAppUpToDate' => 'A túa aplicación está ao día!',
      'updateCheckNetworkError' =>
        'Non se puido buscar actualizacións en este momento.',
      'updateDialogTitle' => 'Actualización Dispoñible',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'A versión ${latest} está dispoñible! (Actual: ${current})\n\nUnha actualización compatible co teu dispositivo está lista para ser instalada.',
      'updateDownloadAndInstall' => 'Descargar e Instalar',
      'updateInstallPermissionRequired' =>
        'Fan falta permisos para instalar actualizacións.',
      'updateDownloadingTitle' => 'Descargando Actualización...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Error ao abrir o instalador: ${message}',
      'updateDownloadFailed' =>
        'Descarga errada. Por favor comproba a túa conexión.',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Hora de tomar ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Programado para ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Programado para ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Programado para ${weekday}',
      'addSchedule' => 'Engadir un horario',
      'addScheduleToGetStarted' => 'Engade un horario para comezar.',
      'newSchedule' => 'Novo horario',
      'every' => 'Cada',
      'days' => 'días',
      'startDate' => 'Data de inicio',
      'pickATime' => 'Escolle unha hora',
      'addIntakeTime' => 'Engade unha hora',
      'editScheduleInfo' => 'Editar información do horario',
      'scheduling' => 'Programación',
      'editSchedule' => 'Editar horario',
      'deleteSchedule' => ({required Object name}) => 'Eliminar ${name}?',
      'addNotification' => 'Engadir unha notificación',
      'empty_intakes' => 'As doses tomadas aparecerán aquí',
      'chooseSchedule' => 'Selecciona un horario',
      'addSchedulesFirst' => 'Engade horarios primeiro.',
      'editIntake' => 'Editar toma',
      'date' => 'Data',
      'amount' => 'Cantidade',
      'takenAmount' => 'Cantidade tomada',
      'wastedAmount' => 'Cantidade desperdiciada',
      'none' => 'Ningún',
      'supplyItem' => 'Elemento de provisións',
      'injectionSide' => 'Lado de inxección',
      'deleteIntake' => 'Eliminar esta toma?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Tomar ${scheduleName}',
      'takeIntake' => 'Rexistrar toma',
      'intakeRecorded' => 'Toma rexistrada',
      'needleDeadSpace' => 'Espazo morto da agulla',
      'notes' => 'Notas',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'bloodTestsTitle' => 'Análises de sangue',
      'empty_blood_tests' =>
        'Os análises de sangue feitos aparecerán aquí. Comeza utilizando o botón de Engadir!',
      'addBloodTest' => 'Engadir análise de sangue',
      'editBloodTest' => 'Editar análise de sangue',
      'newBloodTest' => 'Novo análise de sangue',
      'deleteBloodTest' => 'Eliminar este análise de sangue?',
      'estradiolLevelLabel' => 'Nivel de Estradiol',
      'testosteroneLevelLabel' => 'Nivel de Testosterona',
      'bloodTestDateLabel' => 'Data da análise',
      'chartNowConcentration' => ({required Object value}) => 'Agora ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' => 'Sen provisións. Engade un elemento para comezar.',
      'newItem' => 'Novo elemento',
      'adminRoute' => 'Ruta de administración',
      'totalAmount' => 'Cantidade total',
      'concentration' => 'Concentración',
      'editItem' => 'Editar elemento',
      'usedAmount' => 'Cantidade usada',
      'deleteItem' => ({required Object name}) => 'Eliminar ${name}?',
      'allItemsFilter' => 'Todos',
      'medicationItemsFilter' => 'Medicación',
      'genericItems' => 'Consumibles',
      'medicationItemType' => 'Medicación',
      'genericItemType' => 'Consumible',
      'supplyType' => 'Tipo',
      'syringe' => 'Xiringa',
      'wipe' => 'Toalliñas',
      'needle' => 'Agullas',
      'gloves' => 'Guantes',
      'bandage' => 'Vendas',
      'add' => 'Engadir',
      'save' => 'Gardar',
      'cancel' => 'Cancelar',
      'next' => 'Seguinte',
      'delete' => 'Eliminar',
      'deleteElement' => 'Eliminar este elemento?',
      'irreversibleAction' => 'Esta acción non se pode desfacer.',
      'name' => 'Nome',
      'molecule' => 'Molécula',
      'ester' => 'Éster',
      'estradiol' => 'Estradiol',
      'progesterone' => 'Proxesterona',
      'testosterone' => 'Testosterona',
      'nandrolone' => 'Nandrolona',
      'dihydrotestosterone' => 'Dihidrotestosterona',
      'spironolactone' => 'Espironolactona',
      'cyproteroneAcetate' => 'Acetato de ciproterona',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: 'fai ${count} día',
            other: 'fai ${count} días',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: 'dentro de ${count} día',
            other: 'dentro de ${count} días',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: 'Cada ${count} día',
            other: 'Cada ${count} días',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: '${count} creado',
            other: '${count} creados',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: '${count} ${unit} restante',
            other: '${count} ${unit} restantes',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: 'Queda ${count} xiringa',
            other: 'Quedan ${count} xiringa',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: 'Queda ${count} toalliña',
            other: 'Quedan ${count} toalliñas',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: 'Queda ${count} agulla',
            other: 'Quedan ${count} agullas',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: 'Queda ${count} guante',
            other: 'Quedan ${count} guantes',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('gl'))(
            count,
            one: 'Queda ${count} venda',
            other: 'Quedan ${count} vendas',
          ),
      _ => null,
    };
  }
}
