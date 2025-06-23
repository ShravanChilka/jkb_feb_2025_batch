import 'package:flutter/material.dart';
import 'package:jkb_feb_2025_batch/features/recently_deleted/view/recently_delete_screen.dart';
import 'package:jkb_feb_2025_batch/features/recently_deleted/view_model/recently_deleted_view_model.dart';
import 'package:provider/provider.dart';

class RecentlyDeleteScreenProvider extends StatelessWidget {
  const RecentlyDeleteScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecentlyDeletedViewModel(),
      child: RecentlyDeleteScreen(),
    );
  }
}
