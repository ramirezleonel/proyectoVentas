namespace Capa_Presentacion
{
    partial class FrmBusquedaAvaArticulo
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataLista = new System.Windows.Forms.DataGridView();
            this.txtBuscar = new System.Windows.Forms.TextBox();
            this.rdbCategoria = new System.Windows.Forms.RadioButton();
            this.rdbCodigoBarra = new System.Windows.Forms.RadioButton();
            this.rdbNombre = new System.Windows.Forms.RadioButton();
            this.lblTotal = new System.Windows.Forms.Label();
            this.btnProducto = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).BeginInit();
            this.SuspendLayout();
            // 
            // dataLista
            // 
            this.dataLista.AllowUserToAddRows = false;
            this.dataLista.AllowUserToDeleteRows = false;
            this.dataLista.AllowUserToOrderColumns = true;
            this.dataLista.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataLista.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataLista.Location = new System.Drawing.Point(15, 142);
            this.dataLista.Margin = new System.Windows.Forms.Padding(6, 5, 6, 5);
            this.dataLista.Name = "dataLista";
            this.dataLista.ReadOnly = true;
            this.dataLista.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataLista.Size = new System.Drawing.Size(844, 239);
            this.dataLista.TabIndex = 0;
            this.dataLista.DoubleClick += new System.EventHandler(this.dataLista_DoubleClick);
            this.dataLista.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataLista_KeyDown);
            // 
            // txtBuscar
            // 
            this.txtBuscar.Location = new System.Drawing.Point(15, 66);
            this.txtBuscar.Margin = new System.Windows.Forms.Padding(6, 5, 6, 5);
            this.txtBuscar.Name = "txtBuscar";
            this.txtBuscar.Size = new System.Drawing.Size(759, 31);
            this.txtBuscar.TabIndex = 24;
            // 
            // rdbCategoria
            // 
            this.rdbCategoria.AutoSize = true;
            this.rdbCategoria.Location = new System.Drawing.Point(321, 30);
            this.rdbCategoria.Margin = new System.Windows.Forms.Padding(6, 5, 6, 5);
            this.rdbCategoria.Name = "rdbCategoria";
            this.rdbCategoria.Size = new System.Drawing.Size(122, 26);
            this.rdbCategoria.TabIndex = 23;
            this.rdbCategoria.Text = "Categoría";
            this.rdbCategoria.UseVisualStyleBackColor = true;
            // 
            // rdbCodigoBarra
            // 
            this.rdbCodigoBarra.AutoSize = true;
            this.rdbCodigoBarra.Checked = true;
            this.rdbCodigoBarra.Location = new System.Drawing.Point(129, 30);
            this.rdbCodigoBarra.Margin = new System.Windows.Forms.Padding(6, 5, 6, 5);
            this.rdbCodigoBarra.Name = "rdbCodigoBarra";
            this.rdbCodigoBarra.Size = new System.Drawing.Size(180, 26);
            this.rdbCodigoBarra.TabIndex = 22;
            this.rdbCodigoBarra.TabStop = true;
            this.rdbCodigoBarra.Text = "Codigo de Barra";
            this.rdbCodigoBarra.UseVisualStyleBackColor = true;
            // 
            // rdbNombre
            // 
            this.rdbNombre.AutoSize = true;
            this.rdbNombre.Location = new System.Drawing.Point(15, 30);
            this.rdbNombre.Margin = new System.Windows.Forms.Padding(6, 5, 6, 5);
            this.rdbNombre.Name = "rdbNombre";
            this.rdbNombre.Size = new System.Drawing.Size(102, 26);
            this.rdbNombre.TabIndex = 21;
            this.rdbNombre.Text = "Nombre";
            this.rdbNombre.UseVisualStyleBackColor = true;
            // 
            // lblTotal
            // 
            this.lblTotal.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTotal.AutoSize = true;
            this.lblTotal.Location = new System.Drawing.Point(605, 107);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(21, 22);
            this.lblTotal.TabIndex = 25;
            this.lblTotal.Text = "0";
            // 
            // btnProducto
            // 
            this.btnProducto.Image = global::Capa_Presentacion.Properties.Resources.Search_15px;
            this.btnProducto.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnProducto.Location = new System.Drawing.Point(784, 66);
            this.btnProducto.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnProducto.Name = "btnProducto";
            this.btnProducto.Size = new System.Drawing.Size(26, 28);
            this.btnProducto.TabIndex = 26;
            this.btnProducto.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnProducto.UseVisualStyleBackColor = true;
            // 
            // FrmBusquedaAvaArticulo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(11F, 22F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(874, 395);
            this.Controls.Add(this.btnProducto);
            this.Controls.Add(this.lblTotal);
            this.Controls.Add(this.txtBuscar);
            this.Controls.Add(this.rdbCategoria);
            this.Controls.Add(this.rdbCodigoBarra);
            this.Controls.Add(this.rdbNombre);
            this.Controls.Add(this.dataLista);
            this.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.KeyPreview = true;
            this.Margin = new System.Windows.Forms.Padding(6, 5, 6, 5);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmBusquedaAvaArticulo";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Busqueda Avanzada";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmBusquedaAvaArticulo_FormClosing);
            this.Load += new System.EventHandler(this.FrmBusquedaAvaArticulo_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.FrmBusquedaAvaArticulo_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataLista;
        private System.Windows.Forms.TextBox txtBuscar;
        private System.Windows.Forms.RadioButton rdbCategoria;
        private System.Windows.Forms.RadioButton rdbCodigoBarra;
        private System.Windows.Forms.RadioButton rdbNombre;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.Button btnProducto;
    }
}