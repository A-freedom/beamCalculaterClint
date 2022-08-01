import 'dart:collection';
import 'package:flutter/material.dart';
enum BeamItems{pointedLoad,distributedLoad,support}
class BeamData extends ChangeNotifier {
  final List<PointedLoad> _pointedLoads = [];
  UnmodifiableListView<PointedLoad> get pointedLoads => UnmodifiableListView(_pointedLoads);

  final List<DistributedLoad> _distributedLoads = [];
  UnmodifiableListView<DistributedLoad> get distributedLoads => UnmodifiableListView(_distributedLoads);

  final List<Support> _supports = [];
  UnmodifiableListView<Support> get supports => UnmodifiableListView(_supports);

  final List<Moment> _moments = [];
  UnmodifiableListView<Moment> get moments => UnmodifiableListView(_moments);


  void removeAll() {
    _pointedLoads.clear();
    _distributedLoads.clear();
    _supports.clear();
    notifyListeners();
  }

  void addDistributedLoad() {
    _distributedLoads.add(DistributedLoad('10', '15', '0', '6'));
    notifyListeners();

  }

  void removeDistributedLoad(int e) {
    _distributedLoads.removeAt(e);
    notifyListeners();

  }
  void addSupport() {
    _supports.add(Support(SupportTyps.fix, '0'));
    notifyListeners();

  }

  void removeSupport(int e) {
    _supports.removeAt(e);
    notifyListeners();

  }

  void addPointedLoad() {
    _pointedLoads.add(PointedLoad('20', '3'));
    notifyListeners();
  }

  void removePointedLoad(int index) {
    _pointedLoads.removeAt(index);
    notifyListeners();
  }

  void addMoment() {
    _pointedLoads.add(PointedLoad('20', '3'));
    notifyListeners();
  }
  void removeMoment(int index){
    _moments.removeAt(index);
    notifyListeners();
  }
}

enum SupportTyps { pin, fix }
class Support {
  SupportTyps typs;
  String position;
  Support(this.typs,this.position);
}

class DistributedLoad {
  // {start_value , end_value , start_position ,end_position}
  // ignore: prefer_typing_uninitialized_variables
  String sVal, eVal, sPos, ePos;
  DistributedLoad(this.sVal, this.eVal, this.sPos, this.ePos);
}

class PointedLoad {
  String value;
  String position;
  PointedLoad(this.value,this.position);
}

class Moment {
  String value;
  String position;
  Moment(this.value,this.position);
}
// ignore: constant_identifier_names

enum InputTypes{sVal, eVal ,sPos ,ePos,supportType,supportPosition,pointedLoadValue,pointedLoadPosition,momentValue,momentPosition}