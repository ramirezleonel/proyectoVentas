﻿namespace Capa_Presentacion
{
    partial class FrmGuardarVenta
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
            this.btnGuardar = new System.Windows.Forms.Button();
            this.lblTotal = new System.Windows.Forms.Label();
            this.lblEfectivo = new System.Windows.Forms.Label();
            this.lblPrecioEfectivo = new System.Windows.Forms.Label();
            this.lblPrecioTotal = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblTotalAPagar = new System.Windows.Forms.Label();
            this.txtTotalAPagar = new System.Windows.Forms.TextBox();
            this.tbEfectivo = new System.Windows.Forms.TabPage();
            this.gbxEfectivo = new System.Windows.Forms.GroupBox();
            this.txtCambio = new System.Windows.Forms.TextBox();
            this.lblCambio = new System.Windows.Forms.Label();
            this.txtAbono = new System.Windows.Forms.TextBox();
            this.lblAbono = new System.Windows.Forms.Label();
            this.tabTarjeta = new System.Windows.Forms.TabControl();
            this.tbTarjeta = new System.Windows.Forms.TabPage();
            this.gbxTarjeta = new System.Windows.Forms.GroupBox();
            this.cbxTarjeta = new System.Windows.Forms.ComboBox();
            this.lblTarjeta = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.tbEfectivo.SuspendLayout();
            this.gbxEfectivo.SuspendLayout();
            this.tabTarjeta.SuspendLayout();
            this.tbTarjeta.SuspendLayout();
            this.gbxTarjeta.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnGuardar
            // 
            this.btnGuardar.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnGuardar.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGuardar.Location = new System.Drawing.Point(0, 327);
            this.btnGuardar.Margin = new System.Windows.Forms.Padding(8, 6, 8, 6);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(720, 59);
            this.btnGuardar.TabIndex = 4;
            this.btnGuardar.Text = "Guardar(F2)";
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            // 
            // lblTotal
            // 
            this.lblTotal.AutoSize = true;
            this.lblTotal.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotal.Location = new System.Drawing.Point(3, 3);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(80, 19);
            this.lblTotal.TabIndex = 44;
            this.lblTotal.Text = "TOTAL  $ :";
            // 
            // lblEfectivo
            // 
            this.lblEfectivo.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblEfectivo.AutoSize = true;
            this.lblEfectivo.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblEfectivo.Location = new System.Drawing.Point(418, 229);
            this.lblEfectivo.Name = "lblEfectivo";
            this.lblEfectivo.Size = new System.Drawing.Size(101, 19);
            this.lblEfectivo.TabIndex = 46;
            this.lblEfectivo.Text = "EFECTIVO $ :";
            // 
            // lblPrecioEfectivo
            // 
            this.lblPrecioEfectivo.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lblPrecioEfectivo.AutoSize = true;
            this.lblPrecioEfectivo.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPrecioEfectivo.Location = new System.Drawing.Point(577, 229);
            this.lblPrecioEfectivo.Name = "lblPrecioEfectivo";
            this.lblPrecioEfectivo.Size = new System.Drawing.Size(31, 19);
            this.lblPrecioEfectivo.TabIndex = 47;
            this.lblPrecioEfectivo.Text = "0.0";
            // 
            // lblPrecioTotal
            // 
            this.lblPrecioTotal.AutoSize = true;
            this.lblPrecioTotal.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPrecioTotal.Location = new System.Drawing.Point(160, 3);
            this.lblPrecioTotal.Name = "lblPrecioTotal";
            this.lblPrecioTotal.Size = new System.Drawing.Size(31, 19);
            this.lblPrecioTotal.TabIndex = 49;
            this.lblPrecioTotal.Text = "0.0";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.MenuHighlight;
            this.panel1.Controls.Add(this.lblPrecioTotal);
            this.panel1.Controls.Add(this.lblTotal);
            this.panel1.Location = new System.Drawing.Point(417, 281);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(251, 37);
            this.panel1.TabIndex = 50;
            // 
            // lblTotalAPagar
            // 
            this.lblTotalAPagar.AutoSize = true;
            this.lblTotalAPagar.Font = new System.Drawing.Font("Century Gothic", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotalAPagar.Location = new System.Drawing.Point(438, 30);
            this.lblTotalAPagar.Name = "lblTotalAPagar";
            this.lblTotalAPagar.Size = new System.Drawing.Size(230, 28);
            this.lblTotalAPagar.TabIndex = 51;
            this.lblTotalAPagar.Text = "TOTAL A PAGAR $ :";
            // 
            // txtTotalAPagar
            // 
            this.txtTotalAPagar.Enabled = false;
            this.txtTotalAPagar.Font = new System.Drawing.Font("Century Gothic", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotalAPagar.Location = new System.Drawing.Point(443, 61);
            this.txtTotalAPagar.Name = "txtTotalAPagar";
            this.txtTotalAPagar.ReadOnly = true;
            this.txtTotalAPagar.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.txtTotalAPagar.Size = new System.Drawing.Size(215, 37);
            this.txtTotalAPagar.TabIndex = 52;
            this.txtTotalAPagar.Text = "0.0";
            // 
            // tbEfectivo
            // 
            this.tbEfectivo.BackColor = System.Drawing.Color.MintCream;
            this.tbEfectivo.Controls.Add(this.gbxEfectivo);
            this.tbEfectivo.Location = new System.Drawing.Point(4, 4);
            this.tbEfectivo.Name = "tbEfectivo";
            this.tbEfectivo.Padding = new System.Windows.Forms.Padding(3);
            this.tbEfectivo.Size = new System.Drawing.Size(328, 270);
            this.tbEfectivo.TabIndex = 0;
            this.tbEfectivo.Text = "EFECTIVO";
            // 
            // gbxEfectivo
            // 
            this.gbxEfectivo.Controls.Add(this.txtCambio);
            this.gbxEfectivo.Controls.Add(this.lblCambio);
            this.gbxEfectivo.Controls.Add(this.txtAbono);
            this.gbxEfectivo.Controls.Add(this.lblAbono);
            this.gbxEfectivo.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbxEfectivo.Location = new System.Drawing.Point(25, 44);
            this.gbxEfectivo.Name = "gbxEfectivo";
            this.gbxEfectivo.Size = new System.Drawing.Size(276, 201);
            this.gbxEfectivo.TabIndex = 0;
            this.gbxEfectivo.TabStop = false;
            this.gbxEfectivo.Text = "Efectivo";
            // 
            // txtCambio
            // 
            this.txtCambio.Enabled = false;
            this.txtCambio.Font = new System.Drawing.Font("Century Gothic", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCambio.Location = new System.Drawing.Point(27, 133);
            this.txtCambio.Name = "txtCambio";
            this.txtCambio.ReadOnly = true;
            this.txtCambio.Size = new System.Drawing.Size(215, 37);
            this.txtCambio.TabIndex = 3;
            // 
            // lblCambio
            // 
            this.lblCambio.AutoSize = true;
            this.lblCambio.Font = new System.Drawing.Font("Century Gothic", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCambio.Location = new System.Drawing.Point(64, 102);
            this.lblCambio.Name = "lblCambio";
            this.lblCambio.Size = new System.Drawing.Size(141, 28);
            this.lblCambio.TabIndex = 55;
            this.lblCambio.Text = "Cambio $ :";
            // 
            // txtAbono
            // 
            this.txtAbono.Font = new System.Drawing.Font("Century Gothic", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAbono.Location = new System.Drawing.Point(27, 56);
            this.txtAbono.Name = "txtAbono";
            this.txtAbono.Size = new System.Drawing.Size(215, 37);
            this.txtAbono.TabIndex = 2;
            this.txtAbono.TextChanged += new System.EventHandler(this.txtAbono_TextChanged);
            this.txtAbono.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtAbono_KeyDown);
            this.txtAbono.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtAbono_KeyPress);
            // 
            // lblAbono
            // 
            this.lblAbono.AutoSize = true;
            this.lblAbono.Font = new System.Drawing.Font("Century Gothic", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAbono.Location = new System.Drawing.Point(46, 25);
            this.lblAbono.Name = "lblAbono";
            this.lblAbono.Size = new System.Drawing.Size(176, 28);
            this.lblAbono.TabIndex = 53;
            this.lblAbono.Text = "Abona con $ :";
            // 
            // tabTarjeta
            // 
            this.tabTarjeta.Alignment = System.Windows.Forms.TabAlignment.Right;
            this.tabTarjeta.Controls.Add(this.tbEfectivo);
            this.tabTarjeta.Controls.Add(this.tbTarjeta);
            this.tabTarjeta.Font = new System.Drawing.Font("Century", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabTarjeta.Location = new System.Drawing.Point(23, 30);
            this.tabTarjeta.Multiline = true;
            this.tabTarjeta.Name = "tabTarjeta";
            this.tabTarjeta.SelectedIndex = 0;
            this.tabTarjeta.Size = new System.Drawing.Size(361, 278);
            this.tabTarjeta.SizeMode = System.Windows.Forms.TabSizeMode.Fixed;
            this.tabTarjeta.TabIndex = 1;
            // 
            // tbTarjeta
            // 
            this.tbTarjeta.BackColor = System.Drawing.Color.NavajoWhite;
            this.tbTarjeta.Controls.Add(this.gbxTarjeta);
            this.tbTarjeta.Location = new System.Drawing.Point(4, 4);
            this.tbTarjeta.Name = "tbTarjeta";
            this.tbTarjeta.Padding = new System.Windows.Forms.Padding(3);
            this.tbTarjeta.Size = new System.Drawing.Size(328, 270);
            this.tbTarjeta.TabIndex = 1;
            this.tbTarjeta.Text = "DEBITO";
            // 
            // gbxTarjeta
            // 
            this.gbxTarjeta.Controls.Add(this.cbxTarjeta);
            this.gbxTarjeta.Controls.Add(this.lblTarjeta);
            this.gbxTarjeta.Controls.Add(this.textBox2);
            this.gbxTarjeta.Controls.Add(this.label2);
            this.gbxTarjeta.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbxTarjeta.Location = new System.Drawing.Point(23, 15);
            this.gbxTarjeta.Name = "gbxTarjeta";
            this.gbxTarjeta.Size = new System.Drawing.Size(286, 236);
            this.gbxTarjeta.TabIndex = 1;
            this.gbxTarjeta.TabStop = false;
            this.gbxTarjeta.Text = "Tarjeta";
            // 
            // cbxTarjeta
            // 
            this.cbxTarjeta.Font = new System.Drawing.Font("Century Gothic", 15F);
            this.cbxTarjeta.FormattingEnabled = true;
            this.cbxTarjeta.Location = new System.Drawing.Point(27, 121);
            this.cbxTarjeta.Name = "cbxTarjeta";
            this.cbxTarjeta.Size = new System.Drawing.Size(215, 31);
            this.cbxTarjeta.TabIndex = 56;
            // 
            // lblTarjeta
            // 
            this.lblTarjeta.AutoSize = true;
            this.lblTarjeta.Font = new System.Drawing.Font("Century Gothic", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTarjeta.Location = new System.Drawing.Point(79, 90);
            this.lblTarjeta.Name = "lblTarjeta";
            this.lblTarjeta.Size = new System.Drawing.Size(104, 28);
            this.lblTarjeta.TabIndex = 55;
            this.lblTarjeta.Text = "Tarjeta :";
            // 
            // textBox2
            // 
            this.textBox2.Font = new System.Drawing.Font("Century Gothic", 15F);
            this.textBox2.Location = new System.Drawing.Point(27, 52);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(215, 32);
            this.textBox2.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Century Gothic", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(46, 21);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(176, 28);
            this.label2.TabIndex = 53;
            this.label2.Text = "Abona con $ :";
            // 
            // FrmGuardarVenta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(720, 386);
            this.Controls.Add(this.txtTotalAPagar);
            this.Controls.Add(this.lblTotalAPagar);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.lblPrecioEfectivo);
            this.Controls.Add(this.lblEfectivo);
            this.Controls.Add(this.tabTarjeta);
            this.Controls.Add(this.btnGuardar);
            this.KeyPreview = true;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FrmGuardarVenta";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Guardar Venta";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmGuardarVenta_FormClosing);
            this.Load += new System.EventHandler(this.FrmGuardarVenta_Load);
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.FrmGuardarVenta_KeyDown);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.tbEfectivo.ResumeLayout(false);
            this.gbxEfectivo.ResumeLayout(false);
            this.gbxEfectivo.PerformLayout();
            this.tabTarjeta.ResumeLayout(false);
            this.tbTarjeta.ResumeLayout(false);
            this.gbxTarjeta.ResumeLayout(false);
            this.gbxTarjeta.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Label lblTotal;
        private System.Windows.Forms.Label lblEfectivo;
        private System.Windows.Forms.Label lblPrecioEfectivo;
        private System.Windows.Forms.Label lblPrecioTotal;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblTotalAPagar;
        private System.Windows.Forms.TextBox txtTotalAPagar;
        private System.Windows.Forms.TabPage tbEfectivo;
        private System.Windows.Forms.GroupBox gbxEfectivo;
        private System.Windows.Forms.TextBox txtCambio;
        private System.Windows.Forms.Label lblCambio;
        private System.Windows.Forms.TextBox txtAbono;
        private System.Windows.Forms.Label lblAbono;
        private System.Windows.Forms.TabControl tabTarjeta;
        private System.Windows.Forms.TabPage tbTarjeta;
        private System.Windows.Forms.GroupBox gbxTarjeta;
        private System.Windows.Forms.ComboBox cbxTarjeta;
        private System.Windows.Forms.Label lblTarjeta;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label2;
    }
}