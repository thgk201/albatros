using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQL;
using System.Data;
using System.Data.SqlClient;

namespace Clientes
{
    public class Clientes
    {
        public string usp_insertcliente(string codigoCliente, string nombre, string RTN, string direccion)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_insertproducto", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codigoCliente", codigoCliente);
                cmd.Parameters.AddWithValue("@nombre", nombre);
                cmd.Parameters.AddWithValue("@RTN", RTN);
                cmd.Parameters.AddWithValue("@direccion", direccion);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Cliente Almacenado con exito.";

            }
            catch (Exception e)
            {
                return "Error en codigo o RTN del cliente duplicado, favor verificar";
            }


        }

        public string usp_updatecliente(int idCliente, string codigoCliente, string nombre, string RTN, string direccion)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_updatecliente", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idCliente", idCliente);
                cmd.Parameters.AddWithValue("@codigoCliente", codigoCliente);
                cmd.Parameters.AddWithValue("@nombre", nombre);
                cmd.Parameters.AddWithValue("@RTN", RTN);
                cmd.Parameters.AddWithValue("@direccion", direccion);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Cliente actualizado con exito.";

            }
            catch (Exception e)
            {
                return "favro de verificar sus datos";
            }


        }

        public string usp_deletecliente(int idCliente)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_deletecliente", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idCliente", idCliente);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Cliente eliminado con exito.";

            }
            catch (Exception e)
            {
                return "favro de verificar sus datos";
            }


        }

    }
}
