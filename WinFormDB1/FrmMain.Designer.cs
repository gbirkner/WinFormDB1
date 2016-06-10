namespace WinFormDB1 {
    partial class FrmMain {
        /// <summary>
        /// Erforderliche Designervariable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Verwendete Ressourcen bereinigen.
        /// </summary>
        /// <param name="disposing">True, wenn verwaltete Ressourcen gelöscht werden sollen; andernfalls False.</param>
        protected override void Dispose( bool disposing ) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose( disposing );
        }

        #region Vom Windows Form-Designer generierter Code

        /// <summary>
        /// Erforderliche Methode für die Designerunterstützung.
        /// Der Inhalt der Methode darf nicht mit dem Code-Editor geändert werden.
        /// </summary>
        private void InitializeComponent() {
            this.components = new System.ComponentModel.Container();
            this.dgvMain = new System.Windows.Forms.DataGridView();
            this.dgvMain2 = new System.Windows.Forms.DataGridView();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.schoolDBDataSet = new WinFormDB1.schoolDBDataSet();
            this.schoolDBDataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.addressTypesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.addressTypesTableAdapter = new WinFormDB1.schoolDBDataSetTableAdapters.AddressTypesTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMain)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMain2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.schoolDBDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.schoolDBDataSetBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.addressTypesBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvMain
            // 
            this.dgvMain.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvMain.Location = new System.Drawing.Point(12, 80);
            this.dgvMain.Name = "dgvMain";
            this.dgvMain.Size = new System.Drawing.Size(638, 258);
            this.dgvMain.TabIndex = 0;
            // 
            // dgvMain2
            // 
            this.dgvMain2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvMain2.Location = new System.Drawing.Point(13, 363);
            this.dgvMain2.Name = "dgvMain2";
            this.dgvMain2.Size = new System.Drawing.Size(637, 227);
            this.dgvMain2.TabIndex = 1;
            // 
            // listBox1
            // 
            this.listBox1.DataSource = this.addressTypesBindingSource;
            this.listBox1.DisplayMember = "Title";
            this.listBox1.FormattingEnabled = true;
            this.listBox1.Location = new System.Drawing.Point(861, 80);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(120, 238);
            this.listBox1.TabIndex = 2;
            this.listBox1.ValueMember = "AddressTypeID";
            // 
            // schoolDBDataSet
            // 
            this.schoolDBDataSet.DataSetName = "schoolDBDataSet";
            this.schoolDBDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // schoolDBDataSetBindingSource
            // 
            this.schoolDBDataSetBindingSource.DataSource = this.schoolDBDataSet;
            this.schoolDBDataSetBindingSource.Position = 0;
            // 
            // addressTypesBindingSource
            // 
            this.addressTypesBindingSource.DataMember = "AddressTypes";
            this.addressTypesBindingSource.DataSource = this.schoolDBDataSetBindingSource;
            this.addressTypesBindingSource.CurrentChanged += new System.EventHandler(this.addressTypesBindingSource_CurrentChanged);
            // 
            // addressTypesTableAdapter
            // 
            this.addressTypesTableAdapter.ClearBeforeFill = true;
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1047, 658);
            this.Controls.Add(this.listBox1);
            this.Controls.Add(this.dgvMain2);
            this.Controls.Add(this.dgvMain);
            this.Name = "FrmMain";
            this.Text = "SchoolDB";
            this.Load += new System.EventHandler(this.FrmMain_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvMain)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMain2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.schoolDBDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.schoolDBDataSetBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.addressTypesBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvMain;
        private System.Windows.Forms.DataGridView dgvMain2;
        private System.Windows.Forms.ListBox listBox1;
        private System.Windows.Forms.BindingSource schoolDBDataSetBindingSource;
        private schoolDBDataSet schoolDBDataSet;
        private System.Windows.Forms.BindingSource addressTypesBindingSource;
        private schoolDBDataSetTableAdapters.AddressTypesTableAdapter addressTypesTableAdapter;
    }
}

