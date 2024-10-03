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
    public partial class FrmProduct : Form
    {
        
        SQLConnection conn = new SQLConnection();

        public FrmProduct()
        {
            InitializeComponent();
        }

        void list()
        {
            SqlCommand sql = new SqlCommand("Select ürünId, ürünAd, ürünMarka, kategori, kategoriAd, ürünAlışFiyat, ürünSatışFiyat, ürünStok, ürünDurum from tblürünler inner join tblkategori on tblkategori.kategoriId = tblürünler.kategori", conn.conncet());
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
                SqlCommand sql = new SqlCommand("insert into tblürünler (ürünAd,ürünMarka,kategori,ürünAlışFiyat,ürünSatışFiyat,ürünStok,ürünDurum) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtProductAd.Text);
                sql.Parameters.AddWithValue("@p2", TxtBrand.Text);
                sql.Parameters.AddWithValue("@p3", TxtCathegory.Text);
                sql.Parameters.AddWithValue("@p4", TxtBuyPrice.Text);
                sql.Parameters.AddWithValue("@p5", TxtSalePrice.Text);
                sql.Parameters.AddWithValue("@p6", TxtStock.Text);
                sql.Parameters.AddWithValue("@p7", TxtSituation.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Product has been saved");
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
                SqlCommand sql = new SqlCommand("delete from tblürünler where ürünId = (@p1)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtProductId.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Product has been deleted");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value for ürünId");

                throw;
            }
            
        }

        private void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                SqlCommand sql = new SqlCommand("update tblürünler set ürünAd = @p1, ürünMarka = @p2, kategori = @p3, ürünAlışFiyat = @p4, ürünSatışFiyat = @p5, ürünStok = @p6, ürünDurum = @p7 where ürünId = @p8", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtProductAd.Text);
                sql.Parameters.AddWithValue("@p2", TxtBrand.Text);
                sql.Parameters.AddWithValue("@p3", TxtCathegoryId.Text);
                sql.Parameters.AddWithValue("@p4", TxtBuyPrice.Text);
                sql.Parameters.AddWithValue("@p5", TxtSalePrice.Text);
                sql.Parameters.AddWithValue("@p6", TxtStock.Text);
                sql.Parameters.AddWithValue("@p7", TxtSituation.Text);
                sql.Parameters.AddWithValue("@p8", TxtProductId.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Product has been updated");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value");

                throw;
            }
        }

        private void BtnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            TxtProductId.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            TxtProductAd.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            TxtBrand.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            TxtCathegoryId.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            TxtCathegory.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            TxtBuyPrice.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            TxtSalePrice.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
            TxtStock.Text = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();
            TxtSituation.Text = dataGridView1.Rows[e.RowIndex].Cells[8].Value.ToString();
        }
    }
}
