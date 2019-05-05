namespace Capa_Presentacion
{
    partial class FrmListadoVentas
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
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea1 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend1 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series1 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.Title title1 = new System.Windows.Forms.DataVisualization.Charting.Title();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmListadoVentas));
            this.label1 = new System.Windows.Forms.Label();
            this.dtpFechaFin = new System.Windows.Forms.DateTimePicker();
            this.dtpFechaIni = new System.Windows.Forms.DateTimePicker();
            this.dataLista = new System.Windows.Forms.DataGridView();
            this.Codigo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.razon_social = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Fecha = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Tipo_comprobante = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Total = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Estado = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblFechaIni = new System.Windows.Forms.Label();
            this.txtTotal = new System.Windows.Forms.TextBox();
            this.lblTotal = new System.Windows.Forms.Label();
            this.gbxConsultasAvanzadas = new System.Windows.Forms.GroupBox();
            this.gbxHerramientas = new System.Windows.Forms.GroupBox();
            this.gbxVisualizar = new System.Windows.Forms.GroupBox();
            this.errorIcono = new System.Windows.Forms.ErrorProvider(this.components);
            this.ttMensajeAyuda = new System.Windows.Forms.ToolTip(this.components);
            this.lblSistemaVenta = new System.Windows.Forms.Label();
            this.panelHorizontal = new System.Windows.Forms.Panel();
            this.pnlSeparacion = new System.Windows.Forms.Panel();
            this.chartRankingVentas = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.btnMaximizar = new System.Windows.Forms.PictureBox();
            this.btnRestaurar = new System.Windows.Forms.PictureBox();
            this.btnMinimizar = new System.Windows.Forms.PictureBox();
            this.btnCerrar = new System.Windows.Forms.PictureBox();
            this.btnExportarExcel = new System.Windows.Forms.Button();
            this.btnCalculadora = new System.Windows.Forms.Button();
            this.btnVisualizadorArea = new System.Windows.Forms.Button();
            this.btnVisualizadorTorta = new System.Windows.Forms.Button();
            this.btnVisualizarGrafico = new System.Windows.Forms.Button();
            this.btnVisualizarLista = new System.Windows.Forms.Button();
            this.btnTodos = new System.Windows.Forms.Button();
            this.btnBuscar = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).BeginInit();
            this.gbxConsultasAvanzadas.SuspendLayout();
            this.gbxHerramientas.SuspendLayout();
            this.gbxVisualizar.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errorIcono)).BeginInit();
            this.panelHorizontal.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chartRankingVentas)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnMaximizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRestaurar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnMinimizar)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnCerrar)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(201, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(97, 22);
            this.label1.TabIndex = 23;
            this.label1.Text = "Fecha Fin";
            // 
            // dtpFechaFin
            // 
            this.dtpFechaFin.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaFin.Location = new System.Drawing.Point(205, 59);
            this.dtpFechaFin.Name = "dtpFechaFin";
            this.dtpFechaFin.Size = new System.Drawing.Size(157, 26);
            this.dtpFechaFin.TabIndex = 17;
            // 
            // dtpFechaIni
            // 
            this.dtpFechaIni.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaIni.Location = new System.Drawing.Point(14, 59);
            this.dtpFechaIni.Name = "dtpFechaIni";
            this.dtpFechaIni.Size = new System.Drawing.Size(157, 26);
            this.dtpFechaIni.TabIndex = 16;
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
            this.razon_social,
            this.Fecha,
            this.Tipo_comprobante,
            this.Total,
            this.Estado});
            this.dataLista.Location = new System.Drawing.Point(22, 174);
            this.dataLista.MultiSelect = false;
            this.dataLista.Name = "dataLista";
            this.dataLista.ReadOnly = true;
            this.dataLista.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataLista.Size = new System.Drawing.Size(965, 409);
            this.dataLista.TabIndex = 21;
            this.dataLista.CellMouseDoubleClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dataLista_CellMouseDoubleClick_1);
            this.dataLista.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dataLista_KeyDown);
            // 
            // Codigo
            // 
            this.Codigo.HeaderText = "Codigo";
            this.Codigo.Name = "Codigo";
            this.Codigo.ReadOnly = true;
            // 
            // razon_social
            // 
            this.razon_social.HeaderText = "Razon_social";
            this.razon_social.Name = "razon_social";
            this.razon_social.ReadOnly = true;
            // 
            // Fecha
            // 
            this.Fecha.HeaderText = "Fecha";
            this.Fecha.Name = "Fecha";
            this.Fecha.ReadOnly = true;
            // 
            // Tipo_comprobante
            // 
            this.Tipo_comprobante.HeaderText = "Tipo_comprobante";
            this.Tipo_comprobante.Name = "Tipo_comprobante";
            this.Tipo_comprobante.ReadOnly = true;
            // 
            // Total
            // 
            this.Total.HeaderText = "Total";
            this.Total.Name = "Total";
            this.Total.ReadOnly = true;
            // 
            // Estado
            // 
            this.Estado.HeaderText = "Estado";
            this.Estado.Name = "Estado";
            this.Estado.ReadOnly = true;
            // 
            // lblFechaIni
            // 
            this.lblFechaIni.AutoSize = true;
            this.lblFechaIni.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFechaIni.Location = new System.Drawing.Point(16, 28);
            this.lblFechaIni.Name = "lblFechaIni";
            this.lblFechaIni.Size = new System.Drawing.Size(120, 22);
            this.lblFechaIni.TabIndex = 22;
            this.lblFechaIni.Text = "Fecha Inicio";
            // 
            // txtTotal
            // 
            this.txtTotal.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.txtTotal.BackColor = System.Drawing.Color.MediumSeaGreen;
            this.txtTotal.Font = new System.Drawing.Font("Century Gothic", 20F, System.Drawing.FontStyle.Bold);
            this.txtTotal.Location = new System.Drawing.Point(722, 605);
            this.txtTotal.Margin = new System.Windows.Forms.Padding(4, 7, 4, 7);
            this.txtTotal.Name = "txtTotal";
            this.txtTotal.ReadOnly = true;
            this.txtTotal.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.txtTotal.Size = new System.Drawing.Size(265, 40);
            this.txtTotal.TabIndex = 61;
            this.txtTotal.Text = "0,00";
            // 
            // lblTotal
            // 
            this.lblTotal.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.lblTotal.AutoSize = true;
            this.lblTotal.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotal.Location = new System.Drawing.Point(612, 618);
            this.lblTotal.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(76, 19);
            this.lblTotal.TabIndex = 60;
            this.lblTotal.Text = "TOTAL $ :";
            // 
            // gbxConsultasAvanzadas
            // 
            this.gbxConsultasAvanzadas.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gbxConsultasAvanzadas.Controls.Add(this.gbxHerramientas);
            this.gbxConsultasAvanzadas.Controls.Add(this.gbxVisualizar);
            this.gbxConsultasAvanzadas.Controls.Add(this.lblFechaIni);
            this.gbxConsultasAvanzadas.Controls.Add(this.dtpFechaIni);
            this.gbxConsultasAvanzadas.Controls.Add(this.dtpFechaFin);
            this.gbxConsultasAvanzadas.Controls.Add(this.btnTodos);
            this.gbxConsultasAvanzadas.Controls.Add(this.label1);
            this.gbxConsultasAvanzadas.Controls.Add(this.btnBuscar);
            this.gbxConsultasAvanzadas.Location = new System.Drawing.Point(22, 45);
            this.gbxConsultasAvanzadas.Name = "gbxConsultasAvanzadas";
            this.gbxConsultasAvanzadas.Size = new System.Drawing.Size(965, 91);
            this.gbxConsultasAvanzadas.TabIndex = 62;
            this.gbxConsultasAvanzadas.TabStop = false;
            this.gbxConsultasAvanzadas.Text = "Consultas Avanzadas";
            // 
            // gbxHerramientas
            // 
            this.gbxHerramientas.Controls.Add(this.btnExportarExcel);
            this.gbxHerramientas.Controls.Add(this.btnCalculadora);
            this.gbxHerramientas.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbxHerramientas.Location = new System.Drawing.Point(462, 15);
            this.gbxHerramientas.Name = "gbxHerramientas";
            this.gbxHerramientas.Size = new System.Drawing.Size(127, 64);
            this.gbxHerramientas.TabIndex = 28;
            this.gbxHerramientas.TabStop = false;
            this.gbxHerramientas.Text = "herramientas";
            // 
            // gbxVisualizar
            // 
            this.gbxVisualizar.Controls.Add(this.btnVisualizadorArea);
            this.gbxVisualizar.Controls.Add(this.btnVisualizadorTorta);
            this.gbxVisualizar.Controls.Add(this.btnVisualizarGrafico);
            this.gbxVisualizar.Controls.Add(this.btnVisualizarLista);
            this.gbxVisualizar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbxVisualizar.Location = new System.Drawing.Point(595, 15);
            this.gbxVisualizar.Name = "gbxVisualizar";
            this.gbxVisualizar.Size = new System.Drawing.Size(359, 64);
            this.gbxVisualizar.TabIndex = 25;
            this.gbxVisualizar.TabStop = false;
            this.gbxVisualizar.Text = "visualizador";
            // 
            // errorIcono
            // 
            this.errorIcono.ContainerControl = this;
            // 
            // ttMensajeAyuda
            // 
            this.ttMensajeAyuda.AutomaticDelay = 90;
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
            this.lblSistemaVenta.Size = new System.Drawing.Size(157, 23);
            this.lblSistemaVenta.TabIndex = 3;
            this.lblSistemaVenta.Text = "LISTA DE VENTAS";
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
            // pnlSeparacion
            // 
            this.pnlSeparacion.Location = new System.Drawing.Point(0, 0);
            this.pnlSeparacion.Name = "pnlSeparacion";
            this.pnlSeparacion.Size = new System.Drawing.Size(200, 100);
            this.pnlSeparacion.TabIndex = 0;
            // 
            // chartRankingVentas
            // 
            this.chartRankingVentas.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.chartRankingVentas.BackColor = System.Drawing.Color.Transparent;
            this.chartRankingVentas.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.chartRankingVentas.BorderlineWidth = 3;
            chartArea1.Area3DStyle.Enable3D = true;
            chartArea1.Name = "ChartArea1";
            this.chartRankingVentas.ChartAreas.Add(chartArea1);
            legend1.Name = "Legend1";
            this.chartRankingVentas.Legends.Add(legend1);
            this.chartRankingVentas.Location = new System.Drawing.Point(42, 157);
            this.chartRankingVentas.Name = "chartRankingVentas";
            series1.ChartArea = "ChartArea1";
            series1.Legend = "Legend1";
            series1.Name = "Ventas";
            this.chartRankingVentas.Series.Add(series1);
            this.chartRankingVentas.Size = new System.Drawing.Size(933, 497);
            this.chartRankingVentas.TabIndex = 65;
            title1.Name = "Ventas";
            this.chartRankingVentas.Titles.Add(title1);
            this.chartRankingVentas.Visible = false;
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
            // btnExportarExcel
            // 
            this.btnExportarExcel.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnExportarExcel.Image = global::Capa_Presentacion.Properties.Resources.Microsoft_Excel_20px;
            this.btnExportarExcel.Location = new System.Drawing.Point(42, 28);
            this.btnExportarExcel.Name = "btnExportarExcel";
            this.btnExportarExcel.Size = new System.Drawing.Size(26, 28);
            this.btnExportarExcel.TabIndex = 29;
            this.btnExportarExcel.UseVisualStyleBackColor = true;
            this.btnExportarExcel.Click += new System.EventHandler(this.btnExportarExcel_Click);
            // 
            // btnCalculadora
            // 
            this.btnCalculadora.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btnCalculadora.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCalculadora.Image = global::Capa_Presentacion.Properties.Resources.Calculator_20px;
            this.btnCalculadora.Location = new System.Drawing.Point(10, 28);
            this.btnCalculadora.Name = "btnCalculadora";
            this.btnCalculadora.Size = new System.Drawing.Size(26, 28);
            this.btnCalculadora.TabIndex = 28;
            this.btnCalculadora.UseVisualStyleBackColor = true;
            this.btnCalculadora.Click += new System.EventHandler(this.btnCalculadora_Click);
            // 
            // btnVisualizadorArea
            // 
            this.btnVisualizadorArea.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVisualizadorArea.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnVisualizadorArea.Image = global::Capa_Presentacion.Properties.Resources.Area_Chart_20px;
            this.btnVisualizadorArea.Location = new System.Drawing.Point(81, 28);
            this.btnVisualizadorArea.Name = "btnVisualizadorArea";
            this.btnVisualizadorArea.Size = new System.Drawing.Size(26, 28);
            this.btnVisualizadorArea.TabIndex = 30;
            this.btnVisualizadorArea.UseVisualStyleBackColor = true;
            this.btnVisualizadorArea.Click += new System.EventHandler(this.btnVisualizadorArea_Click);
            // 
            // btnVisualizadorTorta
            // 
            this.btnVisualizadorTorta.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVisualizadorTorta.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnVisualizadorTorta.Image = global::Capa_Presentacion.Properties.Resources.Chart_20px;
            this.btnVisualizadorTorta.Location = new System.Drawing.Point(49, 28);
            this.btnVisualizadorTorta.Name = "btnVisualizadorTorta";
            this.btnVisualizadorTorta.Size = new System.Drawing.Size(26, 28);
            this.btnVisualizadorTorta.TabIndex = 29;
            this.btnVisualizadorTorta.UseVisualStyleBackColor = true;
            this.btnVisualizadorTorta.Click += new System.EventHandler(this.btnVisualizadorTorta_Click);
            // 
            // btnVisualizarGrafico
            // 
            this.btnVisualizarGrafico.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.btnVisualizarGrafico.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVisualizarGrafico.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnVisualizarGrafico.Image = ((System.Drawing.Image)(resources.GetObject("btnVisualizarGrafico.Image")));
            this.btnVisualizarGrafico.Location = new System.Drawing.Point(17, 28);
            this.btnVisualizarGrafico.Name = "btnVisualizarGrafico";
            this.btnVisualizarGrafico.Size = new System.Drawing.Size(26, 28);
            this.btnVisualizarGrafico.TabIndex = 27;
            this.btnVisualizarGrafico.UseVisualStyleBackColor = true;
            this.btnVisualizarGrafico.Click += new System.EventHandler(this.btnVisualizarGrafico_Click);
            // 
            // btnVisualizarLista
            // 
            this.btnVisualizarLista.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVisualizarLista.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnVisualizarLista.Image = global::Capa_Presentacion.Properties.Resources.List_20px;
            this.btnVisualizarLista.Location = new System.Drawing.Point(113, 28);
            this.btnVisualizarLista.Name = "btnVisualizarLista";
            this.btnVisualizarLista.Size = new System.Drawing.Size(26, 28);
            this.btnVisualizarLista.TabIndex = 26;
            this.btnVisualizarLista.UseVisualStyleBackColor = true;
            this.btnVisualizarLista.Click += new System.EventHandler(this.btnVisualizarLista_Click);
            // 
            // btnTodos
            // 
            this.btnTodos.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTodos.Image = global::Capa_Presentacion.Properties.Resources.Select_All_20px;
            this.btnTodos.Location = new System.Drawing.Point(412, 57);
            this.btnTodos.Name = "btnTodos";
            this.btnTodos.Size = new System.Drawing.Size(26, 28);
            this.btnTodos.TabIndex = 24;
            this.btnTodos.UseVisualStyleBackColor = true;
            this.btnTodos.Click += new System.EventHandler(this.btnTodos_Click);
            // 
            // btnBuscar
            // 
            this.btnBuscar.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBuscar.Image = global::Capa_Presentacion.Properties.Resources.Search_15px;
            this.btnBuscar.Location = new System.Drawing.Point(380, 57);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(26, 28);
            this.btnBuscar.TabIndex = 18;
            this.btnBuscar.UseVisualStyleBackColor = true;
            this.btnBuscar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // FrmListadoVentas
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1012, 697);
            this.Controls.Add(this.panelHorizontal);
            this.Controls.Add(this.gbxConsultasAvanzadas);
            this.Controls.Add(this.txtTotal);
            this.Controls.Add(this.lblTotal);
            this.Controls.Add(this.chartRankingVentas);
            this.Controls.Add(this.dataLista);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "FrmListadoVentas";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Listado de Ventas";
            this.Load += new System.EventHandler(this.FrmListadoVentas_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).EndInit();
            this.gbxConsultasAvanzadas.ResumeLayout(false);
            this.gbxConsultasAvanzadas.PerformLayout();
            this.gbxHerramientas.ResumeLayout(false);
            this.gbxVisualizar.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.errorIcono)).EndInit();
            this.panelHorizontal.ResumeLayout(false);
            this.panelHorizontal.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chartRankingVentas)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnMaximizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnRestaurar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnMinimizar)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.btnCerrar)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnTodos;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker dtpFechaFin;
        private System.Windows.Forms.DateTimePicker dtpFechaIni;
        private System.Windows.Forms.DataGridView dataLista;
        private System.Windows.Forms.Label lblFechaIni;
        private System.Windows.Forms.Button btnBuscar;
        public System.Windows.Forms.TextBox txtTotal;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.GroupBox gbxConsultasAvanzadas;
        private System.Windows.Forms.ErrorProvider errorIcono;
        private System.Windows.Forms.ToolTip ttMensajeAyuda;
        private System.Windows.Forms.Panel panelHorizontal;
        private System.Windows.Forms.Panel pnlSeparacion;
        private System.Windows.Forms.PictureBox btnMaximizar;
        private System.Windows.Forms.Label lblSistemaVenta;
        private System.Windows.Forms.PictureBox btnRestaurar;
        private System.Windows.Forms.PictureBox btnMinimizar;
        private System.Windows.Forms.PictureBox btnCerrar;
        private System.Windows.Forms.GroupBox gbxVisualizar;
        private System.Windows.Forms.Button btnVisualizarGrafico;
        private System.Windows.Forms.Button btnVisualizarLista;
        private System.Windows.Forms.GroupBox gbxHerramientas;
        private System.Windows.Forms.Button btnCalculadora;
        private System.Windows.Forms.Button btnExportarExcel;
        private System.Windows.Forms.DataVisualization.Charting.Chart chartRankingVentas;
        private System.Windows.Forms.DataGridViewTextBoxColumn Codigo;
        private System.Windows.Forms.DataGridViewTextBoxColumn razon_social;
        private System.Windows.Forms.DataGridViewTextBoxColumn Fecha;
        private System.Windows.Forms.DataGridViewTextBoxColumn Tipo_comprobante;
        private System.Windows.Forms.DataGridViewTextBoxColumn Total;
        private System.Windows.Forms.DataGridViewTextBoxColumn Estado;
        private System.Windows.Forms.Button btnVisualizadorTorta;
        private System.Windows.Forms.Button btnVisualizadorArea;

    }
}