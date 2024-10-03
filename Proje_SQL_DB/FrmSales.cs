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
    public partial class FrmSales : Form
    {
        
        SQLConnection conn = new SQLConnection();

        public FrmSales()
        {
            InitializeComponent();
        }

        void list()
        {
            SqlCommand sql = new SqlCommand("select haraketId,ürünAd,müşteriAd + ' ' + müşteriSoyad as 'Müşteri',personelAdSoyad,adet,tutar,tarih,ürün,müşteri,personel from tblhareket " +
                            "inner join tblmüşteri on tblmüşteri.müşteriId = tblhareket.müşteri " +
                            "inner join tblpersonel on tblpersonel.personelId = tblhareket.personel " +
                            "inner join tblürünler on tblürünler.ürünId = tblhareket.ürün", conn.conncet());
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
                conn.conncet().Open();
                SqlCommand sql = new SqlCommand("insert into tblhareket (ürün,müşteri,personel,adet,tutar,tarih) values(@p1,@p2,@p3,@p4,@p5,@p6)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtProductId.Text);
                sql.Parameters.AddWithValue("@p2", TxtCustomerId.Text);
                sql.Parameters.AddWithValue("@p3", TxtEmployeeId.Text);
                sql.Parameters.AddWithValue("@p4", TxtPiece.Text);
                sql.Parameters.AddWithValue("@p5", TxtAmounth.Text);
                sql.Parameters.AddWithValue("@p6", TxtDate.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Sale informations have been saved");
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
                conn.conncet().Open();
                SqlCommand sql = new SqlCommand("delete from tblhareket where haraketId = (@p1)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtSalesId.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Sale informations have been deleted");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value for haraketId");

                throw;
            }
            
        }

        private void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand sql = new SqlCommand("update tblhareket set ürün = @p1, müşteri = @p2, personel = @p3, adet = @p4, tutar = @p5,tarih = @p6 where haraketId = @p7", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtProductId.Text);
                sql.Parameters.AddWithValue("@p2", TxtCustomerId.Text);
                sql.Parameters.AddWithValue("@p3", TxtEmployeeId.Text);
                sql.Parameters.AddWithValue("@p4", TxtPiece.Text);
                sql.Parameters.AddWithValue("@p5", TxtAmounth.Text);
                sql.Parameters.AddWithValue("@p6", TxtDate.Text);
                sql.Parameters.AddWithValue("@p7", TxtSalesId.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Sale informations have been updated");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value");

                throw;
            }
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            TxtSalesId.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            TxtProductName.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            TxtCustomerName.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            TxtPersonelAdSoyad.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            TxtPiece.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            TxtAmounth.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            TxtDate.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
            TxtProductId.Text = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();
            TxtCustomerId.Text = dataGridView1.Rows[e.RowIndex].Cells[8].Value.ToString();
            TxtEmployeeId.Text = dataGridView1.Rows[e.RowIndex].Cells[9].Value.ToString();
        }
    }
}
