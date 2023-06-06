import 'package:eds_test/data/models/user_model.dart';
import 'package:eds_test/data/services/api_service.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:eds_test/presentation/user_page.dart';
import 'package:flutter/material.dart';

import 'shared_widgets/loader.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<UserModel> result = List.empty();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      result = await ApiService.getAllUsers();
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('All Users'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: _isLoading
          ? const Loader()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: result.length,
              separatorBuilder: (_, __) => const SizedBox(
                height: 12,
              ),
              itemBuilder: (context, index) {
                final user = result[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(
                          userModel: user,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: AppColors.gray,
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      horizontalTitleGap: 8,
                      title: Text(
                        user.username,
                        style: AppTextStyles.title,
                      ),
                      subtitle: Text(
                        user.name,
                        style: AppTextStyles.subtitle,
                      ),
                      leading: const Icon(
                        Icons.person,
                        size: 32,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
