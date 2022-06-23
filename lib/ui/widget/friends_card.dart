import 'package:flutter/material.dart';
import 'package:untitled1/model/friend_and_family_model.dart';

class FriendCard extends StatelessWidget {
  final AllRelatives relatives;
  final Function()? onEdit;
  final Function()? onDelete;
  const FriendCard({
    required this.relatives,
     this.onDelete,
     this.onEdit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 5, left: 5, top: 3),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                  child: Text(
                    relatives.firstName!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: 75,
                  child: Text(
                    relatives.birthDetails!.dobDay.toString() +
                        "-" +
                        relatives.birthDetails!.dobMonth.toString() +
                        "-" +
                        relatives.birthDetails!.dobYear.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: Text(
                    relatives.birthDetails!.tobHour.toString() +
                        ":" +
                        relatives.birthDetails!.tobMin.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    relatives.relation!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                IconButton(
                  onPressed:onEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.orangeAccent,
                  ),
                ),
                IconButton(
                  onPressed:onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
