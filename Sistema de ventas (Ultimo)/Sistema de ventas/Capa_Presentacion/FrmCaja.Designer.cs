namespace Capa_Presentacion
{
    partial class FrmCaja
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
            this.ttMensajeAyuda = new System.Windows.Forms.ToolTip(this.components);
            this.lblNomProducto = new System.Windows.Forms.Label();
            this.gbMovimento = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.TxtConcepto = new System.Windows.Forms.TextBox();
            this.cbTipoMov = new System.Windows.Forms.ComboBox();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.rbEgreso = new System.Windows.Forms.RadioButton();
            this.rbIngreso = new System.Windows.Forms.RadioButton();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.cbxTurno = new System.Windows.Forms.ComboBox();
            this.lblTurno = new System.Windows.Forms.Label();
            this.cbxPlanCuenta = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtTotal = new System.Windows.Forms.TextBox();
            this.lblTotal = new System.Windows.Forms.Label();
            this.txtTotalIngreso = new System.Windows.Forms.TextBox();
            this.txtToltaEgreso = new System.Windows.Forms.TextBox();
            this.lblTotalEgreso = new System.Windows.Forms.Label();
            this.lblTotalIngreso = new System.Windows.Forms.Label();
            this.dataLista = new System.Windows.Forms.DataGridView();
            this.grpboxConsulta = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.BtnCerrar = new System.Windows.Forms.Button();
            this.BtnApertura = new System.Windows.Forms.Button();
            this.dtpFechaCaja = new System.Windows.Forms.DateTimePicker();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.Menudelete = new System.Windows.Forms.ToolStripMenuItem();
            this.gbMovimento.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).BeginInit();
            this.grpboxConsulta.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblNomProducto
            // 
            this.lblNomProducto.AutoSize = true;
            this.lblNomProducto.Location = new System.Drawing.Point(44, 37);
            this.lblNomProducto.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblNomProducto.Name = "lblNomProducto";
            this.lblNomProducto.Size = new System.Drawing.Size(54, 20);
            this.lblNomProducto.TabIndex = 26;
            this.lblNomProducto.Text = "Fecha";
            // 
            // gbMovimento
            // 
            this.gbMovimento.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gbMovimento.Controls.Add(this.label3);
            this.gbMovimento.Controls.Add(this.TxtConcepto);
            this.gbMovimento.Controls.Add(this.cbTipoMov);
            this.gbMovimento.Controls.Add(this.btnAgregar);
            this.gbMovimento.Controls.Add(this.rbEgreso);
            this.gbMovimento.Controls.Add(this.rbIngreso);
            this.gbMovimento.Controls.Add(this.label2);
            this.gbMovimento.Controls.Add(this.textBox2);
            this.gbMovimento.Controls.Add(this.cbxTurno);
            this.gbMovimento.Controls.Add(this.lblTurno);
            this.gbMovimento.Controls.Add(this.cbxPlanCuenta);
            this.gbMovimento.Controls.Add(this.label1);
            this.gbMovimento.Controls.Add(this.txtTotal);
            this.gbMovimento.Controls.Add(this.lblTotal);
            this.gbMovimento.Controls.Add(this.txtTotalIngreso);
            this.gbMovimento.Controls.Add(this.txtToltaEgreso);
            this.gbMovimento.Controls.Add(this.lblTotalEgreso);
            this.gbMovimento.Controls.Add(this.lblTotalIngreso);
            this.gbMovimento.Controls.Add(this.dataLista);
            this.gbMovimento.Location = new System.Drawing.Point(35, 68);
            this.gbMovimento.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.gbMovimento.Name = "gbMovimento";
            this.gbMovimento.Padding = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.gbMovimento.Size = new System.Drawing.Size(1014, 593);
            this.gbMovimento.TabIndex = 40;
            this.gbMovimento.TabStop = false;
            this.gbMovimento.Text = "Movimientos de Caja";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(45, 194);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(78, 20);
            this.label3.TabIndex = 72;
            this.label3.Text = "Concepto";
            // 
            // TxtConcepto
            // 
            this.TxtConcepto.Location = new System.Drawing.Point(194, 196);
            this.TxtConcepto.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.TxtConcepto.Name = "TxtConcepto";
            this.TxtConcepto.Size = new System.Drawing.Size(241, 26);
            this.TxtConcepto.TabIndex = 71;
            // 
            // cbTipoMov
            // 
            this.cbTipoMov.FormattingEnabled = true;
            this.cbTipoMov.Location = new System.Drawing.Point(193, 68);
            this.cbTipoMov.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cbTipoMov.Name = "cbTipoMov";
            this.cbTipoMov.Size = new System.Drawing.Size(327, 28);
            this.cbTipoMov.TabIndex = 70;
            this.cbTipoMov.SelectedIndexChanged += new System.EventHandler(this.cbTipoMov_SelectedIndexChanged);
            // 
            // btnAgregar
            // 
            this.btnAgregar.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAgregar.Location = new System.Drawing.Point(528, 194);
            this.btnAgregar.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(135, 52);
            this.btnAgregar.TabIndex = 69;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.UseVisualStyleBackColor = true;
            this.btnAgregar.Click += new System.EventHandler(this.btnBuscar_Click);
            // 
            // rbEgreso
            // 
            this.rbEgreso.AutoSize = true;
            this.rbEgreso.Location = new System.Drawing.Point(172, 35);
            this.rbEgreso.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.rbEgreso.Name = "rbEgreso";
            this.rbEgreso.Size = new System.Drawing.Size(97, 24);
            this.rbEgreso.TabIndex = 68;
            this.rbEgreso.Text = "EGRESO";
            this.rbEgreso.UseVisualStyleBackColor = true;
            this.rbEgreso.CheckedChanged += new System.EventHandler(this.rbEgreso_CheckedChanged);
            // 
            // rbIngreso
            // 
            this.rbIngreso.AutoSize = true;
            this.rbIngreso.Checked = true;
            this.rbIngreso.Location = new System.Drawing.Point(45, 35);
            this.rbIngreso.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.rbIngreso.Name = "rbIngreso";
            this.rbIngreso.Size = new System.Drawing.Size(102, 24);
            this.rbIngreso.TabIndex = 67;
            this.rbIngreso.TabStop = true;
            this.rbIngreso.Text = "INGRESO";
            this.rbIngreso.UseVisualStyleBackColor = true;
            this.rbIngreso.CheckedChanged += new System.EventHandler(this.rbIngreso_CheckedChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(45, 237);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(46, 20);
            this.label2.TabIndex = 66;
            this.label2.Text = "Valor";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(194, 234);
            this.textBox2.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(110, 26);
            this.textBox2.TabIndex = 65;
            // 
            // cbxTurno
            // 
            this.cbxTurno.FormattingEnabled = true;
            this.cbxTurno.Items.AddRange(new object[] {
            "Mañana",
            "Tarde",
            "Noche"});
            this.cbxTurno.Location = new System.Drawing.Point(193, 156);
            this.cbxTurno.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cbxTurno.Name = "cbxTurno";
            this.cbxTurno.Size = new System.Drawing.Size(240, 28);
            this.cbxTurno.TabIndex = 64;
            // 
            // lblTurno
            // 
            this.lblTurno.AutoSize = true;
            this.lblTurno.Location = new System.Drawing.Point(45, 160);
            this.lblTurno.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTurno.Name = "lblTurno";
            this.lblTurno.Size = new System.Drawing.Size(50, 20);
            this.lblTurno.TabIndex = 63;
            this.lblTurno.Text = "Turno";
            // 
            // cbxPlanCuenta
            // 
            this.cbxPlanCuenta.FormattingEnabled = true;
            this.cbxPlanCuenta.Location = new System.Drawing.Point(193, 112);
            this.cbxPlanCuenta.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cbxPlanCuenta.Name = "cbxPlanCuenta";
            this.cbxPlanCuenta.Size = new System.Drawing.Size(327, 28);
            this.cbxPlanCuenta.TabIndex = 62;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(40, 112);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(118, 20);
            this.label1.TabIndex = 61;
            this.label1.Text = "Plan de Cuenta";
            // 
            // txtTotal
            // 
            this.txtTotal.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txtTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotal.Location = new System.Drawing.Point(796, 547);
            this.txtTotal.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtTotal.Name = "txtTotal";
            this.txtTotal.Size = new System.Drawing.Size(159, 29);
            this.txtTotal.TabIndex = 60;
            this.txtTotal.Text = "0";
            // 
            // lblTotal
            // 
            this.lblTotal.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.lblTotal.AutoSize = true;
            this.lblTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotal.Location = new System.Drawing.Point(792, 518);
            this.lblTotal.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(66, 24);
            this.lblTotal.TabIndex = 59;
            this.lblTotal.Text = "Total $";
            // 
            // txtTotalIngreso
            // 
            this.txtTotalIngreso.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txtTotalIngreso.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotalIngreso.Location = new System.Drawing.Point(517, 547);
            this.txtTotalIngreso.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtTotalIngreso.Name = "txtTotalIngreso";
            this.txtTotalIngreso.Size = new System.Drawing.Size(252, 29);
            this.txtTotalIngreso.TabIndex = 58;
            this.txtTotalIngreso.Text = "0";
            // 
            // txtToltaEgreso
            // 
            this.txtToltaEgreso.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txtToltaEgreso.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtToltaEgreso.Location = new System.Drawing.Point(234, 547);
            this.txtToltaEgreso.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtToltaEgreso.Name = "txtToltaEgreso";
            this.txtToltaEgreso.Size = new System.Drawing.Size(252, 29);
            this.txtToltaEgreso.TabIndex = 57;
            this.txtToltaEgreso.Text = "0";
            // 
            // lblTotalEgreso
            // 
            this.lblTotalEgreso.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.lblTotalEgreso.AutoSize = true;
            this.lblTotalEgreso.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotalEgreso.Location = new System.Drawing.Point(524, 518);
            this.lblTotalEgreso.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTotalEgreso.Name = "lblTotalEgreso";
            this.lblTotalEgreso.Size = new System.Drawing.Size(127, 24);
            this.lblTotalEgreso.TabIndex = 56;
            this.lblTotalEgreso.Text = "Total Egreso :";
            // 
            // lblTotalIngreso
            // 
            this.lblTotalIngreso.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.lblTotalIngreso.AutoSize = true;
            this.lblTotalIngreso.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotalIngreso.Location = new System.Drawing.Point(230, 518);
            this.lblTotalIngreso.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblTotalIngreso.Name = "lblTotalIngreso";
            this.lblTotalIngreso.Size = new System.Drawing.Size(129, 24);
            this.lblTotalIngreso.TabIndex = 55;
            this.lblTotalIngreso.Text = "Total Ingreso :";
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
            this.dataLista.Location = new System.Drawing.Point(31, 288);
            this.dataLista.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.dataLista.MultiSelect = false;
            this.dataLista.Name = "dataLista";
            this.dataLista.ReadOnly = true;
            this.dataLista.RowHeadersWidth = 38;
            this.dataLista.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataLista.Size = new System.Drawing.Size(961, 200);
            this.dataLista.TabIndex = 46;
            this.dataLista.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataLista_CellContentClick);
            this.dataLista.MouseClick += new System.Windows.Forms.MouseEventHandler(this.dataLista_MouseClick);
            // 
            // grpboxConsulta
            // 
            this.grpboxConsulta.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.grpboxConsulta.Controls.Add(this.label4);
            this.grpboxConsulta.Controls.Add(this.BtnCerrar);
            this.grpboxConsulta.Controls.Add(this.BtnApertura);
            this.grpboxConsulta.Controls.Add(this.gbMovimento);
            this.grpboxConsulta.Controls.Add(this.dtpFechaCaja);
            this.grpboxConsulta.Controls.Add(this.lblNomProducto);
            this.grpboxConsulta.Location = new System.Drawing.Point(16, 20);
            this.grpboxConsulta.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.grpboxConsulta.Name = "grpboxConsulta";
            this.grpboxConsulta.Padding = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.grpboxConsulta.Size = new System.Drawing.Size(1553, 698);
            this.grpboxConsulta.TabIndex = 63;
            this.grpboxConsulta.TabStop = false;
            this.grpboxConsulta.Text = "Caja";
            this.grpboxConsulta.Enter += new System.EventHandler(this.grpboxConsulta_Enter);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(75, 138);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(145, 20);
            this.label4.TabIndex = 72;
            this.label4.Text = "Tipo de movimiento";
            // 
            // BtnCerrar
            // 
            this.BtnCerrar.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BtnCerrar.Location = new System.Drawing.Point(662, 14);
            this.BtnCerrar.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.BtnCerrar.Name = "BtnCerrar";
            this.BtnCerrar.Size = new System.Drawing.Size(135, 52);
            this.BtnCerrar.TabIndex = 71;
            this.BtnCerrar.Text = "Cerrar caja";
            this.BtnCerrar.UseVisualStyleBackColor = true;
            this.BtnCerrar.Click += new System.EventHandler(this.BtnCerrar_Click);
            // 
            // BtnApertura
            // 
            this.BtnApertura.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BtnApertura.Location = new System.Drawing.Point(484, 15);
            this.BtnApertura.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.BtnApertura.Name = "BtnApertura";
            this.BtnApertura.Size = new System.Drawing.Size(135, 52);
            this.BtnApertura.TabIndex = 70;
            this.BtnApertura.Text = "Abrir caja";
            this.BtnApertura.UseVisualStyleBackColor = true;
            this.BtnApertura.Click += new System.EventHandler(this.button1_Click);
            // 
            // dtpFechaCaja
            // 
            this.dtpFechaCaja.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaCaja.Location = new System.Drawing.Point(172, 31);
            this.dtpFechaCaja.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dtpFechaCaja.MinDate = new System.DateTime(1969, 12, 29, 0, 0, 0, 0);
            this.dtpFechaCaja.Name = "dtpFechaCaja";
            this.dtpFechaCaja.Size = new System.Drawing.Size(240, 26);
            this.dtpFechaCaja.TabIndex = 53;
            this.dtpFechaCaja.ValueChanged += new System.EventHandler(this.dtpFechaCaja_ValueChanged);
            this.dtpFechaCaja.KeyDown += new System.Windows.Forms.KeyEventHandler(this.dtpFechaCaja_KeyDown);
            this.dtpFechaCaja.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.dtpFechaCaja_KeyPress);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.Menudelete});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(186, 26);
            // 
            // Menudelete
            // 
            this.Menudelete.Name = "Menudelete";
            this.Menudelete.Size = new System.Drawing.Size(185, 22);
            this.Menudelete.Text = "Eliminar movimiento";
            this.Menudelete.Click += new System.EventHandler(this.Menudelete_Click);
            // 
            // FrmCaja
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(1079, 733);
            this.Controls.Add(this.grpboxConsulta);
            this.DoubleBuffered = true;
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ForeColor = System.Drawing.Color.Black;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmCaja";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Caja";
            this.Load += new System.EventHandler(this.FrmCaja_Load);
            this.gbMovimento.ResumeLayout(false);
            this.gbMovimento.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataLista)).EndInit();
            this.grpboxConsulta.ResumeLayout(false);
            this.grpboxConsulta.PerformLayout();
            this.contextMenuStrip1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ToolTip ttMensajeAyuda;
        private System.Windows.Forms.Label lblNomProducto;
        private System.Windows.Forms.GroupBox gbMovimento;
        private System.Windows.Forms.Label lblTotalEgreso;
        private System.Windows.Forms.Label lblTotalIngreso;
        private System.Windows.Forms.DateTimePicker dtpFechaCaja;
        private System.Windows.Forms.DataGridView dataLista;
        private System.Windows.Forms.GroupBox grpboxConsulta;
        private System.Windows.Forms.TextBox txtTotalIngreso;
        private System.Windows.Forms.TextBox txtToltaEgreso;
        private System.Windows.Forms.ComboBox cbxTurno;
        private System.Windows.Forms.Label lblTurno;
        private System.Windows.Forms.ComboBox cbxPlanCuenta;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtTotal;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.RadioButton rbEgreso;
        private System.Windows.Forms.RadioButton rbIngreso;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.Button BtnCerrar;
        private System.Windows.Forms.Button BtnApertura;
        private System.Windows.Forms.ComboBox cbTipoMov;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox TxtConcepto;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem Menudelete;

    }
}