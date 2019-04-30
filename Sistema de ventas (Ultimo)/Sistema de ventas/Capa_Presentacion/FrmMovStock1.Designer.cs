namespace Capa_Presentacion
{
    partial class FrmMovStock1
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
            this.btnImprimir = new System.Windows.Forms.Button();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.lblTotal = new System.Windows.Forms.Label();
            this.txtIdArticulo = new System.Windows.Forms.TextBox();
            this.btnAnular = new System.Windows.Forms.Button();
            this.dataLista = new System.Windows.Forms.DataGridView();
            this.tabLista = new System.Windows.Forms.TabPage();
            this.btnTodos = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.dtpFechaFin = new System.Windows.Forms.DateTimePicker();
            this.dtpFechaIni = new System.Windows.Forms.DateTimePicker();
            this.lblFechaIni = new System.Windows.Forms.Label();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabGenerar = new System.Windows.Forms.TabPage();
            this.grpboxProveedor = new System.Windows.Forms.GroupBox();
            this.btnBuscarProv = new System.Windows.Forms.Button();
            this.lblTotalPagar = new System.Windows.Forms.Label();
            this.dataListaMov = new System.Windows.Forms.DataGridView();
            this.Codigo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Producto = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Precio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PrecioVenta = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Cantidad = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.StockActual = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gbRegistrarComprobante = new System.Windows.Forms.GroupBox();
            this.cbIVA = new System.Windows.Forms.ComboBox();
            this.cbTipoComprobante = new System.Windows.Forms.ComboBox();
            this.lblTComprobante = new System.Windows.Forms.Label();
            this.lblCorrelativa = new System.Windows.Forms.Label();
            this.lblSerie = new System.Windows.Forms.Label();
            this.txtCorrelativa = new System.Windows.Forms.TextBox();
            this.txtSerie = new System.Windows.Forms.TextBox();
            this.lblNComprobante = new System.Windows.Forms.Label();
            this.cbRegistrar = new System.Windows.Forms.CheckBox();
            this.lblIVA = new System.Windows.Forms.Label();
            this.gbDetalleMovimento = new System.Windows.Forms.GroupBox();
            this.btnBuscarProd = new System.Windows.Forms.Button();
            this.btnQuitar = new System.Windows.Forms.Button();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.btnCambiarPrecio = new System.Windows.Forms.Button();
            this.txtStockActual = new System.Windows.Forms.TextBox();
            this.lblStockActual = new System.Windows.Forms.Label();
            this.txtIngOegr = new System.Windows.Forms.TextBox();
            this.lblCntIngOegr = new System.Windows.Forms.Label();
            this.txtPrecioVenta = new System.Windows.Forms.TextBox();
            this.lblPrecioVenta = new System.Windows.Forms.Label();
            this.txtPrecioCompra = new System.Windows.Forms.TextBox();
            this.lblPrecioCompra = new System.Windows.Forms.Label();
            this.lblCodigo = new System.Windows.Forms.Label();
            this.lblNomProducto = new System.Windows.Forms.Label();
            this.txtNombreProducto = new System.Windows.Forms.TextBox();
            this.txtNombreProveedor = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtIdProveedor = new System.Windows.Forms.TextBox();
            this.lblIdProveedor = new System.Windows.Forms.Label();
            this.dtpFechaGenerar = new System.Windows.Forms.DateTimePicker();
            this.btnEgreso = new System.Windows.Forms.Button();
            this.btnIngreso = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.errorIcono = new System.Windows.Forms.ErrorProvider(this.components);
            this.ttMensajeAyuda = new System.Windows.Forms.ToolTip(this.components);
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.panelHorizontal = new System.Windows.Forms.Panel();
            this.btnMaximizar = new System.Windows.Forms.PictureBox();
            this.btnRestaurar = new System.Windows.Forms.PictureBox();
            this.btnMinimizar = new System.Windows.Forms.PictureBox();
            this.btnCerrar = new System.Windows.Forms.PictureBox();
            this.lblSistemaVenta = new System.Windows.Forms.Label();
            this.bindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).BeginInit();
            this.tabLista.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabGenerar.SuspendLayout();
            this.grpboxProveedor.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataListaMov)).BeginInit();
            this.gbRegistrarComprobante.SuspendLayout();
            this.gbDetalleMovimento.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorIcono)).BeginInit();
            this.panelHorizontal.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnMaximizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRestaurar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnMinimizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnCerrar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // btnImprimir
            // 
            this.btnImprimir.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnImprimir.Location = new System.Drawing.Point(754, 37);
            this.btnImprimir.Name = "btnImprimir";
            this.btnImprimir.Size = new System.Drawing.Size(105, 40);
            this.btnImprimir.TabIndex = 5;
            this.btnImprimir.Text = "Imprimir";
            this.btnImprimir.UseVisualStyleBackColor = true;
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // lblTotal
            // 
            this.lblTotal.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTotal.AutoSize = true;
            this.lblTotal.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotal.Location = new System.Drawing.Point(750, 88);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(21, 22);
            this.lblTotal.TabIndex = 10;
            this.lblTotal.Text = "0";
            // 
            // txtIdArticulo
            // 
            this.txtIdArticulo.Enabled = false;
            this.txtIdArticulo.Location = new System.Drawing.Point(150, 30);
            this.txtIdArticulo.Name = "txtIdArticulo";
            this.txtIdArticulo.ReadOnly = true;
            this.txtIdArticulo.Size = new System.Drawing.Size(198, 27);
            this.txtIdArticulo.TabIndex = 13;
            // 
            // btnAnular
            // 
            this.btnAnular.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAnular.Location = new System.Drawing.Point(632, 37);
            this.btnAnular.Name = "btnAnular";
            this.btnAnular.Size = new System.Drawing.Size(105, 40);
            this.btnAnular.TabIndex = 4;
            this.btnAnular.Text = "Anular";
            this.btnAnular.UseVisualStyleBackColor = true;
            this.btnAnular.Click += new System.EventHandler(this.btnAnular_Click);
            // 
            // dataLista
            // 
            this.dataLista.AllowUserToAddRows = false;
            this.dataLista.AllowUserToDeleteRows = false;
            this.dataLista.AllowUserToOrderColumns = true;
            this.dataLista.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataLista.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dataLista.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataLista.Location = new System.Drawing.Point(19, 128);
            this.dataLista.MultiSelect = false;
            this.dataLista.Name = "dataLista";
            this.dataLista.ReadOnly = true;
            this.dataLista.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataLista.Size = new System.Drawing.Size(965, 520);
            this.dataLista.TabIndex = 6;
            this.dataLista.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataLista_CellContentClick);
            this.dataLista.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataLista_CellDoubleClick);
            this.dataLista.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataLista_KeyDown);
            // 
            // tabLista
            // 
            this.tabLista.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.tabLista.Controls.Add(this.btnTodos);
            this.tabLista.Controls.Add(this.label1);
            this.tabLista.Controls.Add(this.dtpFechaFin);
            this.tabLista.Controls.Add(this.dtpFechaIni);
            this.tabLista.Controls.Add(this.dataLista);
            this.tabLista.Controls.Add(this.lblTotal);
            this.tabLista.Controls.Add(this.lblFechaIni);
            this.tabLista.Controls.Add(this.btnImprimir);
            this.tabLista.Controls.Add(this.btnAnular);
            this.tabLista.Controls.Add(this.btnBuscar);
            this.tabLista.Location = new System.Drawing.Point(4, 29);
            this.tabLista.Name = "tabLista";
            this.tabLista.Padding = new System.Windows.Forms.Padding(3);
            this.tabLista.Size = new System.Drawing.Size(1009, 682);
            this.tabLista.TabIndex = 0;
            this.tabLista.Text = "Lista";
            this.tabLista.UseVisualStyleBackColor = true;
            // 
            // btnTodos
            // 
            this.btnTodos.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTodos.Location = new System.Drawing.Point(510, 37);
            this.btnTodos.Name = "btnTodos";
            this.btnTodos.Size = new System.Drawing.Size(105, 40);
            this.btnTodos.TabIndex = 15;
            this.btnTodos.Text = "Todos";
            this.btnTodos.UseVisualStyleBackColor = true;
            this.btnTodos.Click += new System.EventHandler(this.btnTodos_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(206, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(97, 22);
            this.label1.TabIndex = 14;
            this.label1.Text = "Fecha Fin";
            // 
            // dtpFechaFin
            // 
            this.dtpFechaFin.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaFin.Location = new System.Drawing.Point(210, 40);
            this.dtpFechaFin.Name = "dtpFechaFin";
            this.dtpFechaFin.Size = new System.Drawing.Size(157, 27);
            this.dtpFechaFin.TabIndex = 2;
            // 
            // dtpFechaIni
            // 
            this.dtpFechaIni.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaIni.Location = new System.Drawing.Point(19, 40);
            this.dtpFechaIni.Name = "dtpFechaIni";
            this.dtpFechaIni.Size = new System.Drawing.Size(157, 27);
            this.dtpFechaIni.TabIndex = 1;
            // 
            // lblFechaIni
            // 
            this.lblFechaIni.AutoSize = true;
            this.lblFechaIni.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFechaIni.Location = new System.Drawing.Point(21, 9);
            this.lblFechaIni.Name = "lblFechaIni";
            this.lblFechaIni.Size = new System.Drawing.Size(120, 22);
            this.lblFechaIni.TabIndex = 7;
            this.lblFechaIni.Text = "Fecha Inicio";
            // 
            // btnBuscar
            // 
            this.btnBuscar.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBuscar.Location = new System.Drawing.Point(388, 37);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(105, 40);
            this.btnBuscar.TabIndex = 3;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // tabControl1
            // 
            this.tabControl1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tabControl1.Controls.Add(this.tabLista);
            this.tabControl1.Controls.Add(this.tabGenerar);
            this.tabControl1.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControl1.ItemSize = new System.Drawing.Size(45, 25);
            this.tabControl1.Location = new System.Drawing.Point(7, 47);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1017, 715);
            this.tabControl1.TabIndex = 1;
            this.tabControl1.Selected += new System.Windows.Forms.TabControlEventHandler(this.tabControl1_Selected);
            this.tabControl1.KeyDown += new System.Windows.Forms.KeyEventHandler(this.tabControl1_KeyDown);
            // 
            // tabGenerar
            // 
            this.tabGenerar.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.tabGenerar.Controls.Add(this.grpboxProveedor);
            this.tabGenerar.Location = new System.Drawing.Point(4, 29);
            this.tabGenerar.Name = "tabGenerar";
            this.tabGenerar.Padding = new System.Windows.Forms.Padding(3);
            this.tabGenerar.Size = new System.Drawing.Size(1009, 682);
            this.tabGenerar.TabIndex = 1;
            this.tabGenerar.Text = "Generar";
            this.tabGenerar.UseVisualStyleBackColor = true;
            // 
            // grpboxProveedor
            // 
            this.grpboxProveedor.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.grpboxProveedor.Controls.Add(this.btnBuscarProv);
            this.grpboxProveedor.Controls.Add(this.lblTotalPagar);
            this.grpboxProveedor.Controls.Add(this.dataListaMov);
            this.grpboxProveedor.Controls.Add(this.gbRegistrarComprobante);
            this.grpboxProveedor.Controls.Add(this.gbDetalleMovimento);
            this.grpboxProveedor.Controls.Add(this.txtNombreProveedor);
            this.grpboxProveedor.Controls.Add(this.label3);
            this.grpboxProveedor.Controls.Add(this.txtIdProveedor);
            this.grpboxProveedor.Controls.Add(this.lblIdProveedor);
            this.grpboxProveedor.Controls.Add(this.dtpFechaGenerar);
            this.grpboxProveedor.Controls.Add(this.btnEgreso);
            this.grpboxProveedor.Controls.Add(this.btnIngreso);
            this.grpboxProveedor.Controls.Add(this.btnCancelar);
            this.grpboxProveedor.Controls.Add(this.btnGuardar);
            this.grpboxProveedor.Location = new System.Drawing.Point(9, 6);
            this.grpboxProveedor.Name = "grpboxProveedor";
            this.grpboxProveedor.Size = new System.Drawing.Size(990, 666);
            this.grpboxProveedor.TabIndex = 0;
            this.grpboxProveedor.TabStop = false;
            this.grpboxProveedor.Text = "Mov Stock";
            // 
            // btnBuscarProv
            // 
            this.btnBuscarProv.Enabled = false;
            this.btnBuscarProv.Image = global::Capa_Presentacion.Properties.Resources.Search_15px;
            this.btnBuscarProv.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscarProv.Location = new System.Drawing.Point(809, 23);
            this.btnBuscarProv.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnBuscarProv.Name = "btnBuscarProv";
            this.btnBuscarProv.Size = new System.Drawing.Size(26, 28);
            this.btnBuscarProv.TabIndex = 37;
            this.btnBuscarProv.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnBuscarProv.UseVisualStyleBackColor = true;
            this.btnBuscarProv.Click += new System.EventHandler(this.btnBuscarProv_Click);
            // 
            // lblTotalPagar
            // 
            this.lblTotalPagar.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTotalPagar.AutoSize = true;
            this.lblTotalPagar.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotalPagar.Location = new System.Drawing.Point(655, 634);
            this.lblTotalPagar.Name = "lblTotalPagar";
            this.lblTotalPagar.Size = new System.Drawing.Size(180, 23);
            this.lblTotalPagar.TabIndex = 36;
            this.lblTotalPagar.Text = "TOTAL A PAGAR $ :";
            // 
            // dataListaMov
            // 
            this.dataListaMov.AllowUserToAddRows = false;
            this.dataListaMov.AllowUserToDeleteRows = false;
            this.dataListaMov.AllowUserToOrderColumns = true;
            this.dataListaMov.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataListaMov.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataListaMov.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataListaMov.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Codigo,
            this.Producto,
            this.Precio,
            this.PrecioVenta,
            this.Cantidad,
            this.StockActual});
            this.dataListaMov.Location = new System.Drawing.Point(6, 351);
            this.dataListaMov.MultiSelect = false;
            this.dataListaMov.Name = "dataListaMov";
            this.dataListaMov.ReadOnly = true;
            this.dataListaMov.RowHeadersWidth = 38;
            this.dataListaMov.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataListaMov.Size = new System.Drawing.Size(974, 248);
            this.dataListaMov.TabIndex = 16;
            this.dataListaMov.RowsAdded += new System.Windows.Forms.DataGridViewRowsAddedEventHandler(this.dataListaMov_RowsAdded);
            this.dataListaMov.RowsRemoved += new System.Windows.Forms.DataGridViewRowsRemovedEventHandler(this.dataListaMov_RowsRemoved);
            this.dataListaMov.SelectionChanged += new System.EventHandler(this.dataListaMov_SelectionChanged);
            // 
            // Codigo
            // 
            this.Codigo.HeaderText = "Codigo";
            this.Codigo.Name = "Codigo";
            this.Codigo.ReadOnly = true;
            // 
            // Producto
            // 
            this.Producto.HeaderText = "Producto";
            this.Producto.Name = "Producto";
            this.Producto.ReadOnly = true;
            // 
            // Precio
            // 
            this.Precio.HeaderText = "Precio";
            this.Precio.Name = "Precio";
            this.Precio.ReadOnly = true;
            // 
            // PrecioVenta
            // 
            this.PrecioVenta.HeaderText = "PrecioVenta";
            this.PrecioVenta.Name = "PrecioVenta";
            this.PrecioVenta.ReadOnly = true;
            // 
            // Cantidad
            // 
            this.Cantidad.HeaderText = "Cantidad";
            this.Cantidad.Name = "Cantidad";
            this.Cantidad.ReadOnly = true;
            // 
            // StockActual
            // 
            this.StockActual.HeaderText = "StockActual";
            this.StockActual.Name = "StockActual";
            this.StockActual.ReadOnly = true;
            // 
            // gbRegistrarComprobante
            // 
            this.gbRegistrarComprobante.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gbRegistrarComprobante.Controls.Add(this.cbIVA);
            this.gbRegistrarComprobante.Controls.Add(this.cbTipoComprobante);
            this.gbRegistrarComprobante.Controls.Add(this.lblTComprobante);
            this.gbRegistrarComprobante.Controls.Add(this.lblCorrelativa);
            this.gbRegistrarComprobante.Controls.Add(this.lblSerie);
            this.gbRegistrarComprobante.Controls.Add(this.txtCorrelativa);
            this.gbRegistrarComprobante.Controls.Add(this.txtSerie);
            this.gbRegistrarComprobante.Controls.Add(this.lblNComprobante);
            this.gbRegistrarComprobante.Controls.Add(this.cbRegistrar);
            this.gbRegistrarComprobante.Controls.Add(this.lblIVA);
            this.gbRegistrarComprobante.Location = new System.Drawing.Point(6, 106);
            this.gbRegistrarComprobante.Name = "gbRegistrarComprobante";
            this.gbRegistrarComprobante.Size = new System.Drawing.Size(978, 83);
            this.gbRegistrarComprobante.TabIndex = 34;
            this.gbRegistrarComprobante.TabStop = false;
            this.gbRegistrarComprobante.Text = "Registar Comprobante";
            // 
            // cbIVA
            // 
            this.cbIVA.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbIVA.Enabled = false;
            this.cbIVA.FormattingEnabled = true;
            this.cbIVA.Items.AddRange(new object[] {
            "21,0",
            "10,5"});
            this.cbIVA.Location = new System.Drawing.Point(150, 39);
            this.cbIVA.Name = "cbIVA";
            this.cbIVA.Size = new System.Drawing.Size(121, 29);
            this.cbIVA.TabIndex = 6;
            // 
            // cbTipoComprobante
            // 
            this.cbTipoComprobante.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbTipoComprobante.Enabled = false;
            this.cbTipoComprobante.FormattingEnabled = true;
            this.cbTipoComprobante.Items.AddRange(new object[] {
            "TICKET",
            "BOLETA",
            "FACTURA",
            "REMITO"});
            this.cbTipoComprobante.Location = new System.Drawing.Point(439, 39);
            this.cbTipoComprobante.Name = "cbTipoComprobante";
            this.cbTipoComprobante.Size = new System.Drawing.Size(121, 29);
            this.cbTipoComprobante.TabIndex = 7;
            // 
            // lblTComprobante
            // 
            this.lblTComprobante.AutoSize = true;
            this.lblTComprobante.Location = new System.Drawing.Point(278, 43);
            this.lblTComprobante.Name = "lblTComprobante";
            this.lblTComprobante.Size = new System.Drawing.Size(159, 21);
            this.lblTComprobante.TabIndex = 36;
            this.lblTComprobante.Text = "Tipo Comprobante";
            // 
            // lblCorrelativa
            // 
            this.lblCorrelativa.AutoSize = true;
            this.lblCorrelativa.Location = new System.Drawing.Point(731, 44);
            this.lblCorrelativa.Name = "lblCorrelativa";
            this.lblCorrelativa.Size = new System.Drawing.Size(98, 21);
            this.lblCorrelativa.TabIndex = 34;
            this.lblCorrelativa.Text = "Correlativa";
            // 
            // lblSerie
            // 
            this.lblSerie.AutoSize = true;
            this.lblSerie.Location = new System.Drawing.Point(582, 44);
            this.lblSerie.Name = "lblSerie";
            this.lblSerie.Size = new System.Drawing.Size(46, 21);
            this.lblSerie.TabIndex = 33;
            this.lblSerie.Text = "Serie";
            // 
            // txtCorrelativa
            // 
            this.txtCorrelativa.Enabled = false;
            this.txtCorrelativa.Location = new System.Drawing.Point(836, 41);
            this.txtCorrelativa.MaxLength = 8;
            this.txtCorrelativa.Name = "txtCorrelativa";
            this.txtCorrelativa.Size = new System.Drawing.Size(131, 27);
            this.txtCorrelativa.TabIndex = 9;
            this.txtCorrelativa.TextChanged += new System.EventHandler(this.txtCorrelativa_TextChanged);
            this.txtCorrelativa.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtCorrelativa_KeyDown);
            this.txtCorrelativa.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtCorrelativa_KeyPress);
            this.txtCorrelativa.Leave += new System.EventHandler(this.txtCorrelativa_Leave);
            // 
            // txtSerie
            // 
            this.txtSerie.Enabled = false;
            this.txtSerie.Location = new System.Drawing.Point(634, 41);
            this.txtSerie.MaxLength = 4;
            this.txtSerie.Name = "txtSerie";
            this.txtSerie.Size = new System.Drawing.Size(79, 27);
            this.txtSerie.TabIndex = 8;
            this.txtSerie.TextChanged += new System.EventHandler(this.txtSerie_TextChanged);
            this.txtSerie.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtSerie_KeyDown);
            this.txtSerie.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSerie_KeyPress);
            this.txtSerie.Leave += new System.EventHandler(this.txtSerie_Leave);
            // 
            // lblNComprobante
            // 
            this.lblNComprobante.AutoSize = true;
            this.lblNComprobante.Location = new System.Drawing.Point(681, 15);
            this.lblNComprobante.Name = "lblNComprobante";
            this.lblNComprobante.Size = new System.Drawing.Size(214, 21);
            this.lblNComprobante.TabIndex = 31;
            this.lblNComprobante.Text = "Numero de Comprobante";
            // 
            // cbRegistrar
            // 
            this.cbRegistrar.AutoSize = true;
            this.cbRegistrar.Enabled = false;
            this.cbRegistrar.Location = new System.Drawing.Point(6, 41);
            this.cbRegistrar.Name = "cbRegistrar";
            this.cbRegistrar.Size = new System.Drawing.Size(97, 25);
            this.cbRegistrar.TabIndex = 5;
            this.cbRegistrar.Text = "Registrar";
            this.cbRegistrar.UseVisualStyleBackColor = true;
            this.cbRegistrar.CheckedChanged += new System.EventHandler(this.cbRegistrar_CheckedChanged);
            // 
            // lblIVA
            // 
            this.lblIVA.AutoSize = true;
            this.lblIVA.Location = new System.Drawing.Point(108, 43);
            this.lblIVA.Name = "lblIVA";
            this.lblIVA.Size = new System.Drawing.Size(39, 21);
            this.lblIVA.TabIndex = 28;
            this.lblIVA.Text = "IVA";
            // 
            // gbDetalleMovimento
            // 
            this.gbDetalleMovimento.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gbDetalleMovimento.Controls.Add(this.btnBuscarProd);
            this.gbDetalleMovimento.Controls.Add(this.btnQuitar);
            this.gbDetalleMovimento.Controls.Add(this.btnAgregar);
            this.gbDetalleMovimento.Controls.Add(this.btnCambiarPrecio);
            this.gbDetalleMovimento.Controls.Add(this.txtStockActual);
            this.gbDetalleMovimento.Controls.Add(this.lblStockActual);
            this.gbDetalleMovimento.Controls.Add(this.txtIngOegr);
            this.gbDetalleMovimento.Controls.Add(this.lblCntIngOegr);
            this.gbDetalleMovimento.Controls.Add(this.txtPrecioVenta);
            this.gbDetalleMovimento.Controls.Add(this.lblPrecioVenta);
            this.gbDetalleMovimento.Controls.Add(this.txtPrecioCompra);
            this.gbDetalleMovimento.Controls.Add(this.lblPrecioCompra);
            this.gbDetalleMovimento.Controls.Add(this.txtIdArticulo);
            this.gbDetalleMovimento.Controls.Add(this.lblCodigo);
            this.gbDetalleMovimento.Controls.Add(this.lblNomProducto);
            this.gbDetalleMovimento.Controls.Add(this.txtNombreProducto);
            this.gbDetalleMovimento.Location = new System.Drawing.Point(6, 195);
            this.gbDetalleMovimento.Name = "gbDetalleMovimento";
            this.gbDetalleMovimento.Size = new System.Drawing.Size(978, 132);
            this.gbDetalleMovimento.TabIndex = 33;
            this.gbDetalleMovimento.TabStop = false;
            this.gbDetalleMovimento.Text = "Detalles de Movimiento Stock";
            // 
            // btnBuscarProd
            // 
            this.btnBuscarProd.Enabled = false;
            this.btnBuscarProd.Image = global::Capa_Presentacion.Properties.Resources.Search_15px;
            this.btnBuscarProd.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBuscarProd.Location = new System.Drawing.Point(355, 29);
            this.btnBuscarProd.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.btnBuscarProd.Name = "btnBuscarProd";
            this.btnBuscarProd.Size = new System.Drawing.Size(26, 28);
            this.btnBuscarProd.TabIndex = 38;
            this.btnBuscarProd.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnBuscarProd.UseVisualStyleBackColor = true;
            this.btnBuscarProd.Click += new System.EventHandler(this.btnBuscarProd_Click);
            // 
            // btnQuitar
            // 
            this.btnQuitar.Enabled = false;
            this.btnQuitar.Image = global::Capa_Presentacion.Properties.Resources.Minus_15px;
            this.btnQuitar.Location = new System.Drawing.Point(925, 26);
            this.btnQuitar.Name = "btnQuitar";
            this.btnQuitar.Size = new System.Drawing.Size(26, 28);
            this.btnQuitar.TabIndex = 15;
            this.btnQuitar.UseVisualStyleBackColor = true;
            this.btnQuitar.Click += new System.EventHandler(this.btnQuitar_Click);
            // 
            // btnAgregar
            // 
            this.btnAgregar.Enabled = false;
            this.btnAgregar.Image = global::Capa_Presentacion.Properties.Resources.Plus_15px;
            this.btnAgregar.Location = new System.Drawing.Point(925, 62);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(26, 28);
            this.btnAgregar.TabIndex = 14;
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // btnCambiarPrecio
            // 
            this.btnCambiarPrecio.Enabled = false;
            this.btnCambiarPrecio.Location = new System.Drawing.Point(417, 97);
            this.btnCambiarPrecio.Name = "btnCambiarPrecio";
            this.btnCambiarPrecio.Size = new System.Drawing.Size(263, 29);
            this.btnCambiarPrecio.TabIndex = 12;
            this.btnCambiarPrecio.Text = "Nuevo Precio";
            this.btnCambiarPrecio.UseVisualStyleBackColor = true;
            this.btnCambiarPrecio.Click += new System.EventHandler(this.btnCambiarPrecio_Click);
            // 
            // txtStockActual
            // 
            this.txtStockActual.Location = new System.Drawing.Point(795, 63);
            this.txtStockActual.Name = "txtStockActual";
            this.txtStockActual.ReadOnly = true;
            this.txtStockActual.Size = new System.Drawing.Size(114, 27);
            this.txtStockActual.TabIndex = 35;
            // 
            // lblStockActual
            // 
            this.lblStockActual.AutoSize = true;
            this.lblStockActual.Location = new System.Drawing.Point(686, 66);
            this.lblStockActual.Name = "lblStockActual";
            this.lblStockActual.Size = new System.Drawing.Size(111, 21);
            this.lblStockActual.TabIndex = 34;
            this.lblStockActual.Text = "Stock Actual";
            // 
            // txtIngOegr
            // 
            this.txtIngOegr.Enabled = false;
            this.txtIngOegr.Location = new System.Drawing.Point(772, 27);
            this.txtIngOegr.MaxLength = 8;
            this.txtIngOegr.Name = "txtIngOegr";
            this.txtIngOegr.Size = new System.Drawing.Size(137, 27);
            this.txtIngOegr.TabIndex = 13;
            this.txtIngOegr.TextChanged += new System.EventHandler(this.txtIngOegr_TextChanged);
            this.txtIngOegr.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtIngOegr_KeyDown);
            this.txtIngOegr.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtIngOegr_KeyPress);
            // 
            // lblCntIngOegr
            // 
            this.lblCntIngOegr.AutoSize = true;
            this.lblCntIngOegr.Location = new System.Drawing.Point(686, 30);
            this.lblCntIngOegr.Name = "lblCntIngOegr";
            this.lblCntIngOegr.Size = new System.Drawing.Size(87, 21);
            this.lblCntIngOegr.TabIndex = 32;
            this.lblCntIngOegr.Text = "Cantidad";
            // 
            // txtPrecioVenta
            // 
            this.txtPrecioVenta.Location = new System.Drawing.Point(549, 63);
            this.txtPrecioVenta.Name = "txtPrecioVenta";
            this.txtPrecioVenta.ReadOnly = true;
            this.txtPrecioVenta.Size = new System.Drawing.Size(131, 27);
            this.txtPrecioVenta.TabIndex = 31;
            // 
            // lblPrecioVenta
            // 
            this.lblPrecioVenta.AutoSize = true;
            this.lblPrecioVenta.Location = new System.Drawing.Point(398, 66);
            this.lblPrecioVenta.Name = "lblPrecioVenta";
            this.lblPrecioVenta.Size = new System.Drawing.Size(110, 21);
            this.lblPrecioVenta.TabIndex = 30;
            this.lblPrecioVenta.Text = "Precio Venta";
            // 
            // txtPrecioCompra
            // 
            this.txtPrecioCompra.Enabled = false;
            this.txtPrecioCompra.Location = new System.Drawing.Point(549, 27);
            this.txtPrecioCompra.MaxLength = 10;
            this.txtPrecioCompra.Name = "txtPrecioCompra";
            this.txtPrecioCompra.Size = new System.Drawing.Size(131, 27);
            this.txtPrecioCompra.TabIndex = 11;
            this.txtPrecioCompra.TextChanged += new System.EventHandler(this.txtPrecioCompra_TextChanged);
            this.txtPrecioCompra.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtPrecioCompra_KeyDown);
            this.txtPrecioCompra.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtPrecioCompra_KeyPress);
            this.txtPrecioCompra.Leave += new System.EventHandler(this.txtPrecioCompra_Leave);
            // 
            // lblPrecioCompra
            // 
            this.lblPrecioCompra.AutoSize = true;
            this.lblPrecioCompra.Location = new System.Drawing.Point(398, 30);
            this.lblPrecioCompra.Name = "lblPrecioCompra";
            this.lblPrecioCompra.Size = new System.Drawing.Size(126, 21);
            this.lblPrecioCompra.TabIndex = 28;
            this.lblPrecioCompra.Text = "Precio Compra";
            // 
            // lblCodigo
            // 
            this.lblCodigo.AutoSize = true;
            this.lblCodigo.Location = new System.Drawing.Point(3, 34);
            this.lblCodigo.Name = "lblCodigo";
            this.lblCodigo.Size = new System.Drawing.Size(68, 21);
            this.lblCodigo.TabIndex = 10;
            this.lblCodigo.Text = "Código";
            // 
            // lblNomProducto
            // 
            this.lblNomProducto.AutoSize = true;
            this.lblNomProducto.Location = new System.Drawing.Point(1, 75);
            this.lblNomProducto.Name = "lblNomProducto";
            this.lblNomProducto.Size = new System.Drawing.Size(149, 21);
            this.lblNomProducto.TabIndex = 26;
            this.lblNomProducto.Text = "Nombre Producto";
            // 
            // txtNombreProducto
            // 
            this.txtNombreProducto.Enabled = false;
            this.txtNombreProducto.Location = new System.Drawing.Point(150, 71);
            this.txtNombreProducto.Name = "txtNombreProducto";
            this.txtNombreProducto.ReadOnly = true;
            this.txtNombreProducto.Size = new System.Drawing.Size(198, 27);
            this.txtNombreProducto.TabIndex = 27;
            // 
            // txtNombreProveedor
            // 
            this.txtNombreProveedor.Enabled = false;
            this.txtNombreProveedor.Location = new System.Drawing.Point(603, 65);
            this.txtNombreProveedor.Name = "txtNombreProveedor";
            this.txtNombreProveedor.ReadOnly = true;
            this.txtNombreProveedor.Size = new System.Drawing.Size(195, 27);
            this.txtNombreProveedor.TabIndex = 32;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(411, 69);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(157, 21);
            this.label3.TabIndex = 31;
            this.label3.Text = "Nombre Proveedor";
            // 
            // txtIdProveedor
            // 
            this.txtIdProveedor.Enabled = false;
            this.txtIdProveedor.Location = new System.Drawing.Point(603, 24);
            this.txtIdProveedor.Name = "txtIdProveedor";
            this.txtIdProveedor.ReadOnly = true;
            this.txtIdProveedor.Size = new System.Drawing.Size(195, 27);
            this.txtIdProveedor.TabIndex = 29;
            // 
            // lblIdProveedor
            // 
            this.lblIdProveedor.AutoSize = true;
            this.lblIdProveedor.Location = new System.Drawing.Point(411, 28);
            this.lblIdProveedor.Name = "lblIdProveedor";
            this.lblIdProveedor.Size = new System.Drawing.Size(68, 21);
            this.lblIdProveedor.TabIndex = 28;
            this.lblIdProveedor.Text = "Código";
            // 
            // dtpFechaGenerar
            // 
            this.dtpFechaGenerar.Enabled = false;
            this.dtpFechaGenerar.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaGenerar.Location = new System.Drawing.Point(13, 23);
            this.dtpFechaGenerar.Name = "dtpFechaGenerar";
            this.dtpFechaGenerar.Size = new System.Drawing.Size(184, 27);
            this.dtpFechaGenerar.TabIndex = 23;
            // 
            // btnEgreso
            // 
            this.btnEgreso.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEgreso.Location = new System.Drawing.Point(203, 56);
            this.btnEgreso.Name = "btnEgreso";
            this.btnEgreso.Size = new System.Drawing.Size(184, 41);
            this.btnEgreso.TabIndex = 3;
            this.btnEgreso.Text = "Generar Egreso (&2)";
            this.btnEgreso.UseVisualStyleBackColor = true;
            this.btnEgreso.Click += new System.EventHandler(this.btnEgreso_Click);
            // 
            // btnIngreso
            // 
            this.btnIngreso.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnIngreso.Location = new System.Drawing.Point(13, 56);
            this.btnIngreso.Name = "btnIngreso";
            this.btnIngreso.Size = new System.Drawing.Size(184, 41);
            this.btnIngreso.TabIndex = 2;
            this.btnIngreso.Text = "Generar Ingreso(&1)";
            this.btnIngreso.UseVisualStyleBackColor = true;
            this.btnIngreso.Click += new System.EventHandler(this.btnIngreso_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnCancelar.Enabled = false;
            this.btnCancelar.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCancelar.Location = new System.Drawing.Point(136, 617);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(105, 40);
            this.btnCancelar.TabIndex = 18;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // btnGuardar
            // 
            this.btnGuardar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnGuardar.Enabled = false;
            this.btnGuardar.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGuardar.Location = new System.Drawing.Point(19, 617);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(105, 40);
            this.btnGuardar.TabIndex = 17;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            this.btnGuardar.MouseHover += new System.EventHandler(this.btnGuardar_MouseHover);
            // 
            // errorIcono
            // 
            this.errorIcono.ContainerControl = this;
            // 
            // ttMensajeAyuda
            // 
            this.ttMensajeAyuda.AutomaticDelay = 90;
            this.ttMensajeAyuda.AutoPopDelay = 2000;
            this.ttMensajeAyuda.InitialDelay = 90;
            this.ttMensajeAyuda.ReshowDelay = 18;
            // 
            // toolTip1
            // 
            this.toolTip1.AutomaticDelay = 90;
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
            this.panelHorizontal.Size = new System.Drawing.Size(1028, 37);
            this.panelHorizontal.TabIndex = 64;
            this.panelHorizontal.DoubleClick += new System.EventHandler(this.panelHorizontal_DoubleClick);
            this.panelHorizontal.MouseMove += new System.Windows.Forms.MouseEventHandler(this.panelHorizontal_MouseMove);
            // 
            // btnMaximizar
            // 
            this.btnMaximizar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnMaximizar.BackgroundImage = global::Capa_Presentacion.Properties.Resources.maximize_Checkbox_16px;
            this.btnMaximizar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnMaximizar.Location = new System.Drawing.Point(968, 5);
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
            this.btnRestaurar.Location = new System.Drawing.Point(968, 5);
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
            this.btnMinimizar.Location = new System.Drawing.Point(935, 5);
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
            this.btnCerrar.ErrorImage = null;
            this.btnCerrar.Location = new System.Drawing.Point(1001, 5);
            this.btnCerrar.Name = "btnCerrar";
            this.btnCerrar.Size = new System.Drawing.Size(22, 25);
            this.btnCerrar.TabIndex = 0;
            this.btnCerrar.TabStop = false;
            this.btnCerrar.Click += new System.EventHandler(this.btnCerrar_Click);
            this.btnCerrar.MouseLeave += new System.EventHandler(this.btnCerrar_MouseLeave);
            this.btnCerrar.MouseMove += new System.Windows.Forms.MouseEventHandler(this.btnCerrar_MouseMove);
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
            this.lblSistemaVenta.Size = new System.Drawing.Size(245, 23);
            this.lblSistemaVenta.TabIndex = 3;
            this.lblSistemaVenta.Text = "MOVIMIENTO DE STOCK    ";
            this.lblSistemaVenta.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // FrmMovStock1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::Capa_Presentacion.Properties.Resources.fondo1;
            this.ClientSize = new System.Drawing.Size(1028, 772);
            this.Controls.Add(this.panelHorizontal);
            this.Controls.Add(this.tabControl1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.KeyPreview = true;
            this.Name = "FrmMovStock1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.FrmMovStock1_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.FrmMovStock1_KeyDown);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).EndInit();
            this.tabLista.ResumeLayout(false);
            this.tabLista.PerformLayout();
            this.tabControl1.ResumeLayout(false);
            this.tabGenerar.ResumeLayout(false);
            this.grpboxProveedor.ResumeLayout(false);
            this.grpboxProveedor.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataListaMov)).EndInit();
            this.gbRegistrarComprobante.ResumeLayout(false);
            this.gbRegistrarComprobante.PerformLayout();
            this.gbDetalleMovimento.ResumeLayout(false);
            this.gbDetalleMovimento.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorIcono)).EndInit();
            this.panelHorizontal.ResumeLayout(false);
            this.panelHorizontal.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.btnMaximizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRestaurar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnMinimizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnCerrar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bindingSource1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnImprimir;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabLista;
        private System.Windows.Forms.DataGridView dataLista;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.Label lblFechaIni;
        private System.Windows.Forms.Button btnAnular;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.TabPage tabGenerar;
        private System.Windows.Forms.GroupBox grpboxProveedor;
        private System.Windows.Forms.TextBox txtIdArticulo;
        private System.Windows.Forms.Label lblCodigo;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.ErrorProvider errorIcono;
        private System.Windows.Forms.ToolTip ttMensajeAyuda;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.Panel panelHorizontal;
        private System.Windows.Forms.Label lblSistemaVenta;
        private System.Windows.Forms.PictureBox btnMinimizar;
        private System.Windows.Forms.PictureBox btnCerrar;
        private System.Windows.Forms.PictureBox btnMaximizar;
        private System.Windows.Forms.PictureBox btnRestaurar;
        private System.Windows.Forms.DateTimePicker dtpFechaFin;
        private System.Windows.Forms.DateTimePicker dtpFechaIni;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker dtpFechaGenerar;
        private System.Windows.Forms.BindingSource bindingSource1;
        private System.Windows.Forms.GroupBox gbDetalleMovimento;
        private System.Windows.Forms.TextBox txtNombreProveedor;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtIdProveedor;
        private System.Windows.Forms.Label lblIdProveedor;
        private System.Windows.Forms.TextBox txtNombreProducto;
        private System.Windows.Forms.Label lblNomProducto;
        private System.Windows.Forms.GroupBox gbRegistrarComprobante;
        private System.Windows.Forms.Label lblCorrelativa;
        private System.Windows.Forms.Label lblSerie;
        private System.Windows.Forms.TextBox txtCorrelativa;
        private System.Windows.Forms.TextBox txtSerie;
        private System.Windows.Forms.Label lblNComprobante;
        private System.Windows.Forms.CheckBox cbRegistrar;
        private System.Windows.Forms.Label lblIVA;
        private System.Windows.Forms.ComboBox cbTipoComprobante;
        private System.Windows.Forms.Label lblTComprobante;
        private System.Windows.Forms.TextBox txtStockActual;
        private System.Windows.Forms.Label lblStockActual;
        private System.Windows.Forms.TextBox txtIngOegr;
        private System.Windows.Forms.Label lblCntIngOegr;
        private System.Windows.Forms.TextBox txtPrecioVenta;
        private System.Windows.Forms.Label lblPrecioVenta;
        private System.Windows.Forms.TextBox txtPrecioCompra;
        private System.Windows.Forms.Label lblPrecioCompra;
        private System.Windows.Forms.ComboBox cbIVA;
        private System.Windows.Forms.Button btnCambiarPrecio;
        private System.Windows.Forms.DataGridView dataListaMov;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.Button btnQuitar;
        private System.Windows.Forms.Button btnEgreso;
        private System.Windows.Forms.Button btnIngreso;
        private System.Windows.Forms.Label lblTotalPagar;
        private System.Windows.Forms.DataGridViewTextBoxColumn Codigo;
        private System.Windows.Forms.DataGridViewTextBoxColumn Producto;
        private System.Windows.Forms.DataGridViewTextBoxColumn Precio;
        private System.Windows.Forms.DataGridViewTextBoxColumn PrecioVenta;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cantidad;
        private System.Windows.Forms.DataGridViewTextBoxColumn StockActual;
        private System.Windows.Forms.Button btnTodos;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnBuscarProv;
        private System.Windows.Forms.Button btnBuscarProd;

    }
}