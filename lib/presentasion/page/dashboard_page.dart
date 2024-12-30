import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajaya/config/app_color.dart';
import 'package:yajaya/config/session.dart';
import 'package:yajaya/presentasion/controller/c_dashoard.dart';
import 'package:yajaya/presentasion/controller/c_user.dart';
import 'package:yajaya/presentasion/page/login_page.dart';
import 'package:yajaya/presentasion/page/product_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final cUser = Get.put(CUser());
  final cDashboard = Get.put(CDashboard());

  logout() async {
    bool? yes = await DInfo.dialogConfirmation(
      context,
      'Logout',
      'You sure to logout?',
    );
    if (yes == true) {
      Session.clearUser();
      Get.off(() => const LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () => logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: [
          profileCard(textTheme),
          Padding(
            padding: const EdgeInsets.all(16),
            child: DView.textTitle('Menu'),
          ),
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 110,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            children: [
              menuProduct(textTheme),
              menuHistory(textTheme),
              menuIn(textTheme),
              menuOut(textTheme),
              Obx(() {
                if (cUser.data.level == 'Admin') {
                  return menuEmployee(textTheme);
                } else {
                  return const SizedBox();
                }
              }),
            ],
          )
        ],
      ),
    );
  }

  Widget menuProduct(TextTheme textTheme) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductPage())
            ?.then((value) => cDashboard.setProduct());
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.input,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product',
              style: textTheme.titleLarge,
            ),
            Row(
              children: [
                Obx(() {
                  return Text(
                    cDashboard.product.toString(),
                    style: textTheme.headline4!.copyWith(
                      color: Colors.white,
                    ),
                  );
                }),
                DView.spaceWidth(8),
                const Text(
                  'Item',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container menuHistory(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.input,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'History',
            style: textTheme.titleLarge,
          ),
          Row(
            children: [
              Obx(() {
                return Text(
                  cDashboard.history.toString(),
                  style: textTheme.headline4!.copyWith(
                    color: Colors.white,
                  ),
                );
              }),
              DView.spaceWidth(8),
              const Text(
                'Act',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container menuIn(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.input,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'In',
            style: textTheme.titleLarge,
          ),
          Row(
            children: [
              Obx(() {
                return Text(
                  cDashboard.ins.toString(),
                  style: textTheme.headline4!.copyWith(
                    color: Colors.white,
                  ),
                );
              }),
              DView.spaceWidth(8),
              const Text(
                'Item',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container menuOut(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.input,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Out',
            style: textTheme.titleLarge,
          ),
          Row(
            children: [
              Obx(() {
                return Text(
                  cDashboard.outs.toString(),
                  style: textTheme.headline4!.copyWith(
                    color: Colors.white,
                  ),
                );
              }),
              DView.spaceWidth(8),
              const Text(
                'Item',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container menuEmployee(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.input,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Employe',
            style: textTheme.titleLarge,
          ),
          Obx(() {
            return Text(
              cDashboard.employee.toString(),
              style: textTheme.headline4!.copyWith(
                color: Colors.white,
              ),
            );
          }),
        ],
      ),
    );
  }

  Container profileCard(TextTheme textTheme) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Text(
              cUser.data.name ?? '',
              style: textTheme.titleMedium,
            );
          }),
          DView.spaceHeight(4),
          Obx(() {
            return Text(
              cUser.data.email ?? '',
              style: textTheme.bodyMedium,
            );
          }),
          DView.spaceHeight(8),
          Obx(() {
            return Text(
              '(${cUser.data.level})',
              style: textTheme.caption,
            );
          }),
        ],
      ),
    );
  }
}
