// ignore_for_file: use_build_context_synchronously

import 'package:alegra_store/src/domain/requests/categoria_producto_request.dart';
import 'package:alegra_store/src/domain/requests/producto_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../data/http/ProductoHttp.dart';
import '../../utilities/mensajesAlerta.dart';

/// @author  Escuadrón Alfa	
/// El controlador de productos es responsable de gestionar las operaciones relacionadas 
/// con los productos y categorías de productos en la aplicación.
class ProductoController {
  ProductoHttp productoHttp = ProductoHttp();

  /// Obtiene una lista de productos.
  ///
  /// Retorna una lista de objetos [ProductoRequest].
  Future<List<ProductoRequest>> listarProductos() async {
    return await productoHttp.listaProductos();
  }

  /// Obtiene una lista de categorías de productos.
  ///
  /// Retorna una lista de objetos [CategoriaProductoRequest].
  Future<List<CategoriaProductoRequest>> listarCategoriaProductos() async {
    return await productoHttp.listaCategoriaProductos();
  }

  /// Registra un nuevo producto.
  ///
  /// El parámetro [context] es el contexto de la aplicación.
  /// El parámetro [producto] es un objeto [ProductoRequest] que representa el producto a registrar.
  ///
  /// Retorna un valor booleano que indica si el producto se registró correctamente.
  Future registrarProducto(
      BuildContext context, ProductoRequest producto) async {
    bool verificar = await productoHttp.registrarProducto(producto);

    if (verificar) {
      creadoExitoso(
          context, "La producto se registro correctamente", 'lista_articulo');
    } else {
      mensajeAlerta(
          context, "Error al registrar el producto", "No se pudo registrar");
    }
    return verificar;
  }

   /// Busca un producto utilizando un filtro de código.
  ///
  /// El parámetro [codeFiltro] es el código de filtro utilizado para la búsqueda.
  ///
  /// Retorna una lista de objetos [ProductoRequest] que coinciden con el filtro de código.
  Future<List<ProductoRequest>> buscarProducto(String codeFiltro) async {
    return await productoHttp.buscarProducto(codeFiltro);
  }

   /// Elimina un producto.
  ///
  /// El parámetro [context] es el contexto de la aplicación.
  /// El parámetro [producto] es un objeto [ProductoRequest] que representa el producto a eliminar.
  ///
  /// Retorna un valor booleano que indica si el producto se eliminó correctamente.
  Future<bool> eliminarProducto(
    BuildContext context,
    ProductoRequest producto,
  ) async {
    bool verificar = await productoHttp.eliminarProducto(producto);
    if (verificar) {
      mensajeAlerta(context, "Producto eliminado correctamente",
          "Se elimino correctamente");
    } else {
      mensajeAlerta(
          context, "Error al eliminar el producto", "No se pudo eliminar");
    }
    return verificar;
  }

  /// Lee un código de barras utilizando la biblioteca FlutterBarcodeScanner.
  ///
  /// El parámetro [context] es el contexto de la aplicación.
  ///
  /// Retorna una cadena de texto que representa el código de barras leído.
  Future<String> leerCodigoDeBarras(BuildContext context) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#3D8BEF', 'Cancelar', false, ScanMode.BARCODE);

    if (barcodeScanRes == "-1") {
      return "";
    }
    print("Codigo de barras: ");
    print(barcodeScanRes);
    return barcodeScanRes;
  }


   /// Actualiza un producto existente.
  ///
  /// El parámetro [context] es el contexto de la aplicación.
  /// El parámetro [producto] es un objeto [ProductoRequest] que representa el producto a actualizar.
  ///
  /// Retorna un valor booleano que indica si el producto se actualizó correctamente.
  Future actualizarProducto(
      BuildContext context, ProductoRequest producto) async {
    bool verificar = await productoHttp.actualizarProducto(producto);

    if (verificar) {
      creadoExitoso(
          context, "La producto se actualizó correctamente", 'lista_articulo');
    } else {
      mensajeAlerta(
          context, "Error al actualizar el producto", "No se pudo actualizar");
    }
    return verificar;
  }
}
