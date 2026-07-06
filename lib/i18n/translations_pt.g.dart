///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsPt extends Translations
    with BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsPt(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver,
      TranslationMetadata<AppLocale, Translations>? meta})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = meta ??
            TranslationMetadata(
              locale: AppLocale.pt,
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

  /// Metadata for the translations of <pt>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) =>
      $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

  late final TranslationsPt _root = this; // ignore: unused_field

  @override
  TranslationsPt $copyWith(
          {TranslationMetadata<AppLocale, Translations>? meta}) =>
      TranslationsPt(meta: meta ?? this.$meta);

  // Translations
  @override
  String get appTitle => 'Mona';
  @override
  String get nav_home => 'Mona';
  @override
  String get nav_intakes => 'Doses';
  @override
  String get nav_levels => 'Níveis';
  @override
  String get nav_supplies => 'Suprimentos';
  @override
  String get takeAnIntake => 'Registrar uma dose';
  @override
  String get addAnItem => 'Adicionar um item';
  @override
  String get empty_home => 'Comece adicionando um cronograma em Configurações';
  @override
  String get allDone => 'Tudo pronto!';
  @override
  String get noIntakesDue => 'Nenhuma dose pendente hoje';
  @override
  String get upcoming => 'Próximos';
  @override
  String get taken => 'Tomado';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        other: 'há ${count} dias',
      );
  @override
  String get yesterday => 'ontem';
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        other: 'em ${count} dias',
      );
  @override
  String get tomorrow => 'amanhã';
  @override
  String get lastTaken => 'Última dose';
  @override
  String get neverTakenYet => 'Ainda não tomado';
  @override
  String get scheduleFrequencyDaily => 'Todos os dias';
  @override
  String scheduleFrequencyEveryNDays({required num days}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        days,
        other: 'A cada ${days} dias',
      );
  @override
  String get scheduleFrequencyInterval => 'Intervalo';
  @override
  String get scheduleFrequencyWeekly => 'Semanal';
  @override
  String get newUpdateAvailable => 'Uma nova atualização está disponível!';
  @override
  String get goToSettings => 'Ir para Configurações';
  @override
  String get settingsTitle => 'Configurações';
  @override
  String get notifications => 'Notificações';
  @override
  String get schedulesAndNotifications => 'Cronogramas e notificações';
  @override
  String get general => 'Geral';
  @override
  String get schedules => 'Cronogramas';
  @override
  String get noSchedules => 'Sem cronogramas';
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} criado',
        other: '${count} criados',
      );
  @override
  String get language => 'Idioma';
  @override
  String get languageFollowDevice => 'Seguir o idioma do dispositivo';
  @override
  String get selectLanguage => 'Selecionar idioma';
  @override
  String get enableNotifications => 'Ativar notificações';
  @override
  String get enableNotificationsDescription => 'Enviar lembretes';
  @override
  String get notificationsDisabledTitle => 'As notificações estão desativadas';
  @override
  String get clickToOpenSettings => 'Toque para abrir as configurações';
  @override
  String get exactRemindersDisabled =>
      'Os horários exatos de lembrete estão desativados';
  @override
  String get remindersDelayed =>
      'Os lembretes podem atrasar um pouco. Toque para abrir as configurações.';
  @override
  String get autoUpdate => 'Atualização automática';
  @override
  String get autoUpdateDescription =>
      'Verificar automaticamente por atualizações ao iniciar o app';
  @override
  String get checkForUpdates => 'Verificar atualizações';
  @override
  String get checkForUpdatesDescription =>
      'Verificar manualmente a versão mais recente\nIsso se conectará à Internet\n(Nenhum dado será enviado)';
  @override
  String appVersion({required Object version}) => 'Versão do Mona ${version}';
  @override
  String backupSavedTo({required Object path}) => 'Backup salvo em: ${path}';
  @override
  String exportFailed({required Object error}) => 'Falha ao exportar: ${error}';
  @override
  String get importDataTitle => 'Importar dados';
  @override
  String get importDataSubtitle => 'Restaurar dados de um backup JSON';
  @override
  String get importDataOverwriteWarning =>
      'Isso substituirá todos os seus dados atuais pelo backup. Esta ação não pode ser desfeita. Deseja continuar?';
  @override
  String get importConfirm => 'Importar';
  @override
  String get importSuccessfulTitle => 'Importação concluída';
  @override
  String get importRestartRequired =>
      'Reinicie o app para aplicar os dados restaurados.';
  @override
  String get closeApp => 'Fechar app';
  @override
  String importFailed({required Object error}) => 'Falha ao importar: ${error}';
  @override
  String get updates => 'Atualizações';
  @override
  String get dataManagement => 'Gestão de dados';
  @override
  String get exportDataTitle => 'Exportar dados';
  @override
  String get exportDataSubtitle => 'Salve seus dados num ficheiro JSON';
  @override
  String get units => 'Unidades';
  @override
  String get updateNoCompatibleApk =>
      'Não foi encontrada nenhuma atualização compatível com o seu dispositivo.';
  @override
  String get updateAppUpToDate => 'A sua aplicação está atualizada!';
  @override
  String get updateCheckNetworkError =>
      'Não foi possível verificar atualizações neste momento.';
  @override
  String get updateDialogTitle => 'Atualização disponível';
  @override
  String updateDialogBody({required Object latest, required Object current}) =>
      'A versão ${latest} está disponível! (Atual: ${current})\n\nHá uma atualização compatível com o seu dispositivo pronta a instalar.';
  @override
  String get updateDownloadAndInstall => 'Transferir e instalar';
  @override
  String get updateInstallPermissionRequired =>
      'É necessária permissão para instalar atualizações.';
  @override
  String get updateDownloadingTitle => 'A transferir atualização...';
  @override
  String updateFailedOpenInstaller({required Object message}) =>
      'Falha ao abrir o instalador: ${message}';
  @override
  String get updateDownloadFailed =>
      'Falha na transferência. Verifique a sua ligação.';
  @override
  String notificationMedicationReminderTitle({required Object scheduleName}) =>
      'Hora de tomar ${scheduleName}';
  @override
  String notificationMedicationReminderBodyDate({required Object date}) =>
      'Agendado para ${date}';
  @override
  String notificationMedicationReminderBodyTime({required Object time}) =>
      'Agendado para ${time}';
  @override
  String notificationMedicationReminderBodyWeekday({required Object weekday}) =>
      'Agendado para ${weekday}';
  @override
  String get addSchedule => 'Adicionar cronograma';
  @override
  String get addScheduleToGetStarted => 'Adicione um cronograma para começar.';
  @override
  String get newSchedule => 'Novo cronograma';
  @override
  String get every => 'A cada';
  @override
  String get days => 'dias';
  @override
  String get startDate => 'Data de início';
  @override
  String get pickATime => 'Escolher um horário';
  @override
  String get addIntakeTime => 'Adicionar horário';
  @override
  String get editScheduleInfo => 'Editar informações do cronograma';
  @override
  String get scheduling => 'Programação';
  @override
  String get noNotifications => 'Sem notificações';
  @override
  String notificationsCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        other: '${count} notificações',
      );
  @override
  String get editSchedule => 'Editar cronograma';
  @override
  String deleteSchedule({required Object name}) => 'Excluir ${name}?';
  @override
  String get scheduleNotifications => 'Notificações do cronograma';
  @override
  String get addNotification => 'Adicionar notificação';
  @override
  String noNotificationsForSchedule({required Object scheduleName}) =>
      'Sem notificações para ${scheduleName}. Você pode adicionar uma usando o botão Adicionar.';
  @override
  String get notificationsUpdated => 'As notificações foram atualizadas!';
  @override
  String get notificationsUpdatedDescription =>
      'Cada cronograma agora tem suas próprias notificações.\n\nConfigure as notificações para seus cronogramas para garantir que você não perca nada.';
  @override
  String get dontShowAgain => 'Não mostrar novamente';
  @override
  String get scheduleSettings => 'Configurações do cronograma';
  @override
  String get empty_intakes => 'As doses registradas aparecerão aqui';
  @override
  String get chooseSchedule => 'Escolher um cronograma';
  @override
  String get addSchedulesFirst => 'Adicione cronogramas primeiro.';
  @override
  String get editIntake => 'Editar dose';
  @override
  String get date => 'Data';
  @override
  String get amount => 'Quantidade';
  @override
  String get takenAmount => 'Quantidade tomada';
  @override
  String get wastedAmount => 'Quantidade desperdiçada';
  @override
  String get none => 'Nenhum';
  @override
  String get supplyItem => 'Item de suprimento';
  @override
  String get injectionSide => 'Lado da injeção';
  @override
  String get deleteIntake => 'Excluir esta dose?';
  @override
  String takeMedication({required Object scheduleName}) =>
      'Tomar ${scheduleName}';
  @override
  String get takeIntake => 'Registrar dose';
  @override
  String get intakeRecorded => 'Dose registrada';
  @override
  String get needleDeadSpace => 'Espaço morto da agulha';
  @override
  String get notes => 'Notas';
  @override
  String get microliters => 'μL';
  @override
  String get milliliters => 'mL';
  @override
  String get empty_levels => 'As injeções de estradiol aparecerão nesta aba';
  @override
  String get bloodTestsTitle => 'Exames de sangue';
  @override
  String get empty_blood_tests =>
      'Os exames de sangue registados aparecem aqui. Comece pelo botão Adicionar!';
  @override
  String get addBloodTest => 'Adicionar exame de sangue';
  @override
  String get editBloodTest => 'Editar exame de sangue';
  @override
  String get newBloodTest => 'Novo exame de sangue';
  @override
  String get deleteBloodTest => 'Eliminar este exame de sangue?';
  @override
  String get estradiolLevelLabel => 'Nível de estradiol';
  @override
  String get testosteroneLevelLabel => 'Nível de testosterona';
  @override
  String get bloodTestDateLabel => 'Data do exame';
  @override
  String chartNowConcentration({required Object value}) => 'Agora ${value}';
  @override
  String chartBloodTestLevelTooltip(
          {required Object date, required Object level}) =>
      '${date}: ${level}';
  @override
  String get empty_supplies =>
      'Sem suprimentos. Adicione um item para começar.';
  @override
  String get newItem => 'Novo item';
  @override
  String get adminRoute => 'Via de administração';
  @override
  String get totalAmount => 'Quantidade total';
  @override
  String get concentration => 'Concentração';
  @override
  String get editItem => 'Editar item';
  @override
  String get usedAmount => 'Quantidade usada';
  @override
  String deleteItem({required Object name}) => 'Excluir ${name}?';
  @override
  String remaining({required num amount, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        amount,
        other: '${amount} ${unit} restantes',
      );
  @override
  String get supplyType => 'Tipo';
  @override
  String get syringe => 'Seringas';
  @override
  String get wipe => 'Toalhitas';
  @override
  String get needle => 'Agulhas';
  @override
  String get gloves => 'Luvas';
  @override
  String get bandage => 'Pensos';
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 seringa restante',
        other: '${count} seringas restantes',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 toalhita restante',
        other: '${count} toalhitas restantes',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 agulha restante',
        other: '${count} agulhas restantes',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 luva restante',
        other: '${count} luvas restantes',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 penso restante',
        other: '${count} pensos restantes',
      );
  @override
  String get add => 'Adicionar';
  @override
  String get save => 'Salvar';
  @override
  String get cancel => 'Cancelar';
  @override
  String get next => 'Próximo';
  @override
  String get delete => 'Eliminar';
  @override
  String get deleteElement => 'Eliminar este item?';
  @override
  String get irreversibleAction => 'Esta ação não pode ser desfeita.';
  @override
  String get name => 'Nome';
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
  String get dihydrotestosterone => 'Di-hidrotestosterona';
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
  String get cypionateSuspension => 'Suspensão de cipionato';
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
      'Suspensão de cipionato de estradiol';
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
      'Suspensão de cipionato de testosterona';
  @override
  String get injection => 'Injeção';
  @override
  String get oral => 'Oral';
  @override
  String get sublingual => 'Sublingual';
  @override
  String get patch => 'Adesivo';
  @override
  String get gel => 'Gel';
  @override
  String get implant => 'Implante';
  @override
  String get suppository => 'Supositório';
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
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'comprimido',
        other: 'comprimidos',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'adesivo',
        other: 'adesivos',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'aplicação',
        other: 'aplicações',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'implante',
        other: 'implantes',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'supositório',
        other: 'supositórios',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'pulverização',
        other: 'pulverizações',
      );
  @override
  String get injectionSideLeft => 'Esquerda';
  @override
  String get injectionSideRight => 'Direita';
  @override
  String get intakeSummaryInjectionSideLeft => 'Lado esquerdo';
  @override
  String get intakeSummaryInjectionSideRight => 'Lado direito';
  @override
  String get requiredField => 'Campo obrigatório';
  @override
  String get mustBePositiveNumber => 'Deve ser um número positivo';
  @override
  String get invalidTotalAmount => 'Quantidade total inválida';
  @override
  String get cannotExceedTotalCapacity => 'Não pode exceder a capacidade total';
}

/// The flat map containing all translations for locale <pt>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsPt {
  dynamic _flatMapFunction(String path) {
    return switch (path) {
      'appTitle' => 'Mona',
      'nav_home' => 'Mona',
      'nav_intakes' => 'Doses',
      'nav_levels' => 'Níveis',
      'nav_supplies' => 'Suprimentos',
      'takeAnIntake' => 'Registrar uma dose',
      'addAnItem' => 'Adicionar um item',
      'empty_home' => 'Comece adicionando um cronograma em Configurações',
      'allDone' => 'Tudo pronto!',
      'noIntakesDue' => 'Nenhuma dose pendente hoje',
      'upcoming' => 'Próximos',
      'taken' => 'Tomado',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            other: 'há ${count} dias',
          ),
      'yesterday' => 'ontem',
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            other: 'em ${count} dias',
          ),
      'tomorrow' => 'amanhã',
      'lastTaken' => 'Última dose',
      'neverTakenYet' => 'Ainda não tomado',
      'scheduleFrequencyDaily' => 'Todos os dias',
      'scheduleFrequencyEveryNDays' => ({required num days}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            days,
            other: 'A cada ${days} dias',
          ),
      'scheduleFrequencyInterval' => 'Intervalo',
      'scheduleFrequencyWeekly' => 'Semanal',
      'newUpdateAvailable' => 'Uma nova atualização está disponível!',
      'goToSettings' => 'Ir para Configurações',
      'settingsTitle' => 'Configurações',
      'notifications' => 'Notificações',
      'schedulesAndNotifications' => 'Cronogramas e notificações',
      'general' => 'Geral',
      'schedules' => 'Cronogramas',
      'noSchedules' => 'Sem cronogramas',
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '${count} criado',
            other: '${count} criados',
          ),
      'language' => 'Idioma',
      'languageFollowDevice' => 'Seguir o idioma do dispositivo',
      'selectLanguage' => 'Selecionar idioma',
      'enableNotifications' => 'Ativar notificações',
      'enableNotificationsDescription' => 'Enviar lembretes',
      'notificationsDisabledTitle' => 'As notificações estão desativadas',
      'clickToOpenSettings' => 'Toque para abrir as configurações',
      'exactRemindersDisabled' =>
        'Os horários exatos de lembrete estão desativados',
      'remindersDelayed' =>
        'Os lembretes podem atrasar um pouco. Toque para abrir as configurações.',
      'autoUpdate' => 'Atualização automática',
      'autoUpdateDescription' =>
        'Verificar automaticamente por atualizações ao iniciar o app',
      'checkForUpdates' => 'Verificar atualizações',
      'checkForUpdatesDescription' =>
        'Verificar manualmente a versão mais recente\nIsso se conectará à Internet\n(Nenhum dado será enviado)',
      'appVersion' => ({required Object version}) =>
          'Versão do Mona ${version}',
      'backupSavedTo' => ({required Object path}) => 'Backup salvo em: ${path}',
      'exportFailed' => ({required Object error}) =>
          'Falha ao exportar: ${error}',
      'importDataTitle' => 'Importar dados',
      'importDataSubtitle' => 'Restaurar dados de um backup JSON',
      'importDataOverwriteWarning' =>
        'Isso substituirá todos os seus dados atuais pelo backup. Esta ação não pode ser desfeita. Deseja continuar?',
      'importConfirm' => 'Importar',
      'importSuccessfulTitle' => 'Importação concluída',
      'importRestartRequired' =>
        'Reinicie o app para aplicar os dados restaurados.',
      'closeApp' => 'Fechar app',
      'importFailed' => ({required Object error}) =>
          'Falha ao importar: ${error}',
      'updates' => 'Atualizações',
      'dataManagement' => 'Gestão de dados',
      'exportDataTitle' => 'Exportar dados',
      'exportDataSubtitle' => 'Salve seus dados num ficheiro JSON',
      'units' => 'Unidades',
      'updateNoCompatibleApk' =>
        'Não foi encontrada nenhuma atualização compatível com o seu dispositivo.',
      'updateAppUpToDate' => 'A sua aplicação está atualizada!',
      'updateCheckNetworkError' =>
        'Não foi possível verificar atualizações neste momento.',
      'updateDialogTitle' => 'Atualização disponível',
      'updateDialogBody' => (
              {required Object latest, required Object current}) =>
          'A versão ${latest} está disponível! (Atual: ${current})\n\nHá uma atualização compatível com o seu dispositivo pronta a instalar.',
      'updateDownloadAndInstall' => 'Transferir e instalar',
      'updateInstallPermissionRequired' =>
        'É necessária permissão para instalar atualizações.',
      'updateDownloadingTitle' => 'A transferir atualização...',
      'updateFailedOpenInstaller' => ({required Object message}) =>
          'Falha ao abrir o instalador: ${message}',
      'updateDownloadFailed' =>
        'Falha na transferência. Verifique a sua ligação.',
      'notificationMedicationReminderTitle' =>
        ({required Object scheduleName}) => 'Hora de tomar ${scheduleName}',
      'notificationMedicationReminderBodyDate' => ({required Object date}) =>
          'Agendado para ${date}',
      'notificationMedicationReminderBodyTime' => ({required Object time}) =>
          'Agendado para ${time}',
      'notificationMedicationReminderBodyWeekday' =>
        ({required Object weekday}) => 'Agendado para ${weekday}',
      'addSchedule' => 'Adicionar cronograma',
      'addScheduleToGetStarted' => 'Adicione um cronograma para começar.',
      'newSchedule' => 'Novo cronograma',
      'every' => 'A cada',
      'days' => 'dias',
      'startDate' => 'Data de início',
      'pickATime' => 'Escolher um horário',
      'addIntakeTime' => 'Adicionar horário',
      'editScheduleInfo' => 'Editar informações do cronograma',
      'scheduling' => 'Programação',
      'noNotifications' => 'Sem notificações',
      'notificationsCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            other: '${count} notificações',
          ),
      'editSchedule' => 'Editar cronograma',
      'deleteSchedule' => ({required Object name}) => 'Excluir ${name}?',
      'scheduleNotifications' => 'Notificações do cronograma',
      'addNotification' => 'Adicionar notificação',
      'noNotificationsForSchedule' => ({required Object scheduleName}) =>
          'Sem notificações para ${scheduleName}. Você pode adicionar uma usando o botão Adicionar.',
      'notificationsUpdated' => 'As notificações foram atualizadas!',
      'notificationsUpdatedDescription' =>
        'Cada cronograma agora tem suas próprias notificações.\n\nConfigure as notificações para seus cronogramas para garantir que você não perca nada.',
      'dontShowAgain' => 'Não mostrar novamente',
      'scheduleSettings' => 'Configurações do cronograma',
      'empty_intakes' => 'As doses registradas aparecerão aqui',
      'chooseSchedule' => 'Escolher um cronograma',
      'addSchedulesFirst' => 'Adicione cronogramas primeiro.',
      'editIntake' => 'Editar dose',
      'date' => 'Data',
      'amount' => 'Quantidade',
      'takenAmount' => 'Quantidade tomada',
      'wastedAmount' => 'Quantidade desperdiçada',
      'none' => 'Nenhum',
      'supplyItem' => 'Item de suprimento',
      'injectionSide' => 'Lado da injeção',
      'deleteIntake' => 'Excluir esta dose?',
      'takeMedication' => ({required Object scheduleName}) =>
          'Tomar ${scheduleName}',
      'takeIntake' => 'Registrar dose',
      'intakeRecorded' => 'Dose registrada',
      'needleDeadSpace' => 'Espaço morto da agulha',
      'notes' => 'Notas',
      'microliters' => 'μL',
      'milliliters' => 'mL',
      'empty_levels' => 'As injeções de estradiol aparecerão nesta aba',
      'bloodTestsTitle' => 'Exames de sangue',
      'empty_blood_tests' =>
        'Os exames de sangue registados aparecem aqui. Comece pelo botão Adicionar!',
      'addBloodTest' => 'Adicionar exame de sangue',
      'editBloodTest' => 'Editar exame de sangue',
      'newBloodTest' => 'Novo exame de sangue',
      'deleteBloodTest' => 'Eliminar este exame de sangue?',
      'estradiolLevelLabel' => 'Nível de estradiol',
      'testosteroneLevelLabel' => 'Nível de testosterona',
      'bloodTestDateLabel' => 'Data do exame',
      'chartNowConcentration' => ({required Object value}) => 'Agora ${value}',
      'chartBloodTestLevelTooltip' =>
        ({required Object date, required Object level}) => '${date}: ${level}',
      'empty_supplies' => 'Sem suprimentos. Adicione um item para começar.',
      'newItem' => 'Novo item',
      'adminRoute' => 'Via de administração',
      'totalAmount' => 'Quantidade total',
      'concentration' => 'Concentração',
      'editItem' => 'Editar item',
      'usedAmount' => 'Quantidade usada',
      'deleteItem' => ({required Object name}) => 'Excluir ${name}?',
      'remaining' => ({required num amount, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            amount,
            other: '${amount} ${unit} restantes',
          ),
      'supplyType' => 'Tipo',
      'syringe' => 'Seringas',
      'wipe' => 'Toalhitas',
      'needle' => 'Agulhas',
      'gloves' => 'Luvas',
      'bandage' => 'Pensos',
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 seringa restante',
            other: '${count} seringas restantes',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 toalhita restante',
            other: '${count} toalhitas restantes',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 agulha restante',
            other: '${count} agulhas restantes',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 luva restante',
            other: '${count} luvas restantes',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 penso restante',
            other: '${count} pensos restantes',
          ),
      'add' => 'Adicionar',
      'save' => 'Salvar',
      'cancel' => 'Cancelar',
      'next' => 'Próximo',
      'delete' => 'Eliminar',
      'deleteElement' => 'Eliminar este item?',
      'irreversibleAction' => 'Esta ação não pode ser desfeita.',
      'name' => 'Nome',
      'molecule' => 'Molécula',
      'ester' => 'Éster',
      'estradiol' => 'Estradiol',
      'progesterone' => 'Progesterona',
      'testosterone' => 'Testosterona',
      'nandrolone' => 'Nandrolona',
      'dihydrotestosterone' => 'Di-hidrotestosterona',
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
      'cypionateSuspension' => 'Suspensão de cipionato',
      'medicationEstradiolEnanthate' => 'Enantato de estradiol',
      'medicationEstradiolValerate' => 'Valerato de estradiol',
      'medicationEstradiolCypionate' => 'Cipionato de estradiol',
      'medicationEstradiolUndecylate' => 'Undecilato de estradiol',
      'medicationEstradiolBenzoate' => 'Benzoato de estradiol',
      'medicationEstradiolCypionateSuspension' =>
        'Suspensão de cipionato de estradiol',
      'medicationTestosteroneEnanthate' => 'Enantato de testosterona',
      'medicationTestosteroneValerate' => 'Valerato de testosterona',
      'medicationTestosteroneCypionate' => 'Cipionato de testosterona',
      'medicationTestosteroneUndecylate' => 'Undecilato de testosterona',
      'medicationTestosteroneBenzoate' => 'Benzoato de testosterona',
      'medicationTestosteroneCypionateSuspension' =>
        'Suspensão de cipionato de testosterona',
      'injection' => 'Injeção',
      'oral' => 'Oral',
      'sublingual' => 'Sublingual',
      'patch' => 'Adesivo',
      'gel' => 'Gel',
      'implant' => 'Implante',
      'suppository' => 'Supositório',
      'transdermalSpray' => 'Spray transdérmico',
      'transdermalDrops' => 'Gotas transdérmicas',
      'unitMilligram' => 'mg',
      'unitPgPerMl' => 'pg/mL',
      'unitPmolPerL' => 'pmol/L',
      'unitNgPerDl' => 'ng/dL',
      'unitNmolPerL' => 'nmol/L',
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'comprimido',
            other: 'comprimidos',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'adesivo',
            other: 'adesivos',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'aplicação',
            other: 'aplicações',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'implante',
            other: 'implantes',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'supositório',
            other: 'supositórios',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'pulverização',
            other: 'pulverizações',
          ),
      'injectionSideLeft' => 'Esquerda',
      'injectionSideRight' => 'Direita',
      'intakeSummaryInjectionSideLeft' => 'Lado esquerdo',
      'intakeSummaryInjectionSideRight' => 'Lado direito',
      'requiredField' => 'Campo obrigatório',
      'mustBePositiveNumber' => 'Deve ser um número positivo',
      'invalidTotalAmount' => 'Quantidade total inválida',
      'cannotExceedTotalCapacity' => 'Não pode exceder a capacidade total',
      _ => null,
    };
  }
}
