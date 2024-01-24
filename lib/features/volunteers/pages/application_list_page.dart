import 'package:charity_management_app/features/volunteers/data/volunteer_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplicationListPage extends ConsumerStatefulWidget {
  const ApplicationListPage({super.key});

  @override
  ConsumerState<ApplicationListPage> createState() =>
      _ApplicationListPageState();
}

class _ApplicationListPageState extends ConsumerState<ApplicationListPage> {
  @override
  Widget build(BuildContext context) {
    final volunteerData = ref.watch(volunteerApplicationProvider);
    return Scaffold(
      appBar: AppBar(
          title: Text('Application List'),
      ),
        body: volunteerData.when(
          data: (data) {
          return ListView.builder(
              itemCount: data.length,
            itemBuilder: (context, index) {
                final volunteer = data[index];
              return Card(
                child: ListTile(
                    title: Text(volunteer.volunteerName),
                    subtitle: Text(volunteer.volunteerEmail),
                    trailing: Text(volunteer.volunteerCreatedAt),
                ),
              );
            },
          );
        },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (e, s) => Center(
            child: Text(e.toString()),
          ),
        )

      
    );
  }
}
