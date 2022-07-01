import 'package:algoriza_project/business_logic/login_cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());


  static ShopLoginCubit get(context) => BlocProvider.of(context);

  List<String> items = ['+20', '+996' , '+995'];
  String selectedItem = '+20';
  void onDropDownButtonChanged (String item){
    selectedItem = item;
    emit(ChangeDropDownValue());
  }

}
