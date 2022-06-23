import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/friends_bloc/friends_bloc.dart';
import 'package:untitled1/ui/widget/friends_card.dart';
import 'package:untitled1/ui/widget/wallet_balance_card.dart';

class FriendsCardList extends StatefulWidget {
  final Function() onTap;
  const FriendsCardList({required this.onTap, Key? key}) : super(key: key);

  @override
  State<FriendsCardList> createState() => _FriendsCardListState();
}

class _FriendsCardListState extends State<FriendsCardList> {
  FriendsBloc friendsBloc = FriendsBloc();

  @override
  void initState() {
    friendsBloc.add(GetFriendsListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FriendsBloc>(
      create: (context) => friendsBloc,
      child: BlocBuilder<FriendsBloc, FriendsState>(
        builder: (context, state) {
          if (state is! FriendsInitial) {
            return Stack(
              children: [
                Column(
                  children: [
                    const WalletBalanceCard(),
                    const SizedBox(height: 20),
                    if (state is! FriendsLoading )
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return FriendCard(
                              relatives: state.friendsAndFamilyModel!.data!
                                  .allRelatives![index],
                              onDelete: () {
                                friendsBloc.add(
                                  DeleteFriendEvent(
                                    uuid: state.friendsAndFamilyModel!.data!
                                        .allRelatives![index].uuid
                                        .toString(),
                                  ),
                                );
                              },
                              onEdit: () {},
                            );
                          },
                          itemCount: state.friendsAndFamilyModel!.data!
                              .allRelatives!.length,
                        ),
                      ),
                    if (state is FriendsLoading)
                      state.success
                          ? const Center(child: CircularProgressIndicator())
                          : Text(state.friendsAndFamilyModel!.httpStatus
                              .toString())
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 100,
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              "Add New Profile",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
