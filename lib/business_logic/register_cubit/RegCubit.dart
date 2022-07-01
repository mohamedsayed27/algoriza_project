
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'RegStates.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());


  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  List<String> items = ['+20', '+996' , '+995'];
  String selectedItem = '+20';
  void onDropDownButtonChanged (String item){
    selectedItem = item;
    emit(ChangeDropDownValue());
  }

}