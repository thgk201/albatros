using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQL;

namespace Productos
{
    public class Producto
    {
        public string insertproductos(string codigoProducto, string descripcion, decimal precioProducto, int idImpuesto)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_insertproducto", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@codigoProducto", codigoProducto);
                cmd.Parameters.AddWithValue("@descripcion", descripcion);
                cmd.Parameters.AddWithValue("@precioProducto", precioProducto);
                cmd.Parameters.AddWithValue("@idImpuesto", idImpuesto);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();
             
                return "Producto Almacenado con exito.";

            }
            catch (Exception e)
            {
                return "Error en codigo de producto duplicado";
            }

          
        }


        public string updateproductos(int iditem, string codigoProducto, string descripcion, decimal precioProducto, int idImpuesto)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_updateproducto", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@iditem", iditem);
                cmd.Parameters.AddWithValue("@codigoProducto", codigoProducto);
                cmd.Parameters.AddWithValue("@descripcion", descripcion);
                cmd.Parameters.AddWithValue("@precioProducto", precioProducto);
                cmd.Parameters.AddWithValue("@idImpuesto", idImpuesto);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Producto actualizado con exito.";

            }
            catch (Exception e)
            {
                return "Favor verifica tu datos";
            }


        }


        public string deleteproductos(int iditem)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_deleteproducto", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@iditem", iditem);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Producto eliminado con exito.";

            }
            catch (Exception e)
            {
                return "Favor verifica tu datos";
            }


        }


    }
}
