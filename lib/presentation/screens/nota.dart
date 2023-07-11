import 'package:appclases/models/models.dart';
import 'package:flutter/material.dart';

class VoteScreen extends StatefulWidget {
  static String routeName = 'vote_screen';
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  final List<ItemDropdown> listaNotas = [
    ItemDropdown(label: " 1", value: 1),
    ItemDropdown(label: " 2",value: 2),
    ItemDropdown(label: " 3",value: 3),
    ItemDropdown(label: " 4",value: 4),
    ItemDropdown(label: " 5",value: 5),
    ItemDropdown(label: " 6",value: 6),
    ItemDropdown(label: " 7",value: 7),
    ItemDropdown(label: " 8",value: 8),
    ItemDropdown(label: " 9",value: 9),
    ItemDropdown(label: " 10",value: 10),
  ];
  
  ItemDropdown? _ponernota;
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(title: const Text('Calificar Clase'),
      
      backgroundColor: Theme.of(context).primaryColorDark),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
           Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 148, 173, 137),
            ),
           ),
           SizedBox(height: 50.0,),
           Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 SizedBox(height: 50.0,),
                 Text('Nota', style: TextStyle(fontSize: 50,),),
                 Container(
                  padding: EdgeInsets.only(left: 5.0,),
                    width: 100.0,        
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black,),
                      borderRadius: BorderRadius.circular(5.0,),
                  ),
                    child: DropdownButton(
                      //value: _ponernota,
                      hint: Text(' Calificar'),
                      isExpanded: true,
                      value: _ponernota,
                      underline: const SizedBox(),
                      items: listaNotas.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.label), 
                    value: item);
                   }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _ponernota = value;
                    });
                  },
                  ),
                 ),
                 const Spacer(),
                
                 Container(
                  width: 100.0,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(child: Text('Enviar'),),
                 ),
               ],
             ),
            ),
          ),
        ],
      ),
    ),
   );
  }
}

 