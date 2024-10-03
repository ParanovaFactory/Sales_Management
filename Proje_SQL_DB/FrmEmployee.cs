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

namespace Proje_SQL_DB
{
    public partial class FrmEmployee : Form
    {
        
        SQLConnection conn = new SQLConnection();

        public FrmEmployee()
        {
            InitializeComponent();
        }

        void list()
        {
            SqlCommand sql = new SqlCommand("select * from tblpersonel", conn.conncet());
            SqlDataAdapter da = new SqlDataAdapter(sql);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            conn.conncet().Close();
        }

        private void BtnList_Click(object sender, EventArgs e)
        {
            list();
        }

        private void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand sql = new SqlCommand("insert into tblpersonel (personelAdSoyad) values (@p1)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtPersonelAdSoyad.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Employee has been saved");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value");

                throw;
            }
        }

        private void BtnDelete_Click(object sender, EventArgs e)
        {
            try
            {

                SqlCommand sql = new SqlCommand("delete from tblpersonel where personelId = (@p1)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtPersonelId.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Employee has been deleted");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value for personelId");

                throw;
            }
        }

        private void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                SqlCommand sql = new SqlCommand("update tblpersonel set personelAdSoyad = (@p1) where personelId = (@p2)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtPersonelAdSoyad.Text);
                sql.Parameters.AddWithValue("@p2", TxtPersonelId.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Employee has been updated");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value");

                throw;
            }
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            TxtPersonelId.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            TxtPersonelAdSoyad.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
        }
    }
}
