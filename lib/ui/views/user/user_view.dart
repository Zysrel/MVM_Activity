import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
//import 'package:stacked_app/models/user.dart';

import 'user_viewmodel.dart';

class UserView extends StackedView<UserViewModel> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Container(
          width: 1000,
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                    minWidth: 150.0, 
                    height: 50.0,   
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () => viewModel.navigateBack(),
                    shape: const StadiumBorder(),
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(height: 16),
                ButtonTheme(
                    minWidth: 150.0, 
                    height: 50.0, 
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () => viewModel.getUsersFromService(),
                    shape: const StadiumBorder(),
                    child: const Text('Get Users'),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 10.0, bottom: 15.0, left: 10.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 100.0),
                                child: Row(
                                  children: [
                                  Column(
                                    children: [
                                      Text(viewModel.users[index].id.toString()),
                                    ],
                                  ),
                                  const SizedBox(width: 300.0),
                                  Column(
                                    children: [
                                      Text(viewModel.users[index].name),
                                    ],
                                  ),
                                    ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100.0),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text("${viewModel.users[index].address.suite}, ${viewModel.users[index].address.street}, ${viewModel.users[index].address.city}, ${viewModel.users[index].address.zipcode}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100.0,right: 100.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                  children: [
                                    Text(viewModel.users[index].email),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(viewModel.users[index].phone),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          
        ),
      ),
    );
  }

  @override
  UserViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserViewModel();
}
