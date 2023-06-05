import 'package:alegra_store/src/domain/requests/categoria_producto_request.dart';
import 'package:alegra_store/src/domain/requests/producto_request.dart';
import 'package:alegra_store/src/ui/pages/producto/campos_producto_formulario.dart';
import 'package:alegra_store/src/ui/pages/producto/producto_controller.dart';
import 'package:flutter/material.dart';

import '../../utilities/responsive.dart';

class DetallesProductoPage extends StatefulWidget {
  const DetallesProductoPage({super.key});

  @override
  State<DetallesProductoPage> createState() => _DetallesProductoPageState();
}

class _DetallesProductoPageState extends State<DetallesProductoPage> {
  ProductoRequest productoRequest = ProductoRequest();
  List<CategoriaProductoRequest> _listaTipoArticulos = [];
  ProductoController productoController = ProductoController();

  TextEditingController codigoProductoController = TextEditingController();

  final _actualizadoInputFechaIngreso = TextEditingController();

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
    productoRequest =
        ModalRoute.of(context)!.settings.arguments as ProductoRequest;
    codigoProductoController.text = productoRequest.codigo;
    _actualizadoInputFechaIngreso.text = productoRequest.fechaExpiracion;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalles Producto'),
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
            child: Column(
              children: [
                SizedBox(height: Adapt.hp(3, context)),
                codigoProducto(productoRequest, codigoProductoController,
                    enabled: false),
                SizedBox(height: Adapt.hp(3, context)),
                nombreProductoText(productoRequest, enabled: false),
                SizedBox(height: Adapt.hp(3, context)),
                listaTipoArticulo(
                    productoRequest, _listaTipoArticulos, (String? value) => {},
                    enabled: false),
                SizedBox(height: Adapt.hp(3, context)),
                precioCompraArticulo(productoRequest, enabled: false),
                SizedBox(height: Adapt.hp(3, context)),
                precioVentaProducto(productoRequest, enabled: false),
                SizedBox(height: Adapt.hp(3, context)),
                cantidadProductoNum(productoRequest, enabled: false),
                SizedBox(height: Adapt.hp(3, context)),
                pesoProducto(productoRequest, enabled: false),
                SizedBox(height: Adapt.hp(3, context)),
                fechaExpiracionText(
                    productoRequest, _actualizadoInputFechaIngreso, context,
                    enabled: false),
                SizedBox(height: Adapt.hp(3, context)),
                descripcionProducto(productoRequest, enabled: false),
                SizedBox(height: Adapt.hp(3, context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
