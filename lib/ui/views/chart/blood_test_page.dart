import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mona/data/model/blood_test.dart';
import 'package:mona/data/providers/blood_test_provider.dart';
import 'package:mona/ui/views/chart/edit_blood_test_page.dart';
import 'package:mona/ui/views/chart/new_blood_test_page.dart';
import 'package:mona/ui/widgets/dialogs.dart';
import 'package:mona/ui/widgets/main_page_wrapper.dart';
import 'package:provider/provider.dart';

class BloodTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloodTestProvider = context.watch<BloodTestProvider>();

    List<BloodTest> bloodtests = bloodTestProvider.bloodtests;

    return Scaffold(
      appBar: AppBar(title: Text('Blood Tests')),
      body: Consumer<BloodTestProvider>(
          builder: (context, bloodTestProvider, child) {
        return MainPageWrapper(
            isLoading: bloodTestProvider.isLoading,
            isEmpty: bloodtests.isEmpty,
            emptyMessage: 'Taken blood tests will appear here',
            child: ListView.builder(
              itemCount: bloodtests.length,
              itemBuilder: (context, index) {
                BloodTest test = bloodTestProvider.bloodtestsSortedDesc[index];
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
        tooltip: 'Add a blood test',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBloodTestTile(BuildContext context, BloodTest bloodtest,
      BloodTestProvider bloodTestProvider) {
    final dateText = DateFormat.yMMMd().format(bloodtest.date);
    return ListTile(
      title: Text(dateText),
      subtitle: Text(
          'Estradiol : ${bloodtest.estradiolLevels} pg/mL, Testosterone : ${bloodtest.testosteroneLevels} ng/dL'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
          fullscreenDialog: true,
          builder: (context) => EditBloodTestPage(bloodtest: bloodtest),
        ));
      },
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () async {
          final confirmed = await Dialogs.confirmDelete(context);
          if (confirmed == true) {
            bloodTestProvider.deleteBloodTest(bloodtest);
          }
        },
      ),
    );
  }
}
