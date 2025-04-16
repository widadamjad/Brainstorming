import 'package:flutter/material.dart';
import 'package:foodtek/view/screens/section%205/add_card_screen.dart';
import 'package:foodtek/view/screens/section%204/delete_cart_screen.dart';
import 'package:foodtek/view/screens/section%204/history_screen.dart';
import 'package:foodtek/view/screens/section%203/home_screen.dart';
import 'package:foodtek/view/screens/section%206/profile_screen.dart';
import 'package:foodtek/view/screens/section%206/track_location_screen.dart';
import '../../widgets/bottom_nav_Item_widget.dart';
import '../../widgets/carts/cart_total_widget.dart';
import '../section 3/favorites_screen.dart';
import '../section 3/notification_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int selectedIndex2 = 0;

  void onItemTapped2(int index2) {
    setState(() {
      selectedIndex2 = index2;
    });
  }

  final TextEditingController promoController = TextEditingController();
  double discount = 0.0;
  String selectedPayment = 'card';
  String selectedCardType = 'visa';

  void applyPromoCode() {
    String promoCode = promoController.text.trim();
    setState(() {
      if (promoCode == "10") {
        discount = 10.0;
      } else if (promoCode == "20") {
        discount = 20.0;
      } else {
        discount = 0.0;
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Text("Invalid Promo Code"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
    promoController.clear();
  }

  Widget buildSelectionOption({
    required bool isSelected,
    required String label,
    required VoidCallback onTap,
    Widget? icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Selection circle
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.circle_outlined,
                size: 20,
                color: isSelected ? Colors.green : Colors.grey,
              ),
              if (isSelected)
                 Icon(Icons.circle, size: 8, color: Colors.green),
            ],
          ),
           SizedBox(width: 8),
          // Optional icon
          if (icon != null) icon,
          if (icon != null)  SizedBox(width: 8),
          // Label text
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon:  Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 31,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  NotificationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
            AppLocalizations.of(context)!.checkout,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10),
             Text(
                 AppLocalizations.of(context)!.pay_with,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children:  [
                        Icon(
                          Icons.circle_outlined,
                          size: 20,
                          color: Colors.grey,
                        ),
                        Icon(Icons.circle, size: 5, color: Colors.green),
                      ],
                    ),
                     SizedBox(width: 12),
                     Text(
                         AppLocalizations.of(context)!.zurab_88_gorgiladze_st,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 36),
                  child: Text(
                      AppLocalizations.of(context)!.georgia_batumi,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ],
            ),
             SizedBox(height: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:  [
                    Icon(Icons.location_on_outlined, color: Colors.green),
                    SizedBox(width: 12),
                    Text(AppLocalizations.of(context)!.noe_5_zhordania_st, style: TextStyle(fontSize: 16)),
                  ],
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 36),
                  child: Text(
                      AppLocalizations.of(context)!.georgia_batumi,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child:  Text(
                    AppLocalizations.of(context)!.change,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                AppLocalizations.of(context)!.promo_code,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                 SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: promoController,
                        decoration: InputDecoration(
                          hintText:AppLocalizations.of(context)!.enter_your_promo,
                          border: OutlineInputBorder(
                            borderRadius:  BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding:  EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 53,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: applyPromoCode,
                        child:  Text(
    AppLocalizations.of(context)!.apply,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
             SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                AppLocalizations.of(context)!.payment_method,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                 SizedBox(height: 10),
                Row(
                  children: [
                    buildSelectionOption(
                      isSelected: selectedPayment == 'card',
                      label: AppLocalizations.of(context)!.card,
                      onTap: () => setState(() => selectedPayment = 'card'),
                    ),
                     SizedBox(width: 20),
                    buildSelectionOption(
                      isSelected: selectedPayment == 'cash',
                      label: AppLocalizations.of(context)!.cash,
                      onTap: () => setState(() => selectedPayment = 'cash'),
                    ),
                  ],
                ),
              ],
            ),
             SizedBox(height: 20),
            if (selectedPayment == 'card') ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
    AppLocalizations.of(context)!.card_type,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 10),
                  Row(
                    children: [
                      buildSelectionOption(
                        isSelected: selectedCardType == 'visa',
                        label: '',
                        icon: Image.asset("assets/images/mastercard.png",fit: BoxFit.cover,width: 30,height: 30,),
                        onTap: () => setState(() => selectedCardType = 'visa'),
                      ),
                       SizedBox(width: 20),
                      buildSelectionOption(
                        isSelected: selectedCardType == 'paypal',
                        label: '',
                        icon: Image.asset("assets/images/visa.png",fit: BoxFit.cover,width: 40,height: 40,),
                        onTap: () => setState(() => selectedCardType = 'paypal'),
                      ),
                    ],
                  ),
                ],
              ),
               SizedBox(height: 20),
            ],
            CartTotalWidget(
              subtotal: 100.0,
              delivery: 5.0,
              discount: discount,
              onOrderPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCardScreen()));

              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItemWidget(

                icon: Icons.home,
                label: AppLocalizations.of(context)!.home,

                isSelected: selectedIndex2 == 0,
                onTap: () => onItemTapped2(0),
              ),
              BottomNavItemWidget(

                icon: Icons.favorite,
                label: AppLocalizations.of(context)!.favorite,

                isSelected: selectedIndex2 == 1,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesScreen()));
                  onItemTapped2(1);
                },
              ),
              const SizedBox(width: 40), // space for FAB
              BottomNavItemWidget(

                icon: Icons.home_work,
                label: AppLocalizations.of(context)!.track,

                isSelected: selectedIndex2 == 3,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrackLocationScreen()));
                  onItemTapped2(3);
                },
              ),
              BottomNavItemWidget(

                icon: Icons.person,
                label: AppLocalizations.of(context)!.profile,

                isSelected: selectedIndex2 == 4,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                  onItemTapped2(4);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteCartScreen()));

          onItemTapped2(2);
        },
        child:  Icon(Icons.shopping_cart, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}