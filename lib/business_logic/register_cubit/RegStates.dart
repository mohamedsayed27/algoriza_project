abstract class ShopRegisterStates {}
class ShopRegisterInitialState extends ShopRegisterStates{}
class ShopRegisterLoadingState extends ShopRegisterStates{}
class ShopRegisterSuccessState extends ShopRegisterStates{}
class ShopRegisterErrorState extends ShopRegisterStates{
  final String error;
  ShopRegisterErrorState(this.error);
}
class ShopCreateSuccessState extends ShopRegisterStates{}
class ShopCreateErrorState extends ShopRegisterStates{
  final String error;
  ShopCreateErrorState(this.error);
}
class ShopChangePasswordVisibilityState extends ShopRegisterStates{}


class ChangeDropDownValue extends ShopRegisterStates{}

