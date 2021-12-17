import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());
final counterProvider1 = ChangeNotifierProvider((ref) => Counter1());

class Counter extends StateNotifier<int>{
  Counter() : super(0);

  void increment(){
     state++;
  }

  void decrement(){
    state--;
  }


}

class Counter1 extends ChangeNotifier{

  int _num = 0;

  int get data{
    return _num;
  }

  void increment(){
    _num++;
    notifyListeners();
  }

  void decrement(){
    _num--;
  }


}