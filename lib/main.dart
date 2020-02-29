import 'package:flutter/material.dart';
import 'package:primos_app/programs/divisores.dart';
import 'package:primos_app/programs/primos.dart';

void main() => runApp(PrimosApp());

class PrimosApp
 extends StatelessWidget {
   final title = 'Números Primos';
 @override
 Widget build(BuildContext context) {
  return new MaterialApp(
    title: title,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: InfoWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VerificaPrimos(),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return new Column(
    children: <Widget>[
                  new Container(
                  padding: new EdgeInsets.only(bottom: 8.0, top: 12.0),
                  child: new Text(
                    'Números primos: Un número primo es aquel que tiene exactamente dos divisores: El 1 y el mismo número.',
                      style: TextStyle(
                        color: Colors.black87,
                        fontStyle: FontStyle.italic,
                        fontSize: 16.0
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 394,
                    //
                    child: Container(
                      padding: new EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue[700]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: new GridView.count(
                    // Crea una grid con 5 columnas. Si cambias el scrollDirection a
                    // horizontal, esto produciría 2 filas.
                    crossAxisCount: 5,
                    // Genera 100 Widgets que muestran su índice en la lista
                    children: new List<Widget>.generate(100, (index) {
                    return new GridTile(
                      child: new Card(
                        shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[400], width: 1),
                        borderRadius: BorderRadius.circular(5),
                        ),
                        margin: EdgeInsets.all(1.0),
                        color: Colors.blue.shade200,
                        child: new Center(
                          child: new Text('${listaPrimos()[index]}'),
                        )
                      ),
                    );
                   }
                  ),
                  ),
                  ),
                ),
        ]
      );
 }
}

class VerificaPrimos extends StatefulWidget {
  @override
  _VerificaPrimosState createState() => new _VerificaPrimosState();
 }
class _VerificaPrimosState extends State<VerificaPrimos> {
final TextEditingController _controller = TextEditingController();
  String result = "";
void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }


  @override
    Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      //color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(width: 150.0,
            child: new TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 18,),
                decoration: InputDecoration(
                  hintText: 'Un número',
                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.black, fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.teal,
                        ),
                      ),
                      /*prefixIcon: const Icon(
                        Icons.security,
                        color: Colors.white,
                      ),*/
                ),
                //
                //onChanged: (str) => str.length > 0 ? () => ,
                onSubmitted: (String str) {
                  setState(() {
                    result = (primo(int.parse(str))==1) 
                    ? '$str es número primo.': '$str no es número primo.\nSus divisores son ${divisor(int.parse(str))} ';
                    _controller.clear();
                  });
                }
                ),
            ),
            SizedBox(width: 30.0),
           //Muestra el resultado
           Flexible(child: new Text('$result',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  softWrap: true,
                )
                )
                
        ],
      ),
    );
  }
}