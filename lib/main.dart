import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BeamData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppBar(
          title: const Text('Supports'),
          actions: [
            IconButton(
                onPressed: () =>
                    Provider.of<BeamData>(context, listen: false).addSupport(),
                icon: const Icon(Icons.add)),
          ],
        ),
        Consumer<BeamData>(builder: (context, beamData, child) {
          final int numItems = beamData.supports.length;
          return DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('support type')),
              DataColumn(label: Text('the position')),
              DataColumn(label: Text('delete'),),
            ],
            rows: List<DataRow>.generate(
              numItems,
              (int index) => DataRow(
                cells: <DataCell>[
                  DataCell(CustomTextInput(index,InputTypes.supportType,beamData)),
                  DataCell(CustomTextInput(index,InputTypes.supportPosition,beamData)),
                  DataCell(IconButton(
                      onPressed: ()=>Provider.of<BeamData>(context, listen: false).removeSupport(index),
                      icon:  const Icon(Icons.delete_forever)))
                ],
              ),
            ),
          );
        }),
        AppBar(
          title: const Text('pointed load'),
          actions: [
            IconButton(
                onPressed: () =>
                    Provider.of<BeamData>(context, listen: false).addPointedLoad(),
                icon: const Icon(Icons.add)),
          ],
        ),
        Consumer<BeamData>(builder: (context, beamData, child) {
          final int numItems = beamData.pointedLoads.length;
          return DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('the value')),
              DataColumn(label: Text('the position')),
              DataColumn(label: Text('delete'),),
            ],
            rows: List<DataRow>.generate(
              numItems,
                  (int index) => DataRow(
                cells: <DataCell>[
                  DataCell(CustomTextInput(index,InputTypes.pointedLoadValue,beamData)),
                  DataCell(CustomTextInput(index,InputTypes.pointedLoadPosition,beamData)),
                  DataCell(IconButton(
                      onPressed: ()=>Provider.of<BeamData>(context, listen: false).removePointedLoad(index),
                      icon:  const Icon(Icons.delete_forever)))
                ],
              ),
            ),
          );
        }),
        AppBar(
          title: const Text('moments'),
          actions: [
            IconButton(
                onPressed: () =>
                    Provider.of<BeamData>(context, listen: false).addMoment(),
                icon: const Icon(Icons.add)),
          ],
        ),
        Consumer<BeamData>(builder: (context, beamData, child) {
          final int numItems = beamData.moments.length;
          return DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('the value')),
              DataColumn(label: Text('the position')),
              DataColumn(label: Text('delete'),),
            ],
            rows: List<DataRow>.generate(
              numItems,
                  (int index) => DataRow(
                cells: <DataCell>[
                  DataCell(CustomTextInput(index,InputTypes.momentValue,beamData)),
                  DataCell(CustomTextInput(index,InputTypes.momentPosition,beamData)),
                  DataCell(IconButton(
                      onPressed: ()=>Provider.of<BeamData>(context, listen: false).removeMoment(index),
                      icon:  const Icon(Icons.delete_forever)))
                ],
              ),
            ),
          );
        }),
        AppBar(
          title: const Text('what ever'),
          actions: [
            IconButton(
                onPressed: () =>
                    Provider.of<BeamData>(context, listen: false).addDistributedLoad(),
                icon: const Icon(Icons.add)),
          ],
        ),
        Consumer<BeamData>(builder: (context, beamData, child) {
          final int numItems = beamData.distributedLoads.length;
          return DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Text('start value')),
              DataColumn(label: Text('end value')),
              DataColumn(label: Text('start position')),
              DataColumn(label: Text('end position')),
              DataColumn(label: Text('delete'),),
            ],
            rows: List<DataRow>.generate(
              numItems,
              (int index) => DataRow(
                cells: <DataCell>[
                  DataCell(CustomTextInput(index,InputTypes.sVal,beamData)),
                  DataCell(CustomTextInput(index,InputTypes.eVal,beamData)),
                  DataCell(CustomTextInput(index,InputTypes.sPos,beamData)),
                  DataCell(CustomTextInput(index,InputTypes.ePos,beamData)),
                  DataCell(IconButton(
                      onPressed: ()=>Provider.of<BeamData>(context, listen: false).removeDistributedLoad(index),
                      icon:  const Icon(Icons.delete_forever)))
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class CustomTextInput extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  _type;
  // ignore: prefer_typing_uninitialized_variables
  final  _index;
  // ignore: prefer_typing_uninitialized_variables
  final BeamData _beamData;
  const CustomTextInput(this._index,this._type,this._beamData, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController textArea = TextEditingController();
    switch(_type){
      case InputTypes.sVal : textArea.text = _beamData.distributedLoads[_index].sVal.toString();
      break;
      case InputTypes.eVal : textArea.text = _beamData.distributedLoads[_index].eVal.toString();
      break;
      case InputTypes.sPos : textArea.text = _beamData.distributedLoads[_index].sPos.toString();
      break;
      case InputTypes.ePos : textArea.text = _beamData.distributedLoads[_index].ePos.toString();
      break;
      case InputTypes.supportType : textArea.text = (_beamData.supports[_index].typs == SupportTyps.fix) ? 'fix' : 'pin' ;
      break;
      case InputTypes.supportPosition : textArea.text = _beamData.supports[_index].position.toString();
      break;
      case InputTypes.pointedLoadValue : textArea.text= _beamData.pointedLoads[_index].value ;
      break;
      case InputTypes.pointedLoadPosition : textArea.text= _beamData.pointedLoads[_index].position ;
      break;
      case InputTypes.momentValue : textArea.text= _beamData.moments[_index].value ;
      break;
      case InputTypes.momentPosition : textArea.text= _beamData.moments[_index].position ;
    }
    return TextField(
      onChanged: (text){
        switch(_type){
          case InputTypes.sVal : _beamData.distributedLoads[_index].sVal = text;
          break;
          case InputTypes.eVal : _beamData.distributedLoads[_index].eVal = text;
          break;
          case InputTypes.sPos : _beamData.distributedLoads[_index].sPos = text;
          break;
          case InputTypes.ePos : _beamData.distributedLoads[_index].ePos = text;
          break;
          case InputTypes.supportType : _beamData.supports[_index].typs = (text == 'fix') ? SupportTyps.fix : SupportTyps.pin;
          break;
          case InputTypes.supportPosition : _beamData.supports[_index].position = text;
          break;
          case InputTypes.pointedLoadValue : _beamData.pointedLoads[_index].value = text ;
          break;
          case InputTypes.pointedLoadPosition : _beamData.pointedLoads[_index].position = text;
          break;
          case InputTypes.momentValue : _beamData.moments[_index].value = text ;
          break;
          case InputTypes.momentPosition : _beamData.moments[_index].position = text;
        }
      },
        controller: textArea,
      keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
    );
  }
}
