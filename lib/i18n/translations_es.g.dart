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
class TranslationsEs extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsEs(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.es,
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

  /// Metadata for the translations of <es>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsEs _root = this; // ignore: unused_field

  @override
  TranslationsEs $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsEs(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Tomas';
  @override
  String get nav_levels => 'Niveles';
  @override
  String get nav_supplies => 'Suministros';
  @override
  String get takeAnIntake => 'Registrar una toma';
  @override
  String get addAnItem => 'Añadir un elemento';
  @override
  String get empty_home => 'Comienza añadiendo un horario en Configuración';
  @override
  String get allDone => '¡Todo listo!';
  @override
  String get noIntakesDue => 'No hay tomas pendientes hoy';
  @override
  String get upcoming => 'Próximamente';
  @override
  String get taken => 'Tomado';
  @override
  String get yesterday => 'ayer';
  @override
  String get tomorrow => 'mañana';
  @override
  String get lastTaken => 'Última toma';
  @override
  String get neverTakenYet => 'Aún no tomado';
  @override
  String get scheduleFrequencyDaily => 'Cada día';
  @override
  String get scheduleFrequencyInterval => 'Intervalo';
  @override
  String get scheduleFrequencyWeekly => 'Semanal';
  @override
  String get newUpdateAvailable => '¡Hay una nueva actualización disponible!';
  @override
  String get goToSettings => 'Ir a Configuración';
  @override
  String get settingsTitle => 'Configuración';
  @override
  String get notifications => 'Notificaciones';
  @override
  String get schedulesAndNotifications => 'Horarios y notificaciones';
  @override
  String get general => 'General';
  @override
  String get schedules => 'Horarios';
  @override
  String get noSchedules => 'Sin horarios';
  @override
  String get language => 'Idioma';
  @override
  String get languageFollowDevice => 'Seguir el idioma del dispositivo';
  @override
  String get selectLanguage => 'Seleccionar idioma';
  @override
  String get enableNotifications => 'Activar notificaciones';
  @override
  String get enableNotificationsDescription => 'Enviar recordatorios';
  @override
  String get notificationsDisabledTitle =>
      'Las notificaciones están desactivadas';
  @override
  String get clickToOpenSettings => 'Haz clic para abrir la configuración';
  @override
  String get exactRemindersDisabled =>
      'Hora exacta de los recordatorios desactivada';
  @override
  String get remindersDelayed =>
      'Los recordatorios pueden retrasarse ligeramente. Toca para abrir la configuración.';
  @override
  String get autoUpdate => 'Actualización automática';
  @override
  String get autoUpdateDescription =>
      'Buscar automáticamente nuevas actualizaciones al iniciar la aplicación';
  @override
  String get checkForUpdates => 'Buscar actualizaciones';
  @override
  String get checkForUpdatesDescription =>
      'Buscar manualmente la última versión\nEsto se conectará a Internet\n(No se enviarán datos)';
  @override
  String appVersion({required Object version}) => 'Versión de Mona ${version}';
  @override
  String backupSavedTo({required Object path}) =>
      'Copia de seguridad guardada en: ${path}';
  @override
  String exportFailed({required Object error}) => 'Error al exportar: ${error}';
  @override
  String get importDataTitle => 'Importar datos';
  @override
  String get importDataSubtitle => 'Restaurar datos desde una copia JSON';
  @override
  String get importDataOverwriteWarning =>
      'Esto sobrescribirá todos tus datos actuales con la copia de seguridad. Esta acción no se puede deshacer. ¿Deseas continuar?';
  @override
  String get importConfirm => 'Importar';
  @override
  String get importSuccessfulTitle => 'Importación correcta';
  @override
  String get importRestartRequired =>
      'Reinicia la aplicación para aplicar los datos restaurados.';
  @override
  String get closeApp => 'Cerrar aplicación';
  @override
  String importFailed({required Object error}) => 'Error al importar: ${error}';
  @override
  String get updates => 'Actualizaciones';
  @override
  String get dataManagement => 'Gestión de datos';
  @override
  String get exportDataTitle => 'Exportar datos';
  @override
  String get exportDataSubtitle => 'Guarda tus datos en un archivo JSON';
  @override
  String get units => 'Unidades';
  @override
  String get updateNoCompatibleApk =>
      'No se encontró ninguna actualización compatible con tu dispositivo.';
  @override
  String get updateAppUpToDate => '¡Tu aplicación está actualizada!';
  @override
  String get updateCheckNetworkError =>
      'No se pudieron comprobar las actualizaciones en este momento.';
  @override
  String get updateDialogTitle => 'Actualización disponible';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      '¡La versión ${latest} está disponible! (Actual: ${current})\n\nHay una actualización compatible con tu dispositivo lista para instalarse.';
  @override
  String get updateDownloadAndInstall => 'Descargar e instalar';
  @override
  String get updateInstallPermissionRequired =>
      'Se necesita permiso para instalar actualizaciones.';
  @override
  String get updateDownloadingTitle => 'Descargando actualización...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'No se pudo abrir el instalador: ${message}';
  @override
  String get updateDownloadFailed =>
      'Error en la descarga. Comprueba tu conexión.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Es hora de tomar ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Programado para el ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Programado para ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Programado para el ${weekday}';
  @override
  String get addSchedule => 'Agregar un horario';
  @override
  String get addScheduleToGetStarted => 'Agrega un horario para comenzar.';
  @override
  String get newSchedule => 'Nuevo horario';
  @override
  String get every => 'Cada';
  @override
  String get days => 'días';
  @override
  String get startDate => 'Fecha de inicio';
  @override
  String get pickATime => 'Elegir una hora';
  @override
  String get addIntakeTime => 'Agregar una hora';
  @override
  String get editScheduleInfo => 'Editar información del horario';
  @override
  String get scheduling => 'Programación';
  @override
  String get editSchedule => 'Editar horario';
  @override
  String deleteSchedule({required Object name}) => '¿Eliminar ${name}?';
  @override
  String get addNotification => 'Agregar una notificación';
  @override
  String get empty_intakes => 'Las dosis tomadas aparecerán aquí';
  @override
  String get chooseSchedule => 'Elegir un horario';
  @override
  String get addSchedulesFirst => 'Añade algún horario primero.';
  @override
  String get editIntake => 'Editar toma';
  @override
  String get date => 'Fecha';
  @override
  String get amount => 'Cantidad';
  @override
  String get takenAmount => 'Cantidad tomada';
  @override
  String get wastedAmount => 'Cantidad desperdiciada';
  @override
  String get none => 'Ninguno';
  @override
  String get supplyItem => 'Elemento de suministro';
  @override
  String get injectionSide => 'Lado de inyección';
  @override
  String get deleteIntake => '¿Eliminar esta toma?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Tomar ${scheduleName}';
  @override
  String get takeIntake => 'Registrar toma';
  @override
  String get intakeRecorded => 'Toma registrada';
  @override
  String get needleDeadSpace => 'Espacio muerto de la aguja';
  @override
  String get notes => 'Notas';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get bloodTestsTitle => 'Análisis de sangre';
  @override
  String get empty_blood_tests =>
      'Los análisis de sangre registrados aparecerán aquí. ¡Empieza con el botón Añadir!';
  @override
  String get addBloodTest => 'Añadir un análisis de sangre';
  @override
  String get editBloodTest => 'Editar análisis de sangre';
  @override
  String get newBloodTest => 'Nuevo análisis de sangre';
  @override
  String get deleteBloodTest => '¿Eliminar este análisis de sangre?';
  @override
  String get estradiolLevelLabel => 'Nivel de estradiol';
  @override
  String get testosteroneLevelLabel => 'Nivel de testosterona';
  @override
  String get bloodTestDateLabel => 'Fecha del análisis';
  @override
  String chartNowConcentration({required Object value}) => 'Ahora ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String chartLevelTooltip({required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies =>
      'Sin suministros. Añade un elemento para comenzar.';
  @override
  String get newItem => 'Nuevo elemento';
  @override
  String get adminRoute => 'Vía de administración';
  @override
  String get totalAmount => 'Cantidad total';
  @override
  String get concentration => 'Concentración';
  @override
  String get editItem => 'Editar elemento';
  @override
  String get usedAmount => 'Cantidad usada';
  @override
  String deleteItem({required Object name}) => '¿Eliminar ${name}?';
  @override
  String get supplyType => 'Tipo';
  @override
  String get syringe => 'Jeringas';
  @override
  String get wipe => 'Toallitas';
  @override
  String get needle => 'Agujas';
  @override
  String get gloves => 'Guantes';
  @override
  String get bandage => 'Tiritas';
  @override
  String get add => 'Añadir';
  @override
  String get save => 'Guardar';
  @override
  String get cancel => 'Cancelar';
  @override
  String get next => 'Siguiente';
  @override
  String get delete => 'Eliminar';
  @override
  String get deleteElement => '¿Eliminar este elemento?';
  @override
  String get irreversibleAction => 'Esta acción no se puede deshacer.';
  @override
  String get name => 'Nombre';
  @override
  String get molecule => 'Molécula';
  @override
  String get ester => 'Éster';
  @override
  String get estradiol => 'Estradiol';
  @override
  String get progesterone => 'Progesterona';
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
  String get leuprorelinAcetate => 'Acetato de leuprorelina';
  @override
  String get bicalutamide => 'Bicalutamida';
  @override
  String get decapeptyl => 'Decapeptyl';
  @override
  String get raloxifene => 'Raloxifeno';
  @override
  String get tamoxifen => 'Tamoxifeno';
  @override
  String get finasteride => 'Finasterida';
  @override
  String get dutasteride => 'Dutasterida';
  @override
  String get minoxidil => 'Minoxidil';
  @override
  String get pioglitazone => 'Pioglitazona';
  @override
  String get enanthate => 'Enantato';
  @override
  String get valerate => 'Valerato';
  @override
  String get cypionate => 'Cipionato';
  @override
  String get undecylate => 'Undecilato';
  @override
  String get benzoate => 'Benzoato';
  @override
  String get cypionateSuspension => 'Suspensión de cipionato';
  @override
  String get medicationEstradiolEnanthate => 'Enantato de estradiol';
  @override
  String get medicationEstradiolValerate => 'Valerato de estradiol';
  @override
  String get medicationEstradiolCypionate => 'Cipionato de estradiol';
  @override
  String get medicationEstradiolUndecylate => 'Undecilato de estradiol';
  @override
  String get medicationEstradiolBenzoate => 'Benzoato de estradiol';
  @override
  String get medicationEstradiolCypionateSuspension =>
      'Suspensión de cipionato de estradiol';
  @override
  String get medicationTestosteroneEnanthate => 'Enantato de testosterona';
  @override
  String get medicationTestosteroneValerate => 'Valerato de testosterona';
  @override
  String get medicationTestosteroneCypionate => 'Cipionato de testosterona';
  @override
  String get medicationTestosteroneUndecylate => 'Undecilato de testosterona';
  @override
  String get medicationTestosteroneBenzoate => 'Benzoato de testosterona';
  @override
  String get medicationTestosteroneCypionateSuspension =>
      'Suspensión de cipionato de testosterona';
  @override
  String get injection => 'Inyección';
  @override
  String get oral => 'Oral';
  @override
  String get sublingual => 'Sublingual';
  @override
  String get patch => 'Parche';
  @override
  String get gel => 'Gel';
  @override
  String get implant => 'Implante';
  @override
  String get suppository => 'Supositorio';
  @override
  String get transdermalSpray => 'Spray transdérmico';
  @override
  String get transdermalDrops => 'Gotas transdérmicas';
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
  String get injectionSideLeft => 'Izquierda';
  @override
  String get injectionSideRight => 'Derecha';
  @override
  String get placementLeft => 'Lado izquierdo';
  @override
  String get placementRight => 'Lado derecho';
  @override
  String get requiredField => 'Campo obligatorio';
  @override
  String get mustBePositiveNumber => 'Debe ser un número positivo';
  @override
  String get invalidTotalAmount => 'Cantidad total no válida';
  @override
  String get cannotExceedTotalCapacity => 'No puede superar la capacidad total';
  @override
  String get medicationItemsFilter => 'Medicamentos';
  @override
  String get medicationItemType => 'Medicamento';
  @override
  String get scheduleFrequencyMonthly => 'Mensual';
  @override
  String get anchorToLastIntake => 'Recalcular según la última toma';
  @override
  String get anchorToLastIntakeDescription =>
      'Programa la siguiente toma un intervalo completo después de la última vez que la tomaste';
  @override
  String get medicalSettings => 'Ajustes médicos';
  @override
  String get theme => 'Tema';
  @override
  String get themeCustomizeColors => 'Personaliza los colores de la aplicación';
  @override
  String get customThemeEnabled => 'Tema personalizado';
  @override
  String get themeGenerate => 'Generar';
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
  String get dayOfMonth => 'Día del mes';
  @override
  String get months => 'meses';
  @override
  String get HrtCounter => 'Tiempo en TH';
  @override
  String get HrtCounterDescription =>
      'Muestra cuánto tiempo llevas en TH y el total de tomas';
  @override
  String get hrtWidgetPlaceholder => 'Abre Mona para registrar tu primera toma';
  @override
  String get hrtWidgetPreviewSample => 'En TH desde hace 8 meses';
  @override
  String get hrtWidgetPreviewIntakeSample => '16 tomas registradas';
  @override
  String get startOfDay => 'Inicio del día';
  @override
  String startOfDayDescription({required Object time}) =>
      'El tiempo antes de las ${time} cuenta para el día anterior';
  @override
  String get chooseItem => 'Elige un elemento';
  @override
  String get noItemsToAdd => 'No hay elementos disponibles';
  @override
  String concentrationLabelPerUnit({required Object unit}) =>
      'Dosis por ${unit}';
  @override
  String get allItemsFilter => 'Todos';
  @override
  String get genericItems => 'Consumibles';
  @override
  String get genericItemType => 'Consumible';
  @override
  String get placementLeftThigh => 'Muslo izquierdo';
  @override
  String get placementRightThigh => 'Muslo derecho';
  @override
  String get placementLeftArm => 'Brazo izquierdo';
  @override
  String get placementRightArm => 'Brazo derecho';
  @override
  String get placementLeftButtock => 'Glúteo izquierdo';
  @override
  String get placementRightButtock => 'Glúteo derecho';
  @override
  String get placementLeftAbdomen => 'Abdomen izquierdo';
  @override
  String get placementRightAbdomen => 'Abdomen derecho';
  @override
  String get injectionSites => 'Zonas de inyección';
  @override
  String get injectionSitesDescription =>
      'Gestiona las zonas entre las que rotas';
  @override
  String get addInjectionSite => 'Añadir zona';
  @override
  String get customSiteLabel => 'Nombre de zona personalizado';
  @override
  String get noInjectionSitesYet => 'Aún no hay zonas';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Añade una zona a continuación para empezar.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Sugerir por horario';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Basa la sugerencia de la siguiente zona únicamente en el historial de este horario.';
  @override
  String get mustBeBetween1And28 => 'Debe estar entre 1 y 28';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'hace ${count} día',
        many: 'hace ${count} días',
        other: 'hace ${count} días',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'en ${count} día',
        many: 'en ${count} días',
        other: 'en ${count} días',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'Cada ${count} día',
        many: 'Cada ${count} días',
        other: 'Cada ${count} días',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: '${count} creado',
        many: '${count} creados',
        other: '${count} creados',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: '${count} ${unit} restantes',
        many: 'Quedan ${count} ${unit}',
        other: '${count} ${unit} restantes',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: '1 jeringa restante',
        many: 'Quedan ${count} jeringas',
        other: '${count} jeringas restantes',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: '1 toallita restante',
        many: 'Quedan ${count} toallitas',
        other: '${count} toallitas restantes',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: '1 aguja restante',
        many: 'Quedan ${count} agujas',
        other: '${count} agujas restantes',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: '1 guante restante',
        many: 'Quedan ${count} guantes',
        other: '${count} guantes restantes',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: '1 tirita restante',
        many: 'Quedan ${count} vendas',
        other: '${count} tiritas restantes',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'ml',
        many: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'pastilla',
        many: 'comprimidos',
        other: 'pastillas',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'parche',
        many: 'parches',
        other: 'parches',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'pulsación',
        many: 'pulsaciones',
        other: 'pulsaciones',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'implante',
        many: 'implantes',
        other: 'implantes',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'supositorio',
        many: 'supositorios',
        other: 'supositorios',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'pulverización',
        many: 'pulverizaciones',
        other: 'pulverizaciones',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'Día ${day}, cada mes',
        many: 'Día ${day}, cada ${count} meses',
        other: 'Día ${day}, cada ${count} meses',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'En TH desde hace 1 día',
        many: 'En TH desde hace ${count} días',
        other: 'En TH desde hace ${count} días',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'En TH desde hace 1 semana',
        many: 'En TH desde hace ${count} semanas',
        other: 'En TH desde hace ${count} semanas',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'En TH desde hace 1 mes',
        many: 'En TH desde hace ${count} meses',
        other: 'En TH desde hace ${count} meses',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: 'En TH desde hace 1 año',
        many: 'En TH desde hace ${count} años',
        other: 'En TH desde hace ${count} años',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
        count,
        one: '1 toma registrada',
        many: '${count} tomas registradas',
        other: '${count} tomas registradas',
      );
}

/// The flat map containing all translations for locale <es>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEs {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Tomas',
      'nav_levels' => 'Niveles',
      'nav_supplies' => 'Suministros',
      'takeAnIntake' => 'Registrar una toma',
      'addAnItem' => 'Añadir un elemento',
      'empty_home' => 'Comienza añadiendo un horario en Configuración',
      'allDone' => '¡Todo listo!',
      'noIntakesDue' => 'No hay tomas pendientes hoy',
      'upcoming' => 'Próximamente',
      'taken' => 'Tomado',
      'yesterday' => 'ayer',
      'tomorrow' => 'mañana',
      'lastTaken' => 'Última toma',
      'neverTakenYet' => 'Aún no tomado',
      'scheduleFrequencyDaily' => 'Cada día',
      'scheduleFrequencyInterval' => 'Intervalo',
      'scheduleFrequencyWeekly' => 'Semanal',
      'newUpdateAvailable' => '¡Hay una nueva actualización disponible!',
      'goToSettings' => 'Ir a Configuración',
      'settingsTitle' => 'Configuración',
      'notifications' => 'Notificaciones',
      'schedulesAndNotifications' => 'Horarios y notificaciones',
      'general' => 'General',
      'schedules' => 'Horarios',
      'noSchedules' => 'Sin horarios',
      'language' => 'Idioma',
      'languageFollowDevice' => 'Seguir el idioma del dispositivo',
      'selectLanguage' => 'Seleccionar idioma',
      'enableNotifications' => 'Activar notificaciones',
      'enableNotificationsDescription' => 'Enviar recordatorios',
      'notificationsDisabledTitle' => 'Las notificaciones están desactivadas',
      'clickToOpenSettings' => 'Haz clic para abrir la configuración',
      'exactRemindersDisabled' =>
        'Hora exacta de los recordatorios desactivada',
      'remindersDelayed' =>
        'Los recordatorios pueden retrasarse ligeramente. Toca para abrir la configuración.',
      'autoUpdate' => 'Actualización automática',
      'autoUpdateDescription' =>
        'Buscar automáticamente nuevas actualizaciones al iniciar la aplicación',
      'checkForUpdates' => 'Buscar actualizaciones',
      'checkForUpdatesDescription' =>
        'Buscar manualmente la última versión\nEsto se conectará a Internet\n(No se enviarán datos)',
      'appVersion' => ({required Object version}) =>
          'Versión de Mona ${version}',
      'backupSavedTo' => ({required Object path}) =>
          'Copia de seguridad guardada en: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Error al exportar: ${error}',
      'importDataTitle' => 'Importar datos',
      'importDataSubtitle' => 'Restaurar datos desde una copia JSON',
      'importDataOverwriteWarning' =>
        'Esto sobrescribirá todos tus datos actuales con la copia de seguridad. Esta acción no se puede deshacer. ¿Deseas continuar?',
      'importConfirm' => 'Importar',
      'importSuccessfulTitle' => 'Importación correcta',
      'importRestartRequired' =>
        'Reinicia la aplicación para aplicar los datos restaurados.',
      'closeApp' => 'Cerrar aplicación',
      'importFailed' => ({required Object error}) =>
          'Error al importar: ${error}',
      'updates' => 'Actualizaciones',
      'dataManagement' => 'Gestión de datos',
      'exportDataTitle' => 'Exportar datos',
      'exportDataSubtitle' => 'Guarda tus datos en un archivo JSON',
      'units' => 'Unidades',
      'updateNoCompatibleApk' =>
        'No se encontró ninguna actualización compatible con tu dispositivo.',
      'updateAppUpToDate' => '¡Tu aplicación está actualizada!',
      'updateCheckNetworkError' =>
        'No se pudieron comprobar las actualizaciones en este momento.',
      'updateDialogTitle' => 'Actualización disponible',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          '¡La versión ${latest} está disponible! (Actual: ${current})\n\nHay una actualización compatible con tu dispositivo lista para instalarse.',
      'updateDownloadAndInstall' => 'Descargar e instalar',
      'updateInstallPermissionRequired' =>
        'Se necesita permiso para instalar actualizaciones.',
      'updateDownloadingTitle' => 'Descargando actualización...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'No se pudo abrir el instalador: ${message}',
      'updateDownloadFailed' => 'Error en la descarga. Comprueba tu conexión.',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Es hora de tomar ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Programado para el ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Programado para ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Programado para el ${weekday}',
      'addSchedule' => 'Agregar un horario',
      'addScheduleToGetStarted' => 'Agrega un horario para comenzar.',
      'newSchedule' => 'Nuevo horario',
      'every' => 'Cada',
      'days' => 'días',
      'startDate' => 'Fecha de inicio',
      'pickATime' => 'Elegir una hora',
      'addIntakeTime' => 'Agregar una hora',
      'editScheduleInfo' => 'Editar información del horario',
      'scheduling' => 'Programación',
      'editSchedule' => 'Editar horario',
      'deleteSchedule' => ({required Object name}) => '¿Eliminar ${name}?',
      'addNotification' => 'Agregar una notificación',
      'empty_intakes' => 'Las dosis tomadas aparecerán aquí',
      'chooseSchedule' => 'Elegir un horario',
      'addSchedulesFirst' => 'Añade algún horario primero.',
      'editIntake' => 'Editar toma',
      'date' => 'Fecha',
      'amount' => 'Cantidad',
      'takenAmount' => 'Cantidad tomada',
      'wastedAmount' => 'Cantidad desperdiciada',
      'none' => 'Ninguno',
      'supplyItem' => 'Elemento de suministro',
      'injectionSide' => 'Lado de inyección',
      'deleteIntake' => '¿Eliminar esta toma?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Tomar ${scheduleName}',
      'takeIntake' => 'Registrar toma',
      'intakeRecorded' => 'Toma registrada',
      'needleDeadSpace' => 'Espacio muerto de la aguja',
      'notes' => 'Notas',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'bloodTestsTitle' => 'Análisis de sangre',
      'empty_blood_tests' =>
        'Los análisis de sangre registrados aparecerán aquí. ¡Empieza con el botón Añadir!',
      'addBloodTest' => 'Añadir un análisis de sangre',
      'editBloodTest' => 'Editar análisis de sangre',
      'newBloodTest' => 'Nuevo análisis de sangre',
      'deleteBloodTest' => '¿Eliminar este análisis de sangre?',
      'estradiolLevelLabel' => 'Nivel de estradiol',
      'testosteroneLevelLabel' => 'Nivel de testosterona',
      'bloodTestDateLabel' => 'Fecha del análisis',
      'chartNowConcentration' => ({required Object value}) => 'Ahora ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' => 'Sin suministros. Añade un elemento para comenzar.',
      'newItem' => 'Nuevo elemento',
      'adminRoute' => 'Vía de administración',
      'totalAmount' => 'Cantidad total',
      'concentration' => 'Concentración',
      'editItem' => 'Editar elemento',
      'usedAmount' => 'Cantidad usada',
      'deleteItem' => ({required Object name}) => '¿Eliminar ${name}?',
      'supplyType' => 'Tipo',
      'syringe' => 'Jeringas',
      'wipe' => 'Toallitas',
      'needle' => 'Agujas',
      'gloves' => 'Guantes',
      'bandage' => 'Tiritas',
      'add' => 'Añadir',
      'save' => 'Guardar',
      'cancel' => 'Cancelar',
      'next' => 'Siguiente',
      'delete' => 'Eliminar',
      'deleteElement' => '¿Eliminar este elemento?',
      'irreversibleAction' => 'Esta acción no se puede deshacer.',
      'name' => 'Nombre',
      'molecule' => 'Molécula',
      'ester' => 'Éster',
      'estradiol' => 'Estradiol',
      'progesterone' => 'Progesterona',
      'testosterone' => 'Testosterona',
      'nandrolone' => 'Nandrolona',
      'dihydrotestosterone' => 'Dihidrotestosterona',
      'spironolactone' => 'Espironolactona',
      'cyproteroneAcetate' => 'Acetato de ciproterona',
      'leuprorelinAcetate' => 'Acetato de leuprorelina',
      'bicalutamide' => 'Bicalutamida',
      'decapeptyl' => 'Decapeptyl',
      'raloxifene' => 'Raloxifeno',
      'tamoxifen' => 'Tamoxifeno',
      'finasteride' => 'Finasterida',
      'dutasteride' => 'Dutasterida',
      'minoxidil' => 'Minoxidil',
      'pioglitazone' => 'Pioglitazona',
      'enanthate' => 'Enantato',
      'valerate' => 'Valerato',
      'cypionate' => 'Cipionato',
      'undecylate' => 'Undecilato',
      'benzoate' => 'Benzoato',
      'cypionateSuspension' => 'Suspensión de cipionato',
      'medicationEstradiolEnanthate' => 'Enantato de estradiol',
      'medicationEstradiolValerate' => 'Valerato de estradiol',
      'medicationEstradiolCypionate' => 'Cipionato de estradiol',
      'medicationEstradiolUndecylate' => 'Undecilato de estradiol',
      'medicationEstradiolBenzoate' => 'Benzoato de estradiol',
      'medicationEstradiolCypionateSuspension' =>
        'Suspensión de cipionato de estradiol',
      'medicationTestosteroneEnanthate' => 'Enantato de testosterona',
      'medicationTestosteroneValerate' => 'Valerato de testosterona',
      'medicationTestosteroneCypionate' => 'Cipionato de testosterona',
      'medicationTestosteroneUndecylate' => 'Undecilato de testosterona',
      'medicationTestosteroneBenzoate' => 'Benzoato de testosterona',
      'medicationTestosteroneCypionateSuspension' =>
        'Suspensión de cipionato de testosterona',
      'injection' => 'Inyección',
      'oral' => 'Oral',
      'sublingual' => 'Sublingual',
      'patch' => 'Parche',
      'gel' => 'Gel',
      'implant' => 'Implante',
      'suppository' => 'Supositorio',
      'transdermalSpray' => 'Spray transdérmico',
      'transdermalDrops' => 'Gotas transdérmicas',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'injectionSideLeft' => 'Izquierda',
      'injectionSideRight' => 'Derecha',
      'placementLeft' => 'Lado izquierdo',
      'placementRight' => 'Lado derecho',
      'requiredField' => 'Campo obligatorio',
      'mustBePositiveNumber' => 'Debe ser un número positivo',
      'invalidTotalAmount' => 'Cantidad total no válida',
      'cannotExceedTotalCapacity' => 'No puede superar la capacidad total',
      'medicationItemsFilter' => 'Medicamentos',
      'medicationItemType' => 'Medicamento',
      'scheduleFrequencyMonthly' => 'Mensual',
      'anchorToLastIntake' => 'Recalcular según la última toma',
      'anchorToLastIntakeDescription' =>
        'Programa la siguiente toma un intervalo completo después de la última vez que la tomaste',
      'medicalSettings' => 'Ajustes médicos',
      'theme' => 'Tema',
      'themeCustomizeColors' => 'Personaliza los colores de la aplicación',
      'customThemeEnabled' => 'Tema personalizado',
      'themeGenerate' => 'Generar',
      'themeVariant' => 'Variante',
      'themeContrast' => 'Contraste',
      'themeContrastStandard' => 'Estándar',
      'themeContrastMedium' => 'Medio',
      'themeContrastHigh' => 'Alto',
      'dayOfMonth' => 'Día del mes',
      'months' => 'meses',
      'HrtCounter' => 'Tiempo en TH',
      'HrtCounterDescription' =>
        'Muestra cuánto tiempo llevas en TH y el total de tomas',
      'hrtWidgetPlaceholder' => 'Abre Mona para registrar tu primera toma',
      'hrtWidgetPreviewSample' => 'En TH desde hace 8 meses',
      'hrtWidgetPreviewIntakeSample' => '16 tomas registradas',
      'startOfDay' => 'Inicio del día',
      'startOfDayDescription' => ({required Object time}) =>
          'El tiempo antes de las ${time} cuenta para el día anterior',
      'chooseItem' => 'Elige un elemento',
      'noItemsToAdd' => 'No hay elementos disponibles',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Dosis por ${unit}',
      'allItemsFilter' => 'Todos',
      'genericItems' => 'Consumibles',
      'genericItemType' => 'Consumible',
      'placementLeftThigh' => 'Muslo izquierdo',
      'placementRightThigh' => 'Muslo derecho',
      'placementLeftArm' => 'Brazo izquierdo',
      'placementRightArm' => 'Brazo derecho',
      'placementLeftButtock' => 'Glúteo izquierdo',
      'placementRightButtock' => 'Glúteo derecho',
      'placementLeftAbdomen' => 'Abdomen izquierdo',
      'placementRightAbdomen' => 'Abdomen derecho',
      'injectionSites' => 'Zonas de inyección',
      'injectionSitesDescription' => 'Gestiona las zonas entre las que rotas',
      'addInjectionSite' => 'Añadir zona',
      'customSiteLabel' => 'Nombre de zona personalizado',
      'noInjectionSitesYet' => 'Aún no hay zonas',
      'noInjectionAddOneToGetStarted' =>
        'Añade una zona a continuación para empezar.',
      'placementSuggestionPerScheduleTitle' => 'Sugerir por horario',
      'placementSuggestionPerScheduleDescription' =>
        'Basa la sugerencia de la siguiente zona únicamente en el historial de este horario.',
      'mustBeBetween1And28' => 'Debe estar entre 1 y 28',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'hace ${count} día',
            many: 'hace ${count} días',
            other: 'hace ${count} días',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'en ${count} día',
            many: 'en ${count} días',
            other: 'en ${count} días',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'Cada ${count} día',
            many: 'Cada ${count} días',
            other: 'Cada ${count} días',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: '${count} creado',
            many: '${count} creados',
            other: '${count} creados',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: '${count} ${unit} restantes',
            many: 'Quedan ${count} ${unit}',
            other: '${count} ${unit} restantes',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: '1 jeringa restante',
            many: 'Quedan ${count} jeringas',
            other: '${count} jeringas restantes',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: '1 toallita restante',
            many: 'Quedan ${count} toallitas',
            other: '${count} toallitas restantes',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: '1 aguja restante',
            many: 'Quedan ${count} agujas',
            other: '${count} agujas restantes',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: '1 guante restante',
            many: 'Quedan ${count} guantes',
            other: '${count} guantes restantes',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: '1 tirita restante',
            many: 'Quedan ${count} vendas',
            other: '${count} tiritas restantes',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'ml',
            many: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'pastilla',
            many: 'comprimidos',
            other: 'pastillas',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'parche',
            many: 'parches',
            other: 'parches',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'pulsación',
            many: 'pulsaciones',
            other: 'pulsaciones',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'implante',
            many: 'implantes',
            other: 'implantes',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'supositorio',
            many: 'supositorios',
            other: 'supositorios',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'pulverización',
            many: 'pulverizaciones',
            other: 'pulverizaciones',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'Día ${day}, cada mes',
            many: 'Día ${day}, cada ${count} meses',
            other: 'Día ${day}, cada ${count} meses',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'En TH desde hace 1 día',
            many: 'En TH desde hace ${count} días',
            other: 'En TH desde hace ${count} días',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'En TH desde hace 1 semana',
            many: 'En TH desde hace ${count} semanas',
            other: 'En TH desde hace ${count} semanas',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'En TH desde hace 1 mes',
            many: 'En TH desde hace ${count} meses',
            other: 'En TH desde hace ${count} meses',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: 'En TH desde hace 1 año',
            many: 'En TH desde hace ${count} años',
            other: 'En TH desde hace ${count} años',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('es'))(
            count,
            one: '1 toma registrada',
            many: '${count} tomas registradas',
            other: '${count} tomas registradas',
          ),
      _ => null,
    };
  }
}
