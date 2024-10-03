using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proje_SQL_DB
{
    internal class SQLConnection
    {
        public SqlConnection conncet()
        {
            SqlConnection conn = new SqlConnection(@"Data Source=PREDATOR;Initial Catalog=SatisVT;Integrated Security=True;TrustServerCertificate=True");
            conn.Open();
            return conn;
        }
    }
}
