import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:foodtek/view/screens/section%203/favorites_screen.dart';
import 'package:foodtek/view/screens/section%203/home_screen.dart';
import 'package:foodtek/view/screens/section%204/delete_cart_screen.dart';
import 'package:foodtek/view/screens/section%204/history_screen.dart';
import 'package:foodtek/view/screens/section%206/detail_profile_screen.dart';
import 'package:foodtek/view/screens/section%206/profile_screen.dart';
import 'package:foodtek/view/screens/section%206/track_location_screen.dart';

import '../../widgets/bottom_nav_Item_widget.dart';
import '../section 2/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;
  bool pushNotifications = true;
  bool promotionalNotifications = false;

  void onItemTapped(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen())),
        ),
        title: Text(AppLocalizations.of(context)!.profile,
            style: TextStyle(fontSize: width * .06, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: height * .02),
              CircleAvatar(
                radius: width * .15,
                backgroundImage: const AssetImage('assets/images/profile.png'),
              ),
              SizedBox(height: height * .02),
              Text('Ahmad Daboor',
                  style: TextStyle(fontSize: width * .045, fontWeight: FontWeight.bold)),
              Text('ahmad1709@gmail.com',
                  style: TextStyle(fontSize: width * .035, color: Colors.grey)),
              SizedBox(height: height * .02),

              // ـــ بطاقة الحساب ـــ
              Container(
                width: width * .9,
                padding: EdgeInsets.all(width * .04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.my_account,
                        style: TextStyle(fontSize: width * .045, fontWeight: FontWeight.w500)),
                    SizedBox(height: width * .02),
                    _tile(
                      icon: Icons.person_outline,
                      text: AppLocalizations.of(context)!.personal_information,
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) =>  DetailProfileScreen())),
                      width: width,
                    ),
                    _tile(
                      icon: Icons.language,
                      text: AppLocalizations.of(context)!.language,
                      trailing: TextButton(onPressed: () {}, child: const Text('عربية')),
                      width: width,
                    ),
                    _tile(
                      icon: Icons.privacy_tip_outlined,
                      text: AppLocalizations.of(context)!.privacy_policy,
                      width: width,
                    ),
                    _tile(
                      icon: Icons.settings_outlined,
                      text: AppLocalizations.of(context)!.setting,
                      width: width,
                    ),
                  ],
                ),
              ),

              // ـــ الإشعارات ـــ
              Padding(
                padding: EdgeInsets.all(width * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.notifications,
                        style: TextStyle(fontSize: width * .045, fontWeight: FontWeight.w500)),
                    _switchTile(
                      icon: Icons.notifications_none,
                      text: AppLocalizations.of(context)!.push_notifications,
                      value: pushNotifications,
                      onChanged: (v) => setState(() => pushNotifications = v),
                      width: width,
                    ),
                    _switchTile(
                      icon: Icons.notifications_none,
                      text: AppLocalizations.of(context)!.promotional_notifications,
                      value: promotionalNotifications,
                      onChanged: (v) => setState(() => promotionalNotifications = v),
                      width: width,
                    ),
                  ],
                ),
              ),

              // ـــ المزيد ـــ
              Padding(
                padding: EdgeInsets.all(width * .04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.more,
                        style: TextStyle(fontSize: width * .045, fontWeight: FontWeight.w500)),
                    _tile(
                      icon: Icons.help_outline,
                      text: AppLocalizations.of(context)!.help_center,
                      onTap: () {},
                      width: width,
                    ),
                    _tile(
                      icon: Icons.logout,
                      text: AppLocalizations.of(context)!.log_out,
                      iconColor: Colors.red,
                      textColor: Colors.red,
                      onTap: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) =>  LoginScreen())),
                      width: width,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(width),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const DeleteCartScreen())),
        child: Icon(Icons.shopping_cart, color: Colors.white, size: width * .08),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  /// bottom‑navigation
  BottomAppBar _buildBottomBar(double width) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItemWidget(
              icon: Icons.home,
              label: AppLocalizations.of(context)!.home,
              isSelected: selectedIndex == 4,
              onTap: () => _navigate(4, const HomeScreen()),
            ),
            BottomNavItemWidget(
              icon: Icons.favorite,
              label: AppLocalizations.of(context)!.favorite,
              isSelected: selectedIndex == 1,
              onTap: () => _navigate(1, const FavoritesScreen()),
            ),
            const SizedBox(width: 40),
            BottomNavItemWidget(
              icon: Icons.home_work,
              label: AppLocalizations.of(context)!.track,
              isSelected: selectedIndex == 3,
              onTap: () => _navigate(3, const TrackLocationScreen()),
            ),
            BottomNavItemWidget(
              icon: Icons.person,
              label: AppLocalizations.of(context)!.profile,
              isSelected: selectedIndex == 0,
              onTap: () => _navigate(0, const ProfileScreen()),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate(int idx, Widget page) {
    onItemTapped(idx);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  /// reusable tiles
  Widget _tile({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    Widget? trailing,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
    required double width,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: width * .06, color: iconColor),
      title: Text(text,
          style: TextStyle(fontSize: width * .04, fontWeight: FontWeight.w400, color: textColor)),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _switchTile({
    required IconData icon,
    required String text,
    required bool value,
    required ValueChanged<bool> onChanged,
    required double width,
  }) {
    return ListTile(
      leading: Icon(icon, size: width * .06),
      title: Text(text,
          style: TextStyle(fontSize: width * .04, fontWeight: FontWeight.w400, color: Colors.black)),
      trailing: Transform.scale(
        scale: .8,
        child: Switch(value: value, onChanged: onChanged, activeColor: Colors.green),
      ),
    );
  }
}
