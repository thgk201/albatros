using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using SQL;

namespace AlbatrosTest
{
    public partial class impuestos : Form
    {
        public impuestos()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try { 
            SQLCONEXION otraconexion = new SQLCONEXION();

            SqlCommand cmd = new SqlCommand("usp_insertImpuesto", otraconexion.AbrirConexion());
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@tipoImpuesto", Convert.ToString(txttipoimpuesto.Text));

            SqlDataReader dr = cmd.ExecuteReader();

            label2.Visible = true;
            
            otraconexion.CerrarConexion();

            //    if (dr.Read())
            //{
            //    //label2.Visible = true;
            //}

                SqlCommand cmd1 = new SqlCommand("usp_selectimpuesto", otraconexion.AbrirConexion());
                cmd1.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr1 = cmd1.ExecuteReader();

                if (dr1.Read())
                {

                    SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    otraconexion.CerrarConexion();
                    dataGridView1.DataSource = dt;
                }


                //label2.Visible = true;

                


            }
 catch(SqlException ex)
{
  MessageBox.Show(ex.ToString());

}

}

        private void label3_Click(object sender, EventArgs e)
        {

        }
    }
}
