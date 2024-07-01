using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplicationPrueba4
{
    public class Class_Modulos
    {
        public SqlConnection con;


        public void conectar()
        {

            string cadena = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString.ToString();

            con = new SqlConnection(cadena);
            con.Open(); // abre coneccion            

        }

        // borrar despues, solo para testing
        public bool ProbarConexion()
        {
            try
            {
                conectar();
                desconectar();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    

        public void desconectar()
        {

            con.Dispose(); // libera recursos
            con.Close(); // cierra coneccion        
        }

        public void ejecutarSql(string strSql)
        {
            SqlCommand cmdSql;

            cmdSql = new SqlCommand(strSql, con);
            cmdSql.CommandTimeout = 0;
            cmdSql.ExecuteNonQuery();
            cmdSql.Dispose();

        }

        public SqlDataReader ObtenerDatosSql(string StrSql)
        {

            SqlCommand cmdSql;
            SqlDataReader myData;


            cmdSql = new SqlCommand(StrSql, con);
            cmdSql.CommandTimeout = 0;
            myData = cmdSql.ExecuteReader();
            cmdSql.Dispose();

            return myData;

        }

        public string Carga_Select(SqlDataReader DrSql)
        {
            string Script;

            Script = "";

            Script += " <option value='0' selected disabled>Seleccione...</option> \n";

            while (DrSql.Read())
            {

                Script += " <option value='" + DrSql[0].ToString() + "'>" + DrSql[1].ToString() + "</option> \n";

            }

            DrSql.Close();

            return Script;
        }


    }
}