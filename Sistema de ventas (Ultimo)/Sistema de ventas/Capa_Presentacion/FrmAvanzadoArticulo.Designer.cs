namespace Capa_Presentacion
{
    partial class FrmAvanzadoArticulo
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
            this.gbDetalleMovimento = new System.Windows.Forms.GroupBox();
            this.rbCodigo = new System.Windows.Forms.RadioButton();
            this.rbCategoria = new System.Windows.Forms.RadioButton();
            this.rdbCodigoBarra = new System.Windows.Forms.RadioButton();
            this.rdbNombre = new System.Windows.Forms.RadioButton();
            this.dataLista = new System.Windows.Forms.DataGridView();
            this.Codigo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CodigoDeBarra = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Producto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PrecioProducto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Categoria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Stock_actual = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblNomProducto = new System.Windows.Forms.Label();
            this.txtProducto = new System.Windows.Forms.TextBox();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.btnProducto = new System.Windows.Forms.Button();
            this.gbDetalleMovimento.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).BeginInit();
            this.SuspendLayout();
            // 
            // gbDetalleMovimento
            // 
            this.gbDetalleMovimento.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gbDetalleMovimento.Controls.Add(this.btnLimpiar);
            this.gbDetalleMovimento.Controls.Add(this.rbCodigo);
            this.gbDetalleMovimento.Controls.Add(this.rbCategoria);
            this.gbDetalleMovimento.Controls.Add(this.rdbCodigoBarra);
            this.gbDetalleMovimento.Controls.Add(this.rdbNombre);
            this.gbDetalleMovimento.Controls.Add(this.dataLista);
            this.gbDetalleMovimento.Controls.Add(this.btnProducto);
            this.gbDetalleMovimento.Controls.Add(this.lblNomProducto);
            this.gbDetalleMovimento.Controls.Add(this.txtProducto);
            this.gbDetalleMovimento.Location = new System.Drawing.Point(31, 33);
            this.gbDetalleMovimento.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.gbDetalleMovimento.Name = "gbDetalleMovimento";
            this.gbDetalleMovimento.Padding = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.gbDetalleMovimento.Size = new System.Drawing.Size(955, 669);
            this.gbDetalleMovimento.TabIndex = 54;
            this.gbDetalleMovimento.TabStop = false;
            this.gbDetalleMovimento.Text = "Detalles ";
            // 
            // rbCodigo
            // 
            this.rbCodigo.AutoSize = true;
            this.rbCodigo.Location = new System.Drawing.Point(314, 31);
            this.rbCodigo.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.rbCodigo.Name = "rbCodigo";
            this.rbCodigo.Size = new System.Drawing.Size(77, 24);
            this.rbCodigo.TabIndex = 50;
            this.rbCodigo.Text = "Codigo";
            this.rbCodigo.UseVisualStyleBackColor = true;
            // 
            // rbCategoria
            // 
            this.rbCategoria.AutoSize = true;
            this.rbCategoria.Location = new System.Drawing.Point(410, 31);
            this.rbCategoria.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.rbCategoria.Name = "rbCategoria";
            this.rbCategoria.Size = new System.Drawing.Size(96, 24);
            this.rbCategoria.TabIndex = 49;
            this.rbCategoria.Text = "Categoría";
            this.rbCategoria.UseVisualStyleBackColor = true;
            // 
            // rdbCodigoBarra
            // 
            this.rdbCodigoBarra.AutoSize = true;
            this.rdbCodigoBarra.Location = new System.Drawing.Point(152, 31);
            this.rdbCodigoBarra.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.rdbCodigoBarra.Name = "rdbCodigoBarra";
            this.rdbCodigoBarra.Size = new System.Drawing.Size(142, 24);
            this.rdbCodigoBarra.TabIndex = 48;
            this.rdbCodigoBarra.Text = "Codigo de Barra";
            this.rdbCodigoBarra.UseVisualStyleBackColor = true;
            // 
            // rdbNombre
            // 
            this.rdbNombre.AutoSize = true;
            this.rdbNombre.Checked = true;
            this.rdbNombre.Location = new System.Drawing.Point(51, 31);
            this.rdbNombre.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.rdbNombre.Name = "rdbNombre";
            this.rdbNombre.Size = new System.Drawing.Size(83, 24);
            this.rdbNombre.TabIndex = 47;
            this.rdbNombre.TabStop = true;
            this.rdbNombre.Text = "Nombre";
            this.rdbNombre.UseVisualStyleBackColor = true;
            // 
            // dataLista
            // 
            this.dataLista.AllowUserToAddRows = false;
            this.dataLista.AllowUserToDeleteRows = false;
            this.dataLista.AllowUserToOrderColumns = true;
            this.dataLista.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataLista.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataLista.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataLista.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Codigo,
            this.CodigoDeBarra,
            this.Producto,
            this.PrecioProducto,
            this.Categoria,
            this.Stock_actual});
            this.dataLista.Cursor = System.Windows.Forms.Cursors.Hand;
            this.dataLista.Location = new System.Drawing.Point(25, 126);
            this.dataLista.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.dataLista.Name = "dataLista";
            this.dataLista.ReadOnly = true;
            this.dataLista.RowHeadersWidth = 38;
            this.dataLista.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataLista.Size = new System.Drawing.Size(906, 519);
            this.dataLista.TabIndex = 46;
            this.dataLista.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataLista_CellDoubleClick);
            this.dataLista.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataLista_KeyDown);
            // 
            // Codigo
            // 
            this.Codigo.FillWeight = 80.14333F;
            this.Codigo.HeaderText = "Codigo";
            this.Codigo.MaxInputLength = 100;
            this.Codigo.MinimumWidth = 50;
            this.Codigo.Name = "Codigo";
            this.Codigo.ReadOnly = true;
            // 
            // CodigoDeBarra
            // 
            this.CodigoDeBarra.FillWeight = 100.1792F;
            this.CodigoDeBarra.HeaderText = "Codigo De Barra";
            this.CodigoDeBarra.MaxInputLength = 100;
            this.CodigoDeBarra.Name = "CodigoDeBarra";
            this.CodigoDeBarra.ReadOnly = true;
            // 
            // Producto
            // 
            this.Producto.FillWeight = 150.2687F;
            this.Producto.HeaderText = "Producto";
            this.Producto.MaxInputLength = 100;
            this.Producto.MinimumWidth = 100;
            this.Producto.Name = "Producto";
            this.Producto.ReadOnly = true;
            // 
            // PrecioProducto
            // 
            this.PrecioProducto.FillWeight = 100.1792F;
            this.PrecioProducto.HeaderText = "Precio";
            this.PrecioProducto.MaxInputLength = 100;
            this.PrecioProducto.Name = "PrecioProducto";
            this.PrecioProducto.ReadOnly = true;
            // 
            // Categoria
            // 
            this.Categoria.FillWeight = 80.14333F;
            this.Categoria.HeaderText = "Categoria";
            this.Categoria.MaxInputLength = 100;
            this.Categoria.Name = "Categoria";
            this.Categoria.ReadOnly = true;
            // 
            // Stock_actual
            // 
            this.Stock_actual.FillWeight = 99.0863F;
            this.Stock_actual.HeaderText = "Stock_actual";
            this.Stock_actual.Name = "Stock_actual";
            this.Stock_actual.ReadOnly = true;
            // 
            // lblNomProducto
            // 
            this.lblNomProducto.AutoSize = true;
            this.lblNomProducto.Location = new System.Drawing.Point(46, 76);
            this.lblNomProducto.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblNomProducto.Name = "lblNomProducto";
            this.lblNomProducto.Size = new System.Drawing.Size(73, 20);
            this.lblNomProducto.TabIndex = 26;
            this.lblNomProducto.Text = "Producto";
            // 
            // txtProducto
            // 
            this.txtProducto.Location = new System.Drawing.Point(125, 73);
            this.txtProducto.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.txtProducto.Name = "txtProducto";
            this.txtProducto.Size = new System.Drawing.Size(412, 26);
            this.txtProducto.TabIndex = 1;
            this.txtProducto.TextChanged += new System.EventHandler(this.txtProducto_TextChanged);
            this.txtProducto.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtProducto_KeyDown);
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.Image = global::Capa_Presentacion.Properties.Resources.Broom_15px;
            this.btnLimpiar.Location = new System.Drawing.Point(593, 72);
            this.btnLimpiar.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(28, 28);
            this.btnLimpiar.TabIndex = 52;
            this.btnLimpiar.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnLimpiar.UseVisualStyleBackColor = true;
            // 
            // btnProducto
            // 
            this.btnProducto.Image = global::Capa_Presentacion.Properties.Resources.Search_15px;
            this.btnProducto.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnProducto.Location = new System.Drawing.Point(558, 72);
            this.btnProducto.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnProducto.Name = "btnProducto";
            this.btnProducto.Size = new System.Drawing.Size(26, 28);
            this.btnProducto.TabIndex = 10;
            this.btnProducto.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnProducto.UseVisualStyleBackColor = true;
            this.btnProducto.Click += new System.EventHandler(this.btnProducto_Click);
            // 
            // FrmAvanzadoArticulo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1012, 733);
            this.Controls.Add(this.gbDetalleMovimento);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "FrmAvanzadoArticulo";
            this.Text = "FrmAvanzadoArticulo";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmAvanzadoArticulo_FormClosing);
            this.Load += new System.EventHandler(this.FrmAvanzadoArticulo_Load);
            this.gbDetalleMovimento.ResumeLayout(false);
            this.gbDetalleMovimento.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbDetalleMovimento;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.RadioButton rbCodigo;
        private System.Windows.Forms.RadioButton rbCategoria;
        private System.Windows.Forms.RadioButton rdbCodigoBarra;
        private System.Windows.Forms.RadioButton rdbNombre;
        private System.Windows.Forms.DataGridView dataLista;
        private System.Windows.Forms.Button btnProducto;
        private System.Windows.Forms.Label lblNomProducto;
        private System.Windows.Forms.TextBox txtProducto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Codigo;
        private System.Windows.Forms.DataGridViewTextBoxColumn CodigoDeBarra;
        private System.Windows.Forms.DataGridViewTextBoxColumn Producto;
        private System.Windows.Forms.DataGridViewTextBoxColumn PrecioProducto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Categoria;
        private System.Windows.Forms.DataGridViewTextBoxColumn Stock_actual;
    }
}