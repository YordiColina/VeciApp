import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'carritoCompra.dart';
import 'main.dart';

class registrarPedido extends StatefulWidget {
  final String id,cedula;
  const registrarPedido({required this.id,required this.cedula});

  @override
  _registrarPedidoState createState() => _registrarPedidoState();
}

class _registrarPedidoState extends State<registrarPedido> {
  List listaProductos=[];
  List codigosGustos=[];
  List<datosPedido> pedido=[];

  void initState(){
    super.initState();
    getProductos();
  }
  String aux="";
  void getProductos() async {

    CollectionReference gustos = FirebaseFirestore.instance.collection("Productos");
    CollectionReference gustos2 = FirebaseFirestore.instance.collection("negocios");//Gustos=Productos
    String cod="";
    QuerySnapshot product= await gustos.where("negocio", isEqualTo: widget.id).get();
    QuerySnapshot product2= await gustos2.where("id", isEqualTo: widget.id).get();//negocio=persona
    if(product.docs.length>0 && product2.docs.length>0){
      for(var doc in product.docs){
        cod=doc.id.toString();
        codigosGustos.add(cod);
        listaProductos.add(doc.data());
      }
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.cyan[50],
        appBar: AppBar(
          backgroundColor: Colors.cyan[700],
          title: Text("Registra tu Pedido"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>carritoCompras(pedido: pedido, cedula: widget.cedula, id: widget.id)));

                }, icon: Icon(Icons.add_shopping_cart, size: 30, color: Colors.cyan[700]))
          ],
        ),
        drawer: menu(),
        body: ListView.builder(
            itemCount: listaProductos.length,
            itemBuilder: (BuildContext context,i){
              var can = TextEditingController();
              return ListTile(

                leading: Icon(Icons.add_box, size: 40,color: Colors.cyan[700]),
                title:
                  Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.cyan[100],
                  child: Column(
                    children: [
                      Image.network(listaProductos[i]['foto']),
                      Text(listaProductos[i]['descripcion']+" - "+listaProductos[i]['nombre']+" - "+listaProductos[i]['precio'].toString()),
                    ],
                  ),
                ),
                subtitle: TextField(
                  controller: can,
                  decoration: InputDecoration(
                      hintText: "Cant."
                  ),
                ),
                onTap: (){
                  if(can.text.isEmpty){
                    can.text="0";
                  }
                  int total=int.parse(can.text)*(int.parse(listaProductos[i]['precio'].toString()));
                  datosPedido p = datosPedido(codigosGustos[i], listaProductos[i]['nombre'], listaProductos[i]['descripcion'],
                      listaProductos[i]['precio'].toString(), int.parse(can.text), total);
                  pedido.add(p);
                },
              );
            })

    );
  }
}

class datosPedido{

  String codigo="";
  String nombre="";
  String descripcion="";
  String precio="";
  int cant=0;
  int total=0;

  datosPedido(this.codigo, this.nombre, this.descripcion, this.precio, this.cant, this.total);
}
