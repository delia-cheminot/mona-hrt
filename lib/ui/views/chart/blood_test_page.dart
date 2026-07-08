import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/i18n/build_context_extensions.dart';
import 'package:mona/i18n/helpers/units_l10n.dart';
import 'package:mona/i18n/translations.g.dart';
import 'package:mona/ui/views/chart/edit_blood_test_page.dart';
import 'package:mona/ui/views/chart/new_blood_test_page.dart';
import 'package:mona/ui/widgets/dialogs.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:provider/provider.dart';

class BloodTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloodTestProvider = context.watch<BloodTestProvider>();

    List<BloodTest> bloodtests = bloodTestProvider.bloodtestsSortedDesc;

    return Scaffold(
      appBar: AppBar(title: Text(t.bloodTestsTitle)),
      body: Consumer<BloodTestProvider>(
          builder: (context, bloodTestProvider, child) {
        return MainPageWrapper(
            isLoading: bloodTestProvider.isLoading,
            isEmpty: bloodtests.isEmpty,
            emptyMessage: t.empty_blood_tests,
            child: ListView.builder(
              itemCount: bloodtests.length,
              itemBuilder: (context, index) {
                BloodTest test = bloodtests[index];
                return _buildBloodTestTile(context, test, bloodTestProvider);
              },
            ));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute<void>(
            fullscreenDialog: true,
            builder: (context) => NewBloodTestPage(),
          ));
        },
        tooltip: t.addBloodTest,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBloodTestTile(BuildContext context, BloodTest bloodtest,
      BloodTestProvider bloodTestProvider) {
    final dateText = DateFormat.yMMMd(context.intlLanguageTag)
        .format(bloodtest.localDateTime);
    return ListTile(
      title: Text(dateText),
      subtitle: Text(
        [
          if (bloodtest.estradiolLevels case final e?)
            '${t.estradiol} : ${e.value} ${e.unit.localizedName}',
          if (bloodtest.testosteroneLevels case final l?)
            '${t.testosterone} : ${l.value} ${l.unit.localizedName}',
        ].join('\n'),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) => EditBloodTestPage(bloodtest: bloodtest),
        ));
      },
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () async {
          final confirmed = await Dialogs.confirmDeleteDialog(
              context: context, title: t.deleteBloodTest);
          if (confirmed == true) {
            bloodTestProvider.deleteBloodTest(bloodtest);
          }
        },
      ),
    );
  }
}
