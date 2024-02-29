import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/models/user.dart';
import 'package:stacked_app/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';

class UserViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  //final _addressService = locator<AddressService>();

   List<User> _users =[];
   List<User> get users => _users;
  
  getUsersFromService() async{
    _users = await _userService.getUsers();
    rebuildUi();
    }


  navigateBack() async{
    _navigationService.back();
    rebuildUi();
  }
}


