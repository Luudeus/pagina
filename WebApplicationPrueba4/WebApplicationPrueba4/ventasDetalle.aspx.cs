using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationPrueba4.modelos;

namespace WebApplicationPrueba4
{
    public partial class ventasDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // borrar despues, solo para testing
            if (!IsPostBack)
            {
                // Metodo para probar la conexión a la base de datos al cargar la página
                ProbarConexionBaseDatos();
            }
        }

        // borrar despues, solo para testing
        private void ProbarConexionBaseDatos()
        {
            Class_Modulos conexion = new Class_Modulos();
            bool conexionExitosa = conexion.ProbarConexion();
            if (conexionExitosa)
            {
                // Si la conexión fue exitosa, muestra un mensaje en la consola o en la página
                System.Diagnostics.Debug.WriteLine("Conexión a la base de datos exitosa.");
                // O puedes mostrar un mensaje en la página
                Response.Write("<script>alert('Conexión a la base de datos exitosa.');</script>");
            }
            else
            {
                // La conexión falló, muestra un mensaje en la consola o en la página
                System.Diagnostics.Debug.WriteLine("Error al conectar con la base de datos.");
                Response.Write("<script>alert('Error al conectar con la base de datos.');</script>");
            }
        }

        [WebMethod()]
        public static List<ClassVentasDetalle.ventaProductos> pTabla()
        {
            string strSql;
            List<ClassVentasDetalle.ventaProductos> respuesta = new List<ClassVentasDetalle.ventaProductos>();

            strSql = "";
            strSql += "SELECT V.Venta_Id AS folio, \n";
            strSql += "       V.Venta_Fecha_Hora AS fecha, \n";
            strSql += "       A.Articulo_Nombre AS articulo, \n";
            strSql += "       VD.Ventas_Detalle_Precio AS precio, \n";
            strSql += "       VD.Ventas_Detalle_Cantidad AS cantidad, \n";
            strSql += "       VD.Ventas_Detalle_Descuento AS descuento, \n";
            strSql += "       (VD.Ventas_Detalle_Precio * VD.Ventas_Detalle_Cantidad) - VD.Ventas_Detalle_Descuento AS Total \n";
            strSql += "FROM Ventas V \n";
            strSql += "INNER JOIN Ventas_Detalle VD ON VD.Venta_Id = V.Venta_Id \n";
            strSql += "INNER JOIN Articulos A ON A.Articulo_Id = VD.Articulo_Id \n";
            strSql += "WHERE V.Venta_Estado = 1; \n";

            Class_Modulos conexion = new Class_Modulos();
            conexion.conectar();
            SqlDataReader reader = conexion.ObtenerDatosSql(strSql);

            while (reader.Read())
            {
                ClassVentasDetalle.ventaProductos venta = new ClassVentasDetalle.ventaProductos
                {
                    folio = reader["folio"].ToString(),
                    fecha = reader["fecha"].ToString(),
                    articulo = reader["articulo"].ToString(),
                    precio = reader["precio"].ToString(),
                    cantidad = reader["cantidad"].ToString(),
                    descuento = reader["descuento"].ToString(),
                    total = reader["Total"].ToString()
                };
                respuesta.Add(venta);
            }
            conexion.desconectar();

            return respuesta;
        }

        [WebMethod()]
        public static string pEliminar(string p1)
        {
            string strSql;
            strSql = "UPDATE Ventas SET Venta_Estado = 0 WHERE Venta_Id = @VentaId";

            Class_Modulos conexion = new Class_Modulos();
            conexion.conectar();
            SqlCommand cmd = new SqlCommand(strSql, conexion.con);
            cmd.Parameters.AddWithValue("@VentaId", p1);

            try
            {
                cmd.ExecuteNonQuery();
                conexion.desconectar();
                return "Venta eliminada exitosamente";
            }
            catch (Exception ex)
            {
                conexion.desconectar();
                return "Error al eliminar la venta: " + ex.Message;
            }
        }

        [WebMethod()]
        public static string pActualizar(string folio, string articulo, string precio, string cantidad, string descuento)
        {
            string strSql;
            strSql = "UPDATE Ventas_Detalle SET Ventas_Detalle_Precio = @Precio, Ventas_Detalle_Cantidad = @Cantidad, Ventas_Detalle_Descuento = @Descuento " +
                     "WHERE Venta_Id = @VentaId AND Articulo_Id = (SELECT Articulo_Id FROM Articulos WHERE Articulo_Nombre = @Articulo)";

            Class_Modulos conexion = new Class_Modulos();
            conexion.conectar();
            SqlCommand cmd = new SqlCommand(strSql, conexion.con);
            cmd.Parameters.AddWithValue("@VentaId", folio);
            cmd.Parameters.AddWithValue("@Articulo", articulo);
            cmd.Parameters.AddWithValue("@Precio", precio);
            cmd.Parameters.AddWithValue("@Cantidad", cantidad);
            cmd.Parameters.AddWithValue("@Descuento", descuento);

            try
            {
                cmd.ExecuteNonQuery();
                conexion.desconectar();
                return "Venta actualizada exitosamente";
            }
            catch (Exception ex)
            {
                conexion.desconectar();
                return "Error al actualizar la venta: " + ex.Message;
            }
        }
    }
}



