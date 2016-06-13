using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;

namespace WinFormDB1 {
    public partial class FrmMain : Form {

        string connStr = Properties.Settings.Default.dbConnection2;
        public FrmMain() {
            InitializeComponent();

            using (SqlConnection con = new SqlConnection( connStr )) {
                 con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Invoices", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill( dt);

                dgvMain.DataSource = dt;
                
                con.Close();

            }

            schoolDBEntities db = new schoolDBEntities();
            var sql = from i in db.Invoices
                      select new {
                          i.InvoiceID,
                          i.InvDate,
                          i.Customer.LName,
                      };
            
            dgvMain2.DataSource = sql.ToList();

            


        }

        private void FrmMain_Load( object sender, EventArgs e ) {
            // TODO: Diese Codezeile lädt Daten in die Tabelle "schoolDBDataSet.AddressTypes". Sie können sie bei Bedarf verschieben oder entfernen.
            this.addressTypesTableAdapter.Fill( this.schoolDBDataSet.AddressTypes );


        }

        private void addressTypesBindingSource_CurrentChanged( object sender, EventArgs e ) {

        }
    }
}
