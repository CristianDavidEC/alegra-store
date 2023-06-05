import 'package:alegra_store/src/domain/requests/categoria_producto_request.dart';
import 'package:alegra_store/src/domain/requests/producto_request.dart';
import 'package:alegra_store/src/ui/pages/producto/campos_producto_formulario.dart';
import 'package:alegra_store/src/ui/pages/producto/producto_controller.dart';
import 'package:flutter/material.dart';
import '../../utilities/responsive.dart';

class RegistrarArticuloPage extends StatefulWidget {
  const RegistrarArticuloPage({super.key});

  @override
  State<RegistrarArticuloPage> createState() => _RegistrarArticuloPageState();
}

class _RegistrarArticuloPageState extends State<RegistrarArticuloPage> {
  List<CategoriaProductoRequest> _listaTipoArticulos = [];
  TextEditingController codigoProductoController = TextEditingController();

  ProductoController productoController = ProductoController();

  final _formKey = GlobalKey<FormState>();
  bool _enEspera = false;
  final _actualizadoInputFechaIngreso = TextEditingController();

  ProductoRequest productoRequest = ProductoRequest();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inicializacion();
  }

  inicializacion() async {
    _listaTipoArticulos = await productoController.listarCategoriaProductos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Producto'),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        _head(),
        //_botonFiltrar(),
      ],
    );
  }

  Widget _head() {
    return Center(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        width: Adapt.wp(90, context),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: Adapt.hp(3, context)),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: codigoProducto(
                          productoRequest, codigoProductoController),
                    ),
                    SizedBox(width: Adapt.wp(2, context)),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () async {
                          codigoProductoController.text =
                              await productoController
                                  .leerCodigoDeBarras(context);
                        },
                        child: const Icon(Icons.qr_code_scanner_outlined),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Adapt.hp(3, context)),
                nombreProductoText(productoRequest),
                SizedBox(height: Adapt.hp(3, context)),
                listaTipoArticulo(productoRequest, _listaTipoArticulos,
                    (String? newValue) {
                  setState(() {
                    newValue;
                  });
                }),
                SizedBox(height: Adapt.hp(3, context)),
                precioCompraArticulo(productoRequest),
                SizedBox(height: Adapt.hp(3, context)),
                precioVentaProducto(productoRequest),
                SizedBox(height: Adapt.hp(3, context)),
                pesoProducto(productoRequest),
                SizedBox(height: Adapt.hp(3, context)),
                fechaExpiracionText(
                    productoRequest, _actualizadoInputFechaIngreso, context),
                SizedBox(height: Adapt.hp(3, context)),
                cantidadProductoNum(productoRequest),
                SizedBox(height: Adapt.hp(3, context)),
                descripcionProducto(productoRequest),
                SizedBox(height: Adapt.hp(3, context)),
                _botonCrearProducto(),
                SizedBox(height: Adapt.hp(3, context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _botonCrearProducto() {
    return SizedBox(
      width: Adapt.wp(70, context),
      height: Adapt.hp(6, context),
      child: ElevatedButton(
        child: _enEspera
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Text("Espere un momento...")
              ])
            : Text("Registrar producto",
                style: TextStyle(fontSize: Adapt.px(25), color: Colors.white)),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            String fechaActual = DateTime.now().toString().substring(0, 10);
            productoRequest.fechaIngreso = fechaActual;

            setState(() {
              _enEspera = true;
            });

            _enEspera = await productoController.registrarProducto(
                context, productoRequest);
          }
          setState(() {});
        },
      ),
    );
  }
}
