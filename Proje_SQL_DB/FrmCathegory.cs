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
    public partial class FrmCathegory : Form
    {
        SQLConnection conn = new SQLConnection();

        public FrmCathegory()
        {
            InitializeComponent();
        }

        void list()
        {
            SqlCommand sql = new SqlCommand("Select * from tblKategori", conn.conncet());
            SqlDataAdapter da = new SqlDataAdapter(sql);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void BtnList_Click(object sender, EventArgs e)
        {
            list();
        }

        private void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand sql = new SqlCommand("insert into tblkategori (KategoriAd) values (@p1)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtKategoriAd.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("New cathegory has been saved");
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
                SqlCommand sql = new SqlCommand("delete from tblkategori where KategoriAd = (@p1)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtKategoriAd.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Cathegory has been deleted");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value for KategoriAd");

                throw;
            }
        }

        private void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand sql = new SqlCommand("update tblkategori set KategoriAd = (@p1) where KategoriId = (@p2)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtKategoriAd.Text);
                sql.Parameters.AddWithValue("@p2", TxtKategoriId.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Cathegory has been updated");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value");

                throw;
            }
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            TxtKategoriId.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            TxtKategoriAd.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
        }
    }
}