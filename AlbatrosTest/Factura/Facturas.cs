using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQL;
using System.Data;
using System.Data.SqlClient;


namespace Factura
{
    public class Facturas
    {
        public string insertheader(int idCliente, decimal totalImpuesto, decimal TotalFactura)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_insertheader", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idCliente", idCliente); 
                cmd.Parameters.AddWithValue("@totalimpuesto", totalImpuesto);
                cmd.Parameters.AddWithValue("@TotalFactura", TotalFactura);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Header Almacenado con exito.";

            }
            catch (Exception e)
            {
                return "Error, favor verificar sus datos";
            }


        }

        public string updatetheader(int idNumFactura, int idCliente, decimal totalImpuesto, decimal TotalFactura)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_updateheader", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idNumFactura", idNumFactura);
                cmd.Parameters.AddWithValue("@idCliente", idCliente);
                cmd.Parameters.AddWithValue("@totalimpuesto", totalImpuesto);
                cmd.Parameters.AddWithValue("@TotalFactura", TotalFactura);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Header actualizado con exito.";

            }
            catch (Exception e)
            {
                return "Error, favor verificar sus datos";
            }


        }

        public string deletetheader(int idNumFactura)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_deleteheader", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idNumFactura", idNumFactura);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Header eliminado con exito.";

            }
            catch (Exception e)
            {
                return "Error, favor verificar sus datos";
            }


        }


        public string insertdetail(int idNumFactura, int idItem, int cantidad, decimal precio, int idImpuesto,  decimal totalProductos)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_insertdetail", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idNumFactura", idNumFactura);
                cmd.Parameters.AddWithValue("@idItem", idItem);
                cmd.Parameters.AddWithValue("@cantidad", cantidad);
                cmd.Parameters.AddWithValue("@precio", precio);
                cmd.Parameters.AddWithValue("@idImpuesto", idImpuesto);
                cmd.Parameters.AddWithValue("@totalProductos", totalProductos);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Detalles Almacenado con exito.";

            }
            catch (Exception e)
            {
                return "Error, favor verificar sus datos";
            }


        }

        public string updatedetail(int idDetail, int idNumFactura, int idItem, int cantidad, decimal precio, int idImpuesto, decimal totalProductos)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_updatedetail", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idDetail", idDetail);
                cmd.Parameters.AddWithValue("@idNumFactura", idNumFactura);
                cmd.Parameters.AddWithValue("@idItem", idItem);
                cmd.Parameters.AddWithValue("@cantidad", cantidad);
                cmd.Parameters.AddWithValue("@precio", precio);
                cmd.Parameters.AddWithValue("@idImpuesto", idImpuesto);
                cmd.Parameters.AddWithValue("@totalProductos", totalProductos);

                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Detalles actualizados con exito.";

            }
            catch (Exception e)
            {
                return "Error, favor verificar sus datos";
            }


        }

        public string deletedetail(int idDetail, int idNumFactura, int idItem, int cantidad, decimal precio, int idImpuesto, decimal totalProductos)
        {
            try
            {
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_deletedetail", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idDetail", idDetail);


                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                return "Detalles eliminados con exito.";

            }
            catch (Exception e)
            {
                return "Error, favor verificar sus datos";
            }


        }

        public DataTable reporte1 ()
        {
            try
            {
                DataTable dtreporte1 = new DataTable();
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_getreporte1", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;


                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                {
                    adap.Fill(dtreporte1);

                }

                return dtreporte1;

            }
            catch (Exception e)
            {
                DataTable dterror = new DataTable();
               return dterror;
            }


        }


        public DataTable reporte2()
        {
            try
            {
                DataTable dtreporte1 = new DataTable();
                SQLCONEXION otraconexion = new SQLCONEXION();

                SqlCommand cmd = new SqlCommand("usp_getreporte2", otraconexion.AbrirConexion());
                cmd.CommandType = CommandType.StoredProcedure;


                SqlDataReader dr = cmd.ExecuteReader();

                otraconexion.CerrarConexion();

                using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                {
                    adap.Fill(dtreporte1);

                }

                return dtreporte1;

            }
            catch (Exception e)
            {
                DataTable dterror = new DataTable();
                return dterror;
            }


        }



    }
}
