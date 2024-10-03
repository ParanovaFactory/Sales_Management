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
    public partial class FrmCashRegister : Form
    {
        
        SQLConnection conn = new SQLConnection();

        public FrmCashRegister()
        {
            InitializeComponent();
        }

        private void BtnCashRegister_Click(object sender, EventArgs e)
        {
            SqlCommand sql = new SqlCommand("select Toplam from tblkasa", conn.conncet());
            SqlDataAdapter da = new SqlDataAdapter(sql);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            conn.conncet().Close();
        }
    }
}
