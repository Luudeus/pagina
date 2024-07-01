


$(document).ready(function () {
    // cargar datos
    tablaPoblar('ventasDetalle.aspx/pTabla', '', '#tableProductos');

    // clic boton eliminar
    $(document).on('click', '.btn-eliminar', function () {
        var id = $(this).data('id');
        eliminar('ventasDetalle.aspx/pEliminar', id, this);
    });

    // clic boton modificar
    $(document).on('click', '.btn-modificar', function () {
        event.preventDefault()
        var row = $(this).closest('tr');
        var folio = row.find('td:eq(0)').text();
        var fecha = row.find('td:eq(1)').text();
        var articulo = row.find('td:eq(2)').text();
        var precio = row.find('td:eq(3)').text();
        var cantidad = row.find('td:eq(4)').text();
        var descuento = row.find('td:eq(5)').text();
        var total = row.find('td:eq(6)').text();
        poblarModal(folio, fecha, articulo, precio, cantidad, descuento, total);
    });


    // clic boton guardar
    $('#buttonGuardar').on('click', function () {
        actualizarVenta();
    });
});

function tablaPoblar(pagina, parametros, control) {
    $.ajax({
        type: "POST",
        url: pagina,
        data: "{" + parametros + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        beforeSend: function (xhr) {

        },
        success: function (response) {
            $(control).html('');

            var param;
            var table_data = '';

            table_data += '<thead>';
            table_data += '<tr>';
            table_data += ' <th class= "text-wrap" >Folio</th> ';
            table_data += ' <th class= "text-wrap" >Fecha</th> ';
            table_data += ' <th class= "text-wrap" >Articulo</th> ';
            table_data += ' <th class= "text-wrap" >Precio</th> ';
            table_data += ' <th class= "text-wrap" >Cantidad </th> ';
            table_data += ' <th class= "text-wrap" >Descuento</th> ';
            table_data += ' <th class= "text-wrap" >Total</th> ';
            table_data += ' <th class= "text-wrap" ></th> '; //boton editar
            table_data += ' <th class= "text-wrap" ></th> '; //boton eliminar
            table_data += '</tr>';
            table_data += '</thead>';

            table_data += '<tbody>';

            $.each(response.d, function (index, item) {
                table_data += '<tr>';
                table_data += '<td>' + item.folio + '</td>';
                table_data += '<td>' + item.fecha + '</td>';
                table_data += '<td>' + item.articulo + '</td>';
                table_data += '<td>' + item.precio + '</td>';
                table_data += '<td>' + item.cantidad + '</td>';
                table_data += '<td>' + item.descuento + '</td>';
                table_data += '<td>' + item.total + '</td>';
                table_data += '<td><button class="btn btn-warning btn-modificar" data-id="' + item.folio + '">Modificar</button></td>';
                table_data += '<td><button class="btn btn-danger btn-eliminar" data-id="' + item.folio + '">Eliminar</button></td>';
                table_data += '</tr>';
            });

            table_data += '</tbody>';

            $(control).html(table_data);
        },
        failure: function (response) {
            alert('falla ' + response);
        }
    });
}

function eliminar(pagina, id, control) {
    var parametros = "'p1':'" + id + "'";
    $.ajax({
        type: "POST",
        url: pagina,
        data: "{" + parametros + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        beforeSend: function (xhr) {
            $(control).prop("disabled", true);
        },
        success: function (response) {
            alert(response.d);
            $(control).prop("disabled", false);
            tablaPoblar('ventasDetalle.aspx/pTabla', '', '#tableProductos');
        },
        failure: function (response) {
            alert('falla ' + response);
        }
    });
}
function poblarModal(folio, fecha, articulo, precio, cantidad, descuento, total) {
    $('#folio').val(folio);
    $('#fecha').val(fecha);
    $('#articulo').val(articulo);
    $('#precio').val(precio);
    $('#cantidad').val(cantidad);
    $('#descuento').val(descuento);
    $('#total').val(total);

    $('#staticBackdrop').modal('show');
}

function actualizarVenta() {
    var folio = $('#folio').val();
    var articulo = $('#articulo').val();
    var precio = $('#precio').val();
    var cantidad = $('#cantidad').val();
    var descuento = $('#descuento').val();
    var total = $('#total').val();

    var parametros = {
        folio: folio,
        articulo: articulo,
        precio: precio,
        cantidad: cantidad,
        descuento: descuento,
        total: total
    };

    $.ajax({
        type: "POST",
        url: 'ventasDetalle.aspx/pActualizar',
        data: JSON.stringify(parametros),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            alert(response.d);
            $('#staticBackdrop').modal('hide');
            tablaPoblar('ventasDetalle.aspx/pTabla', '', '#tableProductos');
        },
        failure: function (response) {
            alert('Error al actualizar la venta: ' + response);
        }
    });
}