using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Productos;
using System.Data;
using System.Data.SqlClient;
using SQL;

namespace AlbatrosTest
{
    public partial class productosform : Form
    {
        public productosform()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Producto producto = new Producto();

            decimal precioconvert = Convert.ToDecimal(txtprecio.Text);
            string respuesta = producto.insertproductos(txtcodigoproducto.Text, txtdescripcion.Text, precioconvert, comboBox1.SelectedIndex);

            label5.Text = respuesta;
            label5.Visible = true;

            


        }

        private void productosform_Load(object sender, EventArgs e)
        {
            DataTable dtimpuesto = new DataTable();
            SQLCONEXION otraconexion = new SQLCONEXION();

            SqlCommand cmd = new SqlCommand("usp_getimpuestos", otraconexion.AbrirConexion());
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader dr = cmd.ExecuteReader();

            otraconexion.CerrarConexion();
            using (SqlDataAdapter adap = new SqlDataAdapter(cmd))
                {
                    adap.Fill(dtimpuesto);
                
            }
            comboBox1.DataSource = dtimpuesto;
                comboBox1.DisplayMember = "tipoImpuesto";
                comboBox1.ValueMember = "idImpuesto";




            SQLCONEXION otraconexions = new SQLCONEXION();

            SqlCommand cmd1 = new SqlCommand("usp_getproductos", otraconexions.AbrirConexion());
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader dr1 = cmd1.ExecuteReader();

            SqlDataAdapter sdaa = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            otraconexions.CerrarConexion();
            sdaa.Fill(dt);

            dataGridView1.DataSource = dt;


        }

        private void dataGridView1_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int ID = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString());
            txtcodigoproducto.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtdescripcion.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtprecio.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            decimal precio = Convert.ToDecimal(txtprecio.Text);
            //comboBox1.SelectedIndex = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();

        }





        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}
