﻿namespace Capa_Presentacion
{
    partial class FrmConsulta
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmConsulta));
            this.grpboxConsulta = new System.Windows.Forms.GroupBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtPrecio = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.lblProducto = new System.Windows.Forms.Label();
            this.txtProductoNombre = new System.Windows.Forms.TextBox();
            this.gbDetalleMovimento = new System.Windows.Forms.GroupBox();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.rbCodigo = new System.Windows.Forms.RadioButton();
            this.rbCategoria = new System.Windows.Forms.RadioButton();
            this.rdbCodigoBarra = new System.Windows.Forms.RadioButton();
            this.rdbNombre = new System.Windows.Forms.RadioButton();
            this.dataLista = new System.Windows.Forms.DataGridView();
            this.Codigo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CodigoDeBarra = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Producto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Categoria = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnProducto = new System.Windows.Forms.Button();
            this.lblNomProducto = new System.Windows.Forms.Label();
            this.txtProducto = new System.Windows.Forms.TextBox();
            this.ttMensajeAyuda = new System.Windows.Forms.ToolTip(this.components);
            this.panelHorizontal = new System.Windows.Forms.Panel();
            this.lblSistemaVenta = new System.Windows.Forms.Label();
            this.btnMinimizar = new System.Windows.Forms.PictureBox();
            this.btnCerrar = new System.Windows.Forms.PictureBox();
            this.btnMaximizar = new System.Windows.Forms.PictureBox();
            this.btnRestaurar = new System.Windows.Forms.PictureBox();
            this.grpboxConsulta.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.gbDetalleMovimento.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).BeginInit();
            this.panelHorizontal.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnMinimizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnCerrar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnMaximizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRestaurar)).BeginInit();
            this.SuspendLayout();
            // 
            // grpboxConsulta
            // 
            this.grpboxConsulta.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.grpboxConsulta.Controls.Add(this.groupBox1);
            this.grpboxConsulta.Controls.Add(this.gbDetalleMovimento);
            this.grpboxConsulta.Location = new System.Drawing.Point(19, 64);
            this.grpboxConsulta.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.grpboxConsulta.Name = "grpboxConsulta";
            this.grpboxConsulta.Padding = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.grpboxConsulta.Size = new System.Drawing.Size(980, 642);
            this.grpboxConsulta.TabIndex = 62;
            this.grpboxConsulta.TabStop = false;
            this.grpboxConsulta.Text = "Consulta De Precio";
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.groupBox1.Controls.Add(this.txtPrecio);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.lblProducto);
            this.groupBox1.Controls.Add(this.txtProductoNombre);
            this.groupBox1.Location = new System.Drawing.Point(22, 458);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(940, 151);
            this.groupBox1.TabIndex = 53;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Producto";
            // 
            // txtPrecio
            // 
            this.txtPrecio.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txtPrecio.BackColor = System.Drawing.SystemColors.Window;
            this.txtPrecio.Font = new System.Drawing.Font("Century Gothic", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPrecio.ForeColor = System.Drawing.Color.ForestGreen;
            this.txtPrecio.Location = new System.Drawing.Point(152, 80);
            this.txtPrecio.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.txtPrecio.Name = "txtPrecio";
            this.txtPrecio.ReadOnly = true;
            this.txtPrecio.Size = new System.Drawing.Size(229, 43);
            this.txtPrecio.TabIndex = 31;
            this.txtPrecio.Text = "0,00";
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Century Gothic", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(40, 84);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(75, 25);
            this.label2.TabIndex = 29;
            this.label2.Text = "Precio";
            // 
            // lblProducto
            // 
            this.lblProducto.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.lblProducto.AutoSize = true;
            this.lblProducto.Font = new System.Drawing.Font("Century Gothic", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblProducto.Location = new System.Drawing.Point(38, 31);
            this.lblProducto.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblProducto.Name = "lblProducto";
            this.lblProducto.Size = new System.Drawing.Size(103, 25);
            this.lblProducto.TabIndex = 28;
            this.lblProducto.Text = "Producto";
            // 
            // txtProductoNombre
            // 
            this.txtProductoNombre.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txtProductoNombre.BackColor = System.Drawing.SystemColors.Window;
            this.txtProductoNombre.Font = new System.Drawing.Font("Century Gothic", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtProductoNombre.ForeColor = System.Drawing.Color.LimeGreen;
            this.txtProductoNombre.Location = new System.Drawing.Point(152, 28);
            this.txtProductoNombre.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.txtProductoNombre.Name = "txtProductoNombre";
            this.txtProductoNombre.ReadOnly = true;
            this.txtProductoNombre.Size = new System.Drawing.Size(755, 43);
            this.txtProductoNombre.TabIndex = 27;
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
            this.gbDetalleMovimento.Location = new System.Drawing.Point(22, 31);
            this.gbDetalleMovimento.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.gbDetalleMovimento.Name = "gbDetalleMovimento";
            this.gbDetalleMovimento.Padding = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.gbDetalleMovimento.Size = new System.Drawing.Size(940, 418);
            this.gbDetalleMovimento.TabIndex = 40;
            this.gbDetalleMovimento.TabStop = false;
            this.gbDetalleMovimento.Text = "Detalles ";
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
            this.btnLimpiar.Click += new System.EventHandler(this.btnLimpiar_Click);
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
            this.rbCodigo.CheckedChanged += new System.EventHandler(this.rbCodigo_CheckedChanged);
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
            this.rbCategoria.CheckedChanged += new System.EventHandler(this.rbCategoria_CheckedChanged);
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
            this.rdbCodigoBarra.CheckedChanged += new System.EventHandler(this.rdbCodigoBarra_CheckedChanged);
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
            this.rdbNombre.CheckedChanged += new System.EventHandler(this.rdbNombre_CheckedChanged);
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
            this.Precio,
            this.Categoria});
            this.dataLista.Cursor = System.Windows.Forms.Cursors.Hand;
            this.dataLista.Location = new System.Drawing.Point(17, 112);
            this.dataLista.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.dataLista.Name = "dataLista";
            this.dataLista.ReadOnly = true;
            this.dataLista.RowHeadersWidth = 38;
            this.dataLista.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataLista.Size = new System.Drawing.Size(907, 282);
            this.dataLista.TabIndex = 46;
            this.dataLista.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataLista_CellContentClick);
            this.dataLista.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataLista_CellDoubleClick);
            this.dataLista.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataLista_CellMouseClick);
            this.dataLista.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataLista_KeyDown);
            // 
            // Codigo
            // 
            this.Codigo.FillWeight = 80F;
            this.Codigo.HeaderText = "Codigo";
            this.Codigo.MaxInputLength = 100;
            this.Codigo.MinimumWidth = 50;
            this.Codigo.Name = "Codigo";
            this.Codigo.ReadOnly = true;
            // 
            // CodigoDeBarra
            // 
            this.CodigoDeBarra.HeaderText = "Codigo De Barra";
            this.CodigoDeBarra.MaxInputLength = 100;
            this.CodigoDeBarra.Name = "CodigoDeBarra";
            this.CodigoDeBarra.ReadOnly = true;
            // 
            // Producto
            // 
            this.Producto.FillWeight = 150F;
            this.Producto.HeaderText = "Producto";
            this.Producto.MaxInputLength = 100;
            this.Producto.MinimumWidth = 100;
            this.Producto.Name = "Producto";
            this.Producto.ReadOnly = true;
            // 
            // Precio
            // 
            this.Precio.HeaderText = "Precio";
            this.Precio.MaxInputLength = 100;
            this.Precio.Name = "Precio";
            this.Precio.ReadOnly = true;
            // 
            // Categoria
            // 
            this.Categoria.FillWeight = 80F;
            this.Categoria.HeaderText = "Categoria";
            this.Categoria.MaxInputLength = 100;
            this.Categoria.Name = "Categoria";
            this.Categoria.ReadOnly = true;
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
            // ttMensajeAyuda
            // 
            this.ttMensajeAyuda.AutomaticDelay = 400;
            // 
            // lblSistemaVenta
            // 
            this.lblSistemaVenta.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
            | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblSistemaVenta.AutoSize = true;
            this.lblSistemaVenta.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSistemaVenta.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.lblSistemaVenta.Location = new System.Drawing.Point(3, 6);
            this.lblSistemaVenta.Name = "lblSistemaVenta";
            this.lblSistemaVenta.Size = new System.Drawing.Size(186, 23);
            this.lblSistemaVenta.TabIndex = 3;
            this.lblSistemaVenta.Text = "Consultas";
            this.lblSistemaVenta.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // panelHorizontal
            // 
            this.panelHorizontal.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(0)))), ((int)(((byte)(170)))));
            this.panelHorizontal.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panelHorizontal.Controls.Add(this.btnMaximizar);
            this.panelHorizontal.Controls.Add(this.btnRestaurar);
            this.panelHorizontal.Controls.Add(this.btnMinimizar);
            this.panelHorizontal.Controls.Add(this.btnCerrar);
            this.panelHorizontal.Controls.Add(this.lblSistemaVenta);
            this.panelHorizontal.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelHorizontal.Location = new System.Drawing.Point(0, 0);
            this.panelHorizontal.Name = "panelHorizontal";
            this.panelHorizontal.Size = new System.Drawing.Size(1012, 37);
            this.panelHorizontal.TabIndex = 64;
            this.panelHorizontal.DoubleClick += new System.EventHandler(this.panelHorizontal_DoubleClick);
            this.panelHorizontal.MouseMove += new System.Windows.Forms.MouseEventHandler(this.panelHorizontal_MouseMove);
            // 
            // btnMaximizar
            // 
            this.btnMaximizar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnMaximizar.BackgroundImage = global::Capa_Presentacion.Properties.Resources.maximize_Checkbox_16px;
            this.btnMaximizar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnMaximizar.Location = new System.Drawing.Point(952, 5);
            this.btnMaximizar.Name = "btnMaximizar";
            this.btnMaximizar.Size = new System.Drawing.Size(22, 25);
            this.btnMaximizar.TabIndex = 5;
            this.btnMaximizar.TabStop = false;
            this.btnMaximizar.Click += new System.EventHandler(this.btnMaximizar_Click);
            this.btnMaximizar.MouseLeave += new System.EventHandler(this.btnMaximizar_MouseLeave);
            this.btnMaximizar.MouseMove += new System.Windows.Forms.MouseEventHandler(this.btnMaximizar_MouseMove);
            // 
            // btnRestaurar
            // 
            this.btnRestaurar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRestaurar.BackgroundImage = global::Capa_Presentacion.Properties.Resources.Restore_Window_20px;
            this.btnRestaurar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnRestaurar.Location = new System.Drawing.Point(952, 5);
            this.btnRestaurar.Name = "btnRestaurar";
            this.btnRestaurar.Size = new System.Drawing.Size(22, 25);
            this.btnRestaurar.TabIndex = 2;
            this.btnRestaurar.TabStop = false;
            this.btnRestaurar.Visible = false;
            this.btnRestaurar.Click += new System.EventHandler(this.btnRestaurar_Click);
            this.btnRestaurar.MouseLeave += new System.EventHandler(this.btnRestaurar_MouseLeave);
            this.btnRestaurar.MouseMove += new System.Windows.Forms.MouseEventHandler(this.btnRestaurar_MouseMove);
            // 
            // btnMinimizar
            // 
            this.btnMinimizar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnMinimizar.BackgroundImage = global::Capa_Presentacion.Properties.Resources.Minus_20px;
            this.btnMinimizar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnMinimizar.Location = new System.Drawing.Point(919, 5);
            this.btnMinimizar.Name = "btnMinimizar";
            this.btnMinimizar.Size = new System.Drawing.Size(22, 25);
            this.btnMinimizar.TabIndex = 1;
            this.btnMinimizar.TabStop = false;
            this.btnMinimizar.Click += new System.EventHandler(this.btnMinimizar_Click);
            this.btnMinimizar.MouseLeave += new System.EventHandler(this.btnMinimizar_MouseLeave);
            this.btnMinimizar.MouseMove += new System.Windows.Forms.MouseEventHandler(this.btnMinimizar_MouseMove);
            // 
            // btnCerrar
            // 
            this.btnCerrar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCerrar.BackgroundImage = global::Capa_Presentacion.Properties.Resources.Delete_20px;
            this.btnCerrar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnCerrar.ErrorImage = ((System.Drawing.Image)(resources.GetObject("btnCerrar.ErrorImage")));
            this.btnCerrar.Location = new System.Drawing.Point(985, 5);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(22, 25);
            this.btnCerrar.TabIndex = 0;
            this.btnCerrar.TabStop = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            this.btnCerrar.MouseLeave += new System.EventHandler(this.btnCerrar_MouseLeave);
            this.btnCerrar.MouseMove += new System.Windows.Forms.MouseEventHandler(this.btnCerrar_MouseMove);

            // 
            // FrmConsulta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::Capa_Presentacion.Properties.Resources.fondo1;
            this.ClientSize = new System.Drawing.Size(1012, 733);
            this.Controls.Add(this.panelHorizontal);
            this.Controls.Add(this.grpboxConsulta);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.KeyPreview = true;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "FrmConsulta";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Consulta De Precio";
            this.Load += new System.EventHandler(this.FrmConsulta_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.FrmPrecio_KeyDown);
            this.grpboxConsulta.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.gbDetalleMovimento.ResumeLayout(false);
            this.gbDetalleMovimento.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).EndInit();
            this.panelHorizontal.ResumeLayout(false);
            this.panelHorizontal.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnMinimizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnCerrar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnMaximizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRestaurar)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grpboxConsulta;
        private System.Windows.Forms.GroupBox gbDetalleMovimento;
        private System.Windows.Forms.RadioButton rbCodigo;
        private System.Windows.Forms.RadioButton rbCategoria;
        private System.Windows.Forms.RadioButton rdbCodigoBarra;
        private System.Windows.Forms.RadioButton rdbNombre;
        private System.Windows.Forms.DataGridView dataLista;
        private System.Windows.Forms.Button btnProducto;
        private System.Windows.Forms.Label lblNomProducto;
        private System.Windows.Forms.TextBox txtProducto;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.ToolTip ttMensajeAyuda;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtPrecio;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblProducto;
        private System.Windows.Forms.TextBox txtProductoNombre;
        private System.Windows.Forms.DataGridViewTextBoxColumn Codigo;
        private System.Windows.Forms.DataGridViewTextBoxColumn CodigoDeBarra;
        private System.Windows.Forms.DataGridViewTextBoxColumn Producto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Precio;
        private System.Windows.Forms.DataGridViewTextBoxColumn Categoria;
        private System.Windows.Forms.Panel panelHorizontal;
        private System.Windows.Forms.Label lblSistemaVenta;
        private System.Windows.Forms.PictureBox btnMinimizar;
        private System.Windows.Forms.PictureBox btnCerrar;
        private System.Windows.Forms.PictureBox btnMaximizar;
        private System.Windows.Forms.PictureBox btnRestaurar;
    }
}