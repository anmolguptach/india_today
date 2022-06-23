import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/app_repository.dart';
import 'package:untitled1/bloc/ask_question/ask_question_bloc.dart';
import 'package:collection/collection.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  _AskQuestionScreenState createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  AskQuestionBloc askQuestionBloc = AskQuestionBloc();

  @override
  void initState() {
    askQuestionBloc.add(GetAllQuestionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppRepository().getFriendList();
    return BlocProvider<AskQuestionBloc>(
      create: (_) => askQuestionBloc,
      child: BlocListener<AskQuestionBloc, AskQuestionState>(
        listener: (context, state) {},
        child: BlocBuilder<AskQuestionBloc, AskQuestionState>(
          builder: (context, state) {
            if (state is AskQuestionLoading) {
              return const Scaffold();
            } else {
              return SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: Image.asset(
                      "assets/hamburger.png",
                      height: 20,
                    ),
                    centerTitle: true,
                    title: Image.asset(
                      "assets/icon.png",
                      height: 50,
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/profile.png",
                        ),
                      ),
                    ],
                  ),
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: size.width,
                              color: Colors.deepPurple.shade600,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Wallet Balance: ₹ 0",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    MaterialButton(
                                      onPressed: () {},
                                      color: Colors.white,
                                      child: Text(
                                        "Add Money",
                                        style: TextStyle(
                                          color: Colors.deepPurple.shade600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Ask a Question",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Seek acCurate answers to your life problems and get guidance towards the right path. VWhether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.",
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Choose Category",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey, blurRadius: 1)
                                      ],
                                    ),
                                    height: 50,
                                    width: 400,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        value: state
                                            .categoryList![state.currentIndex!],
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: state.categoryList!
                                            .mapIndexed(
                                              (index, e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                            onTap: () {
                                              askQuestionBloc.add(
                                                UpdateDropDownValueEvent(
                                                    index),
                                              );
                                            },
                                          ),
                                        )
                                            .toList(),
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    maxLength: 150,
                                    maxLines: 4,
                                    maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                    decoration: InputDecoration(
                                      hintText: "Type a question here",
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Ideas what to Ask (Select Any)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                    const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                "assets/ask.png",
                                                height: 30,
                                                color: Colors.orangeAccent,
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  state
                                                      .askAQuestionModel!
                                                      .data![
                                                  state.currentIndex!]
                                                      .suggestions![index]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.8,
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            thickness: 1.5,
                                            height: 20,
                                          ),
                                        ],
                                      );
                                    },
                                    itemCount: state
                                        .askAQuestionModel!
                                        .data![state.currentIndex!]
                                        .suggestions!
                                        .length,
                                  ),
                                  const Text(
                                      "Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you."),
                                  const SizedBox(
                                    height: 100,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: size.width * 0.9,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurple.shade600,
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₹" +
                                        state.askAQuestionModel!
                                            .data![state.currentIndex!].price
                                            .toString() +
                                        " ( 1 Questions on ${state.categoryList![state.currentIndex!]} )",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12.5),
                                  ),
                                  MaterialButton(
                                    color: Colors.white,
                                    onPressed: () {},
                                    child: Text(
                                      "Ask Now",
                                      style: TextStyle(
                                        color: Colors.deepPurple.shade600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
