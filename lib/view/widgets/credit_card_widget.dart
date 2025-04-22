import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class CreditCardWidget extends StatefulWidget {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;

  const CreditCardWidget({
    super.key,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
  });

  @override
  _CreditCardWidgetState createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: const DecorationImage(
          image: AssetImage('assets/images/credit_card.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                AppLocalizations.of(
                  context,
                )!.finance,
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                AppLocalizations.of(
                  context,
                )!.visa,
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            widget.cardNumber.isEmpty ? "**** **** **** 2345" : widget.cardNumber,
            style: const TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text( AppLocalizations.of(
                      context,
                    )!.card_holder_name, style: TextStyle(color: Colors.white54, fontSize: 14)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.cardHolderName.isEmpty ? "Noman Manzoor" : widget.cardHolderName,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Text( AppLocalizations.of(
                    context,
                  )!.expire_date, style: TextStyle(color: Colors.white54, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(
                    widget.expiryDate.isEmpty ? "02/30" : widget.expiryDate,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}