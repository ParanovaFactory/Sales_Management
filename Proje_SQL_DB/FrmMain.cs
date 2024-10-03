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
    public partial class FrmMain : Form
    {
        
        SQLConnection conn = new SQLConnection();

        public FrmMain()
        {
            InitializeComponent();
        }

        private void BtnCathegories_Click(object sender, EventArgs e)
        {
            FrmCathegory fr = new FrmCathegory();
            fr.Show();
        }

        private void BtnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void BtnProducts_Click(object sender, EventArgs e)
        {
            FrmProduct fr = new FrmProduct();
            fr.Show();
        }

        private void BtnEmployees_Click(object sender, EventArgs e)
        {
            FrmEmployee fr = new FrmEmployee();
            fr.Show();
        }

        private void BtnCashRegister_Click(object sender, EventArgs e)
        {
            FrmCashRegister fr = new FrmCashRegister();
            fr.Show();
        }

        private void BtnCustomers_Click(object sender, EventArgs e)
        {
            FrmCustomer fr = new FrmCustomer();
            fr.Show();
        }

        private void BtnSales_Click(object sender, EventArgs e)
        {
            FrmSales fr = new FrmSales();
            fr.Show();
        }

        private void FrmMain_Load(object sender, EventArgs e)
        {
            SqlCommand sql = new SqlCommand("exec ürünDurum", conn.conncet());
            SqlDataAdapter da = new SqlDataAdapter(sql);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            
            SqlCommand sql2 = new SqlCommand("select ürünAd, sum(adet) from tblhareket inner join tblürünler on tblürünler.ürünId = tblhareket.ürün group by ürünad", conn.conncet());
            SqlDataReader dr = sql2.ExecuteReader();
            while(dr.Read())
            {
                chart1.Series["Sales of Products"].Points.AddXY(dr[0], dr[1]);
            }
            dr.Close();

            SqlCommand sql3 = new SqlCommand("select müşteriŞehir,count(müşteriŞehir) from tblmüşteri group by müşteriŞehir", conn.conncet());
            SqlDataReader dr2 = sql3.ExecuteReader();
            while (dr2.Read())
            {
                chart2.Series["Number of Customer According to City"].Points.AddXY(dr2[0], dr2[1]);
            }
            conn.conncet().Close();
        }
    }
}
