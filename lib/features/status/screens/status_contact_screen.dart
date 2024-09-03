import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/common/widgets/loader.dart';
import 'package:linkwave/features/status/controller/status_controller.dart';
import 'package:linkwave/features/status/screens/status_screen.dart';
import 'package:linkwave/models/status_model.dart';

class StatusContactScreen extends ConsumerWidget {
  const StatusContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Status>>(
      future: ref.read(statusControllerProvider).getStatus(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var statusData = snapshot.data![index];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, StatusScreen.routeName,
                        arguments: statusData);
                  },
                  child: ListTile(
                    title: Text(
                      statusData.username,
                      style: const TextStyle(fontSize: 18),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        statusData.profilePic,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  indent: 85,
                )
              ],
            );
          },
        );
      },
    );
  }
}
