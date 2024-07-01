<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ventasDetalle.aspx.cs" Inherits="WebApplicationPrueba4.ventasDetalle" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <!-- Archivo CSS Bootstrap 5 -->
    <link href="scripts/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
                <!-- aca comienza mi pagina -->
                <main>

                  <div class="container mb-5">
 
                    <!-- Header -->
                    <header class="d-flex flex-wrap py-3 mb-5 border-bottom">
 
                      <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                        <div class="container">
                          <a class="navbar-brand" href="#">La Vega</a>
                          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                          </button>
                          <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
 
                              <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>                    
                              </li>
 
                              <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="#">Productos</a>                    
                              </li>
 
                              <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="#">Servicios</a>                    
                              </li>
 
                              <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="#">Contacto</a>                    
                              </li>
 
                            </ul>
                          </div>
                        </div>
                      </nav>
 
                    </header>

                    <!-- formualario -->

                    <div class="row mb-5">
                      <div class="col-md-12 text-center">
                        <h1>Ventas -> Registros -> Vizualizar</h1>
                        <p class="mt-3"> Fomulario para visualizacion de ventas de la tienda </p>
                      </div>
                    </div>


                    <div class="row justify-content-center">
                        <div class="col-md-6 ">
                            <div class="input-group mb-3">
                                <table id ="tableProductos" class="table table-striped">

                                </table>                                                                  
                            </div>
                            <div class="d-grid gap-2 mb-3">
     
                               <button type="button" class="btn btn-primary" id="buttonAceptar">Cerrar</button>      
                            </div>
                        </div>
                    </div>  
        
                  </div>
                 
                </main>

                <!-- Footer -->  
                <footer class="footer mt-auto py-3 bg-light">
                  <div class="container">
                    <span class="text-muted">Mi Proyecto App Moviles © <script>document.write(new Date().getFullYear())</script> </span>
                  </div>
                </footer>

        </div>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
               
                  <div class="mb-3">
                      <label for="folio" class="col-form-label">Pro Id:</label>
                      <input type="text" class="form-control" id="folio" disabled />
                  </div>

                  <div class="mb-3">
                      <label for="fecha" class="col-form-label">fecha:</label>
                      <input type="text" class="form-control" id="fecha" disabled />
                  </div>

                  <div class="mb-3">
                      <label for="articulo" class="col-form-label">Nombre:</label>
                      <input type="text" class="form-control" id="articulo" />
                  </div>

                  <div class="mb-3">
                      <label for="precio" class="col-form-label">Precio:</label>
                      <input type="text" class="form-control" id="precio" />
                  </div>

                  <div class="mb-3">
                      <label for="cantidad" class="col-form-label">Cantidad:</label>
                      <input type="text" class="form-control" id="cantidad" />
                  </div>
                  <div class="mb-3">
                      <label for="descuento" class="col-form-label">Descuento:</label>
                      <input type="text" class="form-control" id="descuento" />
                  </div>
                  <div class="mb-3">
                      <label for="total" class="col-form-label">Total:</label>
                      <input type="text" class="form-control" id="total" />
                  </div>
                  

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="buttonGuardar">Guardar</button>
              </div>
            </div>
          </div>
        </div>

    </form>

     <!-- Archivo JS Bootstrap 5 -->  
    <script src="scripts/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>

    <!-- Archivo JS jQuery -->
    <script src="scripts/jQuery/jquery-3.7.1.min.js"></script>

    <!-- Archivo JS personalizado -->
    <script src="js/ventasDetalle.js"></script>

</body>
</html>



