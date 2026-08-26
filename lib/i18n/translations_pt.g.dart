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
  String get yesterday => 'ontem';
  @override
  String get tomorrow => 'amanhã';
  @override
  String get lastTaken => 'Última dose';
  @override
  String get neverTakenYet => 'Ainda não tomado';
  @override
  String get scheduleFrequencyDaily => 'Todos os dias';
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
  String get editSchedule => 'Editar cronograma';
  @override
  String deleteSchedule({required Object name}) => 'Excluir ${name}?';
  @override
  String get addNotification => 'Adicionar notificação';
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
  String chartLevelTooltip({required Object date, required Object level}) =>
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
  String get injectionSideLeft => 'Esquerda';
  @override
  String get injectionSideRight => 'Direita';
  @override
  String get placementLeft => 'Lado esquerdo';
  @override
  String get placementRight => 'Lado direito';
  @override
  String get requiredField => 'Campo obrigatório';
  @override
  String get mustBePositiveNumber => 'Deve ser um número positivo';
  @override
  String get invalidTotalAmount => 'Quantidade total inválida';
  @override
  String get cannotExceedTotalCapacity => 'Não pode exceder a capacidade total';
  @override
  String get scheduleFrequencyMonthly => 'Mensal';
  @override
  String get anchorToLastIntake => 'Recalcular com base na última toma';
  @override
  String get anchorToLastIntakeDescription =>
      'Agenda a próxima toma um intervalo completo depois da última toma';
  @override
  String get medicalSettings => 'Definições médicas';
  @override
  String get theme => 'Tema';
  @override
  String get themeCustomizeColors => 'Personaliza as cores da aplicação';
  @override
  String get customThemeEnabled => 'Tema personalizado';
  @override
  String get themeGenerate => 'Gerar';
  @override
  String get themeVariant => 'Variante';
  @override
  String get themeContrast => 'Contraste';
  @override
  String get themeContrastStandard => 'Padrão';
  @override
  String get themeContrastMedium => 'Médio';
  @override
  String get themeContrastHigh => 'Alto';
  @override
  String get dayOfMonth => 'Dia do mês';
  @override
  String get months => 'meses';
  @override
  String get HrtCounter => 'Tempo em TH';
  @override
  String get HrtCounterDescription =>
      'Mostra há quanto tempo estás em TH e o total de tomas';
  @override
  String get hrtWidgetPlaceholder =>
      'Abre a Mona para registares a tua primeira toma';
  @override
  String get hrtWidgetPreviewSample => 'Em TH há 8 meses';
  @override
  String get hrtWidgetPreviewIntakeSample => '16 tomas registadas';
  @override
  String get startOfDay => 'Início do dia';
  @override
  String startOfDayDescription({required Object time}) =>
      'O tempo antes das ${time} conta para o dia anterior';
  @override
  String get chooseItem => 'Escolhe um item';
  @override
  String get noItemsToAdd => 'Não há itens disponíveis';
  @override
  String concentrationLabelPerUnit({required Object unit}) =>
      'Dose por ${unit}';
  @override
  String get allItemsFilter => 'Todos';
  @override
  String get medicationItemsFilter => 'Medicação';
  @override
  String get genericItems => 'Consumíveis';
  @override
  String get medicationItemType => 'Medicação';
  @override
  String get genericItemType => 'Consumível';
  @override
  String get placementLeftThigh => 'Coxa esquerda';
  @override
  String get placementRightThigh => 'Coxa direita';
  @override
  String get placementLeftArm => 'Braço esquerdo';
  @override
  String get placementRightArm => 'Braço direito';
  @override
  String get placementLeftButtock => 'Nádega esquerda';
  @override
  String get placementRightButtock => 'Nádega direita';
  @override
  String get placementLeftAbdomen => 'Abdómen esquerdo';
  @override
  String get placementRightAbdomen => 'Abdómen direito';
  @override
  String get injectionSites => 'Zonas de injeção';
  @override
  String get injectionSitesDescription =>
      'Gere as zonas entre as quais alternas';
  @override
  String get addInjectionSite => 'Adicionar zona';
  @override
  String get customSiteLabel => 'Nome de zona personalizado';
  @override
  String get noInjectionSitesYet => 'Ainda não há zonas';
  @override
  String get noInjectionAddOneToGetStarted =>
      'Adiciona uma zona abaixo para começar.';
  @override
  String get placementSuggestionPerScheduleTitle => 'Sugerir por horário';
  @override
  String get placementSuggestionPerScheduleDescription =>
      'Baseia a sugestão da próxima zona apenas no histórico deste horário.';
  @override
  String get mustBeBetween1And28 => 'Deve estar entre 1 e 28';
  @override
  String daysAgoCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'há ${count} dias',
        many: 'há ${count} dias',
        other: 'há ${count} dias',
      );
  @override
  String inDaysCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'em ${count} dias',
        many: 'em ${count} dias',
        other: 'em ${count} dias',
      );
  @override
  String scheduleFrequencyEveryNDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'A cada ${count} dias',
        many: 'A cada ${count} dias',
        other: 'A cada ${count} dias',
      );
  @override
  String schedulesCreated({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} criado',
        many: '${count} criados',
        other: '${count} criados',
      );
  @override
  String remaining({required num count, required Object unit}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} ${unit} restantes',
        many: 'Restam ${count} ${unit}',
        other: '${count} ${unit} restantes',
      );
  @override
  String syringeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 seringa restante',
        many: 'Restam ${count} seringas',
        other: '${count} seringas restantes',
      );
  @override
  String wipeRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 toalhita restante',
        many: 'Restam ${count} toalhitas',
        other: '${count} toalhitas restantes',
      );
  @override
  String needleRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 agulha restante',
        many: 'Restam ${count} agulhas',
        other: '${count} agulhas restantes',
      );
  @override
  String glovesRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 luva restante',
        many: 'Restam ${count} luvas',
        other: '${count} luvas restantes',
      );
  @override
  String bandageRemaining({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '1 penso restante',
        many: 'Restam ${count} pensos',
        other: '${count} pensos restantes',
      );
  @override
  String administrationRouteUnitMl({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'ml',
        many: 'ml',
        other: 'ml',
      );
  @override
  String administrationRouteUnitPill({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'comprimido',
        many: 'comprimidos',
        other: 'comprimidos',
      );
  @override
  String administrationRouteUnitPatch({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'adesivo',
        many: 'adesivos',
        other: 'adesivos',
      );
  @override
  String administrationRouteUnitPump({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'aplicação',
        many: 'aplicações',
        other: 'aplicações',
      );
  @override
  String administrationRouteUnitImplant({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'implante',
        many: 'implantes',
        other: 'implantes',
      );
  @override
  String administrationRouteUnitSuppository({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'supositório',
        many: 'supositórios',
        other: 'supositórios',
      );
  @override
  String administrationRouteUnitSpray({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'pulverização',
        many: 'pulverizações',
        other: 'pulverizações',
      );
  @override
  String scheduleFrequencyOnDayEveryNMonths(
          {required num count, required Object day}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Dia ${day}, a cada ${count} mês',
        many: 'Dia ${day}, a cada ${count} meses',
        other: 'Dia ${day}, a cada ${count} meses',
      );
  @override
  String onHrtForDays({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Em TH há ${count} dia',
        many: 'Em TH há ${count} dias',
        other: 'Em TH há ${count} dias',
      );
  @override
  String onHrtForWeeks({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Em TH há ${count} semana',
        many: 'Em TH há ${count} semanas',
        other: 'Em TH há ${count} semanas',
      );
  @override
  String onHrtForMonths({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Em TH há ${count} mês',
        many: 'Em TH há ${count} meses',
        other: 'Em TH há ${count} meses',
      );
  @override
  String onHrtForYears({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: 'Em TH há ${count} ano',
        many: 'Em TH há ${count} anos',
        other: 'Em TH há ${count} anos',
      );
  @override
  String intakesLoggedCount({required num count}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
        count,
        one: '${count} toma registada',
        many: '${count} tomas registadas',
        other: '${count} tomas registadas',
      );
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
      'yesterday' => 'ontem',
      'tomorrow' => 'amanhã',
      'lastTaken' => 'Última dose',
      'neverTakenYet' => 'Ainda não tomado',
      'scheduleFrequencyDaily' => 'Todos os dias',
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
      'editSchedule' => 'Editar cronograma',
      'deleteSchedule' => ({required Object name}) => 'Excluir ${name}?',
      'addNotification' => 'Adicionar notificação',
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
      'chartLevelTooltip' => ({required Object date, required Object level}) =>
          '${date}: ${level}',
      'empty_supplies' => 'Sem suprimentos. Adicione um item para começar.',
      'newItem' => 'Novo item',
      'adminRoute' => 'Via de administração',
      'totalAmount' => 'Quantidade total',
      'concentration' => 'Concentração',
      'editItem' => 'Editar item',
      'usedAmount' => 'Quantidade usada',
      'deleteItem' => ({required Object name}) => 'Excluir ${name}?',
      'supplyType' => 'Tipo',
      'syringe' => 'Seringas',
      'wipe' => 'Toalhitas',
      'needle' => 'Agulhas',
      'gloves' => 'Luvas',
      'bandage' => 'Pensos',
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
      'injectionSideLeft' => 'Esquerda',
      'injectionSideRight' => 'Direita',
      'placementLeft' => 'Lado esquerdo',
      'placementRight' => 'Lado direito',
      'requiredField' => 'Campo obrigatório',
      'mustBePositiveNumber' => 'Deve ser um número positivo',
      'invalidTotalAmount' => 'Quantidade total inválida',
      'cannotExceedTotalCapacity' => 'Não pode exceder a capacidade total',
      'scheduleFrequencyMonthly' => 'Mensal',
      'anchorToLastIntake' => 'Recalcular com base na última toma',
      'anchorToLastIntakeDescription' =>
        'Agenda a próxima toma um intervalo completo depois da última toma',
      'medicalSettings' => 'Definições médicas',
      'theme' => 'Tema',
      'themeCustomizeColors' => 'Personaliza as cores da aplicação',
      'customThemeEnabled' => 'Tema personalizado',
      'themeGenerate' => 'Gerar',
      'themeVariant' => 'Variante',
      'themeContrast' => 'Contraste',
      'themeContrastStandard' => 'Padrão',
      'themeContrastMedium' => 'Médio',
      'themeContrastHigh' => 'Alto',
      'dayOfMonth' => 'Dia do mês',
      'months' => 'meses',
      'HrtCounter' => 'Tempo em TH',
      'HrtCounterDescription' =>
        'Mostra há quanto tempo estás em TH e o total de tomas',
      'hrtWidgetPlaceholder' =>
        'Abre a Mona para registares a tua primeira toma',
      'hrtWidgetPreviewSample' => 'Em TH há 8 meses',
      'hrtWidgetPreviewIntakeSample' => '16 tomas registadas',
      'startOfDay' => 'Início do dia',
      'startOfDayDescription' => ({required Object time}) =>
          'O tempo antes das ${time} conta para o dia anterior',
      'chooseItem' => 'Escolhe um item',
      'noItemsToAdd' => 'Não há itens disponíveis',
      'concentrationLabelPerUnit' => ({required Object unit}) =>
          'Dose por ${unit}',
      'allItemsFilter' => 'Todos',
      'medicationItemsFilter' => 'Medicação',
      'genericItems' => 'Consumíveis',
      'medicationItemType' => 'Medicação',
      'genericItemType' => 'Consumível',
      'placementLeftThigh' => 'Coxa esquerda',
      'placementRightThigh' => 'Coxa direita',
      'placementLeftArm' => 'Braço esquerdo',
      'placementRightArm' => 'Braço direito',
      'placementLeftButtock' => 'Nádega esquerda',
      'placementRightButtock' => 'Nádega direita',
      'placementLeftAbdomen' => 'Abdómen esquerdo',
      'placementRightAbdomen' => 'Abdómen direito',
      'injectionSites' => 'Zonas de injeção',
      'injectionSitesDescription' => 'Gere as zonas entre as quais alternas',
      'addInjectionSite' => 'Adicionar zona',
      'customSiteLabel' => 'Nome de zona personalizado',
      'noInjectionSitesYet' => 'Ainda não há zonas',
      'noInjectionAddOneToGetStarted' =>
        'Adiciona uma zona abaixo para começar.',
      'placementSuggestionPerScheduleTitle' => 'Sugerir por horário',
      'placementSuggestionPerScheduleDescription' =>
        'Baseia a sugestão da próxima zona apenas no histórico deste horário.',
      'mustBeBetween1And28' => 'Deve estar entre 1 e 28',
      'daysAgoCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'há ${count} dias',
            many: 'há ${count} dias',
            other: 'há ${count} dias',
          ),
      'inDaysCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'em ${count} dias',
            many: 'em ${count} dias',
            other: 'em ${count} dias',
          ),
      'scheduleFrequencyEveryNDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'A cada ${count} dias',
            many: 'A cada ${count} dias',
            other: 'A cada ${count} dias',
          ),
      'schedulesCreated' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '${count} criado',
            many: '${count} criados',
            other: '${count} criados',
          ),
      'remaining' => ({required num count, required Object unit}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '${count} ${unit} restantes',
            many: 'Restam ${count} ${unit}',
            other: '${count} ${unit} restantes',
          ),
      'syringeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 seringa restante',
            many: 'Restam ${count} seringas',
            other: '${count} seringas restantes',
          ),
      'wipeRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 toalhita restante',
            many: 'Restam ${count} toalhitas',
            other: '${count} toalhitas restantes',
          ),
      'needleRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 agulha restante',
            many: 'Restam ${count} agulhas',
            other: '${count} agulhas restantes',
          ),
      'glovesRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 luva restante',
            many: 'Restam ${count} luvas',
            other: '${count} luvas restantes',
          ),
      'bandageRemaining' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '1 penso restante',
            many: 'Restam ${count} pensos',
            other: '${count} pensos restantes',
          ),
      'administrationRouteUnitMl' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'ml',
            many: 'ml',
            other: 'ml',
          ),
      'administrationRouteUnitPill' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'comprimido',
            many: 'comprimidos',
            other: 'comprimidos',
          ),
      'administrationRouteUnitPatch' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'adesivo',
            many: 'adesivos',
            other: 'adesivos',
          ),
      'administrationRouteUnitPump' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'aplicação',
            many: 'aplicações',
            other: 'aplicações',
          ),
      'administrationRouteUnitImplant' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'implante',
            many: 'implantes',
            other: 'implantes',
          ),
      'administrationRouteUnitSuppository' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'supositório',
            many: 'supositórios',
            other: 'supositórios',
          ),
      'administrationRouteUnitSpray' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'pulverização',
            many: 'pulverizações',
            other: 'pulverizações',
          ),
      'scheduleFrequencyOnDayEveryNMonths' => (
              {required num count, required Object day}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'Dia ${day}, a cada ${count} mês',
            many: 'Dia ${day}, a cada ${count} meses',
            other: 'Dia ${day}, a cada ${count} meses',
          ),
      'onHrtForDays' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'Em TH há ${count} dia',
            many: 'Em TH há ${count} dias',
            other: 'Em TH há ${count} dias',
          ),
      'onHrtForWeeks' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'Em TH há ${count} semana',
            many: 'Em TH há ${count} semanas',
            other: 'Em TH há ${count} semanas',
          ),
      'onHrtForMonths' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'Em TH há ${count} mês',
            many: 'Em TH há ${count} meses',
            other: 'Em TH há ${count} meses',
          ),
      'onHrtForYears' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: 'Em TH há ${count} ano',
            many: 'Em TH há ${count} anos',
            other: 'Em TH há ${count} anos',
          ),
      'intakesLoggedCount' => ({required num count}) =>
          (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(
            count,
            one: '${count} toma registada',
            many: '${count} tomas registadas',
            other: '${count} tomas registadas',
          ),
      _ => null,
    };
  }
}
