import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/bloc/add_new_profile/add_new_profile_bloc.dart';
import 'package:untitled1/bloc/top_bar_toggle_cubit.dart';
import 'package:untitled1/ui/widget/friends_list.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopBarToggleCubit(),
      child: BlocBuilder<TopBarToggleCubit, bool>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  FittedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<TopBarToggleCubit>()
                                  .toggleTopBar(true);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: state
                                      ? Colors.orangeAccent
                                      : Colors.white),
                              child: Center(
                                child: Text(
                                  "Basic Profile",
                                  style: TextStyle(
                                      color:
                                          state ? Colors.white : Colors.black),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<TopBarToggleCubit>()
                                  .toggleTopBar(false);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: !state
                                      ? Colors.orangeAccent
                                      : Colors.white),
                              child: Center(
                                child: Text(
                                  "Friends and Family Profile",
                                  style: TextStyle(
                                      color:
                                          !state ? Colors.white : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  state
                      ? const View()
                      : const Center(child: Text("Friends and Family Profile"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToggleViewCubit(),
      child: BlocBuilder<ToggleViewCubit, bool>(
        builder: (context, state) {
          return !state
              ? AddFriendWidget(
                  onTap: () {
                    context.read<ToggleViewCubit>().toggleView(true);
                  },
                )
              : FriendsCardList(
                  onTap: () {
                    context.read<ToggleViewCubit>().toggleView(false);
                  },
                );
        },
      ),
    );
  }
}

class AddFriendWidget extends StatefulWidget {
  final Function() onTap;
  const AddFriendWidget({required this.onTap, Key? key}) : super(key: key);

  @override
  State<AddFriendWidget> createState() => _AddFriendWidgetState();
}

class _AddFriendWidgetState extends State<AddFriendWidget> {
  AddNewProfileBloc bloc = AddNewProfileBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<AddNewProfileBloc, AddNewProfileState>(
        builder: (context, state) {
          return Form(
            key: bloc.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                      ),
                      onPressed: widget.onTap,
                    ),
                    const Text(
                      "Add New Profile",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )
                  ],
                ),
                const TextFieldHeader(title: "Name"),
                SizedBox(
                  child: TextFormField(
                    validator: (value) {
                      if (!state.nameStatus!) return "Invalid name";
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: bloc.nameController,
                    onChanged: (value) {
                      bloc.add(NameChanged(name: value));
                    },
                  ),
                ),
                const TextFieldHeader(title: "Date of Birth"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 110,
                      child: TextFormField(
                        maxLength: 2,
                        controller: bloc.dobDateController,
                        validator: (value) {
                          if (!state.dobDayStatus!) return "Invalid date";
                          return null;
                        },
                        onChanged: (value) {
                          bloc.add(DOBDateChanged(dobDate: int.parse(value)));
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "DD"),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: TextFormField(
                        maxLength: 2,
                        controller: bloc.dobMonthController,
                        validator: (value) {
                          if (!state.dobMonthStatus!) return "Invalid month";
                          return null;
                        },
                        onChanged: (value) {
                          bloc.add(DOBMonthChanged(dobMonth: int.parse(value)));
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "MM"),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: TextFormField(
                        controller: bloc.dobYearController,
                        validator: (value) {
                          if (!state.dobYearStatus!) return "Invalid year";
                          return null;
                        },
                        onChanged: (value) {
                          bloc.add(DOBYearChanged(dobYear: int.parse(value)));
                        },
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "YYYY"),
                      ),
                    ),
                  ],
                ),
                const TextFieldHeader(title: "Time of Birth"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 110,
                      child: TextFormField(
                        maxLength: 2,
                        controller: bloc.tobHourController,
                        validator: (value) {
                          if (!state.tobHourStatus!) return "Invalid hour";
                          return null;
                        },
                        onChanged: (value) {
                          bloc.add(TOBHourChanged(tobHour: int.parse(value)));
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "HH"),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      child: TextFormField(
                        maxLength: 2,
                        controller: bloc.tobMonthController,
                        validator: (value) {
                          if (!state.tobMinStatus!) return "Invalid min";
                          return null;
                        },
                        onChanged: (value) {
                          bloc.add(TOBMinChanged(tobMin: int.parse(value)));
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), hintText: "MM"),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 110,
                      height: 60,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              bloc.add(const AMPMStatusChanged(isAm: true));
                            },
                            child: Container(
                              width: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      state.isAm! ? Colors.blue : Colors.white),
                              child: Center(
                                child: Text(
                                  "AM",
                                  style: TextStyle(
                                    color: state.isAm!
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              bloc.add(const AMPMStatusChanged(isAm: false));
                            },
                            child: Container(
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    !state.isAm! ? Colors.blue : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  "PM",
                                  style: TextStyle(
                                    color: !state.isAm!
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const TextFieldHeader(title: "Place of birth"),
                SizedBox(
                  child: TextFormField(
                    controller: bloc.placeController,
                    validator: (value) {
                      if (!state.placeStatus!) return "Invalid place name";
                      return null;
                    },
                    onChanged: (value) {
                      bloc.add(PlaceOfBirthChanged(placeOfBirth: value));
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextFieldHeader(title: "Gender"),
                        SizedBox(
                          width: 170,
                          child: DropdownButtonFormField<String>(
                            value: "Male",
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            items: ["Male", "Female"]
                                .map((label) => DropdownMenuItem(
                                      child: Text(label.toString()),
                                      value: label,
                                    ))
                                .toList(),
                            hint: const Text('Gender'),
                            onChanged: (value) {
                              bloc.add(GenderChanged(gender: value!));
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextFieldHeader(title: "Relation"),
                        SizedBox(
                          width: 170,
                          child: DropdownButtonFormField<String>(
                            value: "Mother in Law",
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            items: ["Mother in Law", "Father in law"]
                                .map((label) => DropdownMenuItem(
                                      child: Text(label.toString()),
                                      value: label,
                                    ))
                                .toList(),
                            hint: const Text('Relation'),
                            onChanged: (value) {
                              bloc.add(RelationChanged(relation: value!));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (bloc.formKey.currentState!.validate()) {
                        bloc.add(PostNewProfile(onTap: widget.onTap));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Save changes",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TextFieldHeader extends StatelessWidget {
  final String title;
  const TextFieldHeader({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, color: Colors.grey),
      ),
    );
  }
}
