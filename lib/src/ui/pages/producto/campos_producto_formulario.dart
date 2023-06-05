import 'package:alegra_store/src/domain/requests/categoria_producto_request.dart';
import 'package:alegra_store/src/domain/requests/producto_request.dart';
import 'package:flutter/material.dart';

Widget nombreProductoText(ProductoRequest productoRequest,
    {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    initialValue: productoRequest.nombre,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: Icon(Icons.point_of_sale_outlined, color: Colors.blue),
      counterText: "",
      hintText: 'ingrese un nombre',
      label: Text(
        'Nombre del producto',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    onSaved: (value) => productoRequest.nombre = value!,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingrese un nombre';
      }
      return null;
    },
  );
}

Widget codigoProducto(ProductoRequest productoRequest,
    TextEditingController codigoProductoController,
    {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    controller: codigoProductoController,
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: Icon(Icons.qr_code, color: Colors.blue),
      counterText: "",
      hintText: 'ingrese un precio',
      label: Text(
        'Codigo del producto',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    onSaved: (value) => productoRequest.codigo = value!,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingrese un nombre';
      }
      return null;
    },
  );
}

Widget precioVentaProducto(ProductoRequest productoRequest,
    {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    initialValue: productoRequest.precioVenta.toString(),
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: Icon(Icons.monetization_on, color: Colors.blue),
      counterText: "",
      hintText: 'ingrese un precio',
      label: Text(
        'Precio de venta',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    onSaved: (value) => productoRequest.precioVenta = int.parse(value!),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingrese un nombre';
      }
      return null;
    },
  );
}

Widget precioCompraArticulo(ProductoRequest productoRequest,
    {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    initialValue: productoRequest.precioCompra.toString(),
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: Icon(Icons.monetization_on, color: Colors.blue),
      counterText: "",
      hintText: 'ingrese un precio',
      label: Text(
        'Precio de compra',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    onSaved: (value) => productoRequest.precioCompra =
        int.parse(value!), //_reporteFiltroRequest.nombre = value!,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingrese un nombre';
      }
      return null;
    },
  );
}

Widget cantidadProductoNum(ProductoRequest productoRequest,
    {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    initialValue: productoRequest.cantidad.toString(),
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: Icon(Icons.production_quantity_limits, color: Colors.blue),
      counterText: "",
      hintText: 'ingrese una cantidad',
      label: Text(
        'Cantidad',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    onSaved: (value) => productoRequest.cantidad =
        int.parse(value!), //_reporteFiltroRequest.nombre = value!,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingrese un nombre';
      }
      return null;
    },
  );
}

Widget pesoProducto(ProductoRequest productoRequest, {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    initialValue: productoRequest.peso.toString(),
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: Icon(Icons.production_quantity_limits, color: Colors.blue),
      counterText: "",
      hintText: 'ingrese el peso',
      label: Text(
        'Peso',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    onSaved: (value) => productoRequest.peso = int.parse(value!),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingrese un nombre';
      }
      return null;
    },
  );
}

Widget listaTipoArticulo(
    ProductoRequest productoRequest,
    List<CategoriaProductoRequest> listaTipoArticulos,
    Function(String?) onChanged,
    {bool enabled = true}) {
  return DropdownButtonFormField<String>(
    value: productoRequest.idCategory == 0
        ? null
        : productoRequest.idCategory.toString(),
    hint: const Text('Seleccione una tipo',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'CaviarDreamsRegular',
        )),
    onSaved: (value) => productoRequest.idCategory = int.parse(value!),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Seleccione una tipo';
      }
      return null;
    },
    isExpanded: true,
    icon: const Icon(Icons.arrow_downward),
    elevation: 16,
    style: const TextStyle(
      color: Colors.black,
    ),
    items: listaTipoArticulos.map((CategoriaProductoRequest value) {
      return DropdownMenuItem<String>(
        onTap: () {
          productoRequest.categoria = value.name;
        },
        value: value.id,
        child: Text(value.name,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'CaviarDreamsRegular',
            )),
      );
    }).toList(),
    onChanged: enabled ? onChanged : null,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: Icon(Icons.calendar_month_outlined),
      counterText: "",
      hintText: 'Seleccione un tipo de articulo',
      label: Text(
        'Tipo de articulo',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}

Widget fechaExpiracionText(ProductoRequest productoRequest,
    TextEditingController actualizadoInputFechaIngreso, BuildContext context,
    {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    controller: actualizadoInputFechaIngreso,
    onSaved: (value) => productoRequest.fechaExpiracion = value!,
    //validator: (value) => value!.isEmpty ? 'Ingrese la fecha' : null,
    onTap: () async {
      DateTime? newDateTime = await showDatePicker(
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(),
              ),
              child: child!,
            );
          },
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: (DateTime.now()).add(const Duration(days: 3000)));

      if (newDateTime == null) {
        return;
      }
      String fechaBusqueda = newDateTime.toString().substring(0, 10);
      //fechaBusqueda = fechaBusqueda.replaceAll('-', '/');
      actualizadoInputFechaIngreso.text = fechaBusqueda;
    },
    readOnly: true,
    style: const TextStyle(color: Colors.black),
    maxLength: 50,
    keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: Icon(Icons.calendar_month_outlined),
      counterText: "",
      hintText: 'Seleccione la fecha de expiración',
      label: Text(
        'Fecha expiración',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    onChanged: (value) {},
  );
}

Widget descripcionProducto(ProductoRequest productoRequest,
    {bool enabled = true}) {
  return TextFormField(
    enabled: enabled,
    minLines: 3,
    maxLines: 5,
    initialValue: productoRequest.descripcion,
    keyboardType: TextInputType.text,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      prefixIcon: Icon(Icons.point_of_sale_outlined, color: Colors.blue),
      counterText: "",
      hintText: 'ingrese un descripción',
      label: Text(
        'Descripcion',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    onSaved: (value) => productoRequest.descripcion =
        value!, //_reporteFiltroRequest.nombre = value!,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingrese un nombre';
      }
      return null;
    },
  );
}
