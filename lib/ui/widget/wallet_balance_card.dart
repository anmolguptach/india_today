import 'package:flutter/material.dart';

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            const Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.deepPurple,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Wallet Balance: 0",
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 90,
              height: 30,
              child: const Center(
                child: Text(
                  "Add Money",
                  style: TextStyle(color: Colors.deepPurple, fontSize: 12),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 1),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.deepPurple.withOpacity(0.1),
      ),
    );
  }
}
