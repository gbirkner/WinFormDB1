using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;

namespace WinFormDB1 {
    public partial class FrmMain : Form {

        string conn = Properties.Settings.Default.dbConnection;
        public FrmMain() {
            InitializeComponent();
        }
    }
}
