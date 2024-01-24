// import 'package:charity_management_app/features/volunteers/data/volunteer_data_source.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class MyApplicationsPage extends ConsumerStatefulWidget {
//   const MyApplicationsPage({super.key});

//   @override
//   ConsumerState<MyApplicationsPage> createState() => _MyApplicationPageState();
// }

// class _MyApplicationPageState extends ConsumerState<MyApplicationsPage> {
//   @override
//   Widget build(BuildContext context) {
//     final volunteerData = ref.watch(volunteerApplicationProvider);

//     return Scaffold(
//       appBar: AppBar(
//         iconTheme:
//             IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
//         title: Text(
//           'Application List',
//           style: TextStyle(
//             color: Theme.of(context).colorScheme.inversePrimary,
//           ),
//         ),
//       ),
//       body: volunteerData.when(
//         data: (data) {
//           if (data.isEmpty) {
//             return const Center(child: Text('No applications'));
//           } else {
//             return ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 final volData = data[index];
//                 return Text(volData.volunteerName!);
//               },
//             );
//           }
//         },
//         error: (e, s) => Center(
//           child: Text(e.toString()),
//         ),
//         loading: () => const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
