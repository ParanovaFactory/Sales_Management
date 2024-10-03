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
    public partial class FrmCustomer : Form
    {

        SQLConnection conn = new SQLConnection();

        public FrmCustomer()
        {
            InitializeComponent();
        }

        void list()
        {
            SqlCommand sql = new SqlCommand("select * from tblmüşteri", conn.conncet());
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
                SqlCommand sql = new SqlCommand("insert into tblmüşteri (müşteriAd, müşteriSoyad, müşteriŞehir, müşteriBakiye) values(@p1,@p2,@p3,@p4)", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtCustomerName.Text);
                sql.Parameters.AddWithValue("@p2", TxtCustomerSurname.Text);
                sql.Parameters.AddWithValue("@p3", CmbCity.Text);
                sql.Parameters.AddWithValue("@p4", decimal.Parse(TxtBudget.Text));
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Customer has been saved");
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
                SqlCommand sql = new SqlCommand("delete from tblmüşteri where müşteriId = @p1", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtCustomeriId.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Customer has been deleted");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value for müşteriId");

                throw;
            }
            
        }

        private void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand sql = new SqlCommand("update tblmüşteri set müşteriAd = @p1, müşteriSoyad = @p2, müşteriŞehir = @p3, müşteriBakiye = @p4 where müşteriıd = @p5", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtCustomerName.Text);
                sql.Parameters.AddWithValue("@p2", TxtCustomerSurname.Text);
                sql.Parameters.AddWithValue("@p3", CmbCity.Text);
                sql.Parameters.AddWithValue("@p4", TxtBudget.Text);
                sql.Parameters.AddWithValue("@p5", TxtCustomeriId.Text);
                sql.ExecuteNonQuery();
                conn.conncet().Close();
                list();
                MessageBox.Show("Customer has been updated");
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value");

                throw;
            }
            
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            TxtCustomeriId.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            TxtCustomerName.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            TxtCustomerSurname.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            CmbCity.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            TxtBudget.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
        }

        private void FrmCustomer_Load(object sender, EventArgs e)
        {
            SqlCommand sql = new SqlCommand("select * from tblşehirler", conn.conncet());
            SqlDataReader reader = sql.ExecuteReader();
            while(reader.Read())
            {
                CmbCity.Items.Add(reader["şehir"]);
            }
            conn.conncet().Close();
        }

        private void BtnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand sql = new SqlCommand("select * from tblmüşteri where müşteriAd = @p1", conn.conncet());
                sql.Parameters.AddWithValue("@p1", TxtCustomerName.Text);
                SqlDataAdapter da = new SqlDataAdapter(sql);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                conn.conncet().Close();
            }
            catch (Exception)
            {
                MessageBox.Show("Enter the invalid value");
                throw;
            }
        }
    }
}