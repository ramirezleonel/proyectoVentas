namespace Capa_Presentacion
{
    partial class FrmCerrarCaja
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
            this.gbxCajas = new System.Windows.Forms.GroupBox();
            this.lblsaldoActual = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.BtnApertura = new System.Windows.Forms.Button();
            this.TxtConcepto = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.lblNomProducto = new System.Windows.Forms.Label();
            this.gbxCajas.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbxCajas
            // 
            this.gbxCajas.Controls.Add(this.lblsaldoActual);
            this.gbxCajas.Controls.Add(this.label4);
            this.gbxCajas.Controls.Add(this.BtnApertura);
            this.gbxCajas.Controls.Add(this.TxtConcepto);
            this.gbxCajas.Controls.Add(this.label2);
            this.gbxCajas.Controls.Add(this.label1);
            this.gbxCajas.Controls.Add(this.lblNomProducto);
            this.gbxCajas.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbxCajas.Location = new System.Drawing.Point(38, 31);
            this.gbxCajas.Name = "gbxCajas";
            this.gbxCajas.Size = new System.Drawing.Size(470, 189);
            this.gbxCajas.TabIndex = 0;
            this.gbxCajas.TabStop = false;
            this.gbxCajas.Text = "Caja";
            // 
            // lblsaldoActual
            // 
            this.lblsaldoActual.AutoSize = true;
            this.lblsaldoActual.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblsaldoActual.Location = new System.Drawing.Point(121, 99);
            this.lblsaldoActual.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblsaldoActual.Name = "lblsaldoActual";
            this.lblsaldoActual.Size = new System.Drawing.Size(55, 20);
            this.lblsaldoActual.TabIndex = 82;
            this.lblsaldoActual.Text = "Saldo";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(41, 99);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(81, 20);
            this.label4.TabIndex = 81;
            this.label4.Text = "Importe :";
            // 
            // BtnApertura
            // 
            this.BtnApertura.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BtnApertura.Location = new System.Drawing.Point(352, 132);
            this.BtnApertura.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.BtnApertura.Name = "BtnApertura";
            this.BtnApertura.Size = new System.Drawing.Size(108, 41);
            this.BtnApertura.TabIndex = 80;
            this.BtnApertura.Text = "Cerrar caja";
            this.BtnApertura.UseVisualStyleBackColor = true;
            // 
            // TxtConcepto
            // 
            this.TxtConcepto.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TxtConcepto.Location = new System.Drawing.Point(125, 60);
            this.TxtConcepto.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.TxtConcepto.MaxLength = 12;
            this.TxtConcepto.Name = "TxtConcepto";
            this.TxtConcepto.Size = new System.Drawing.Size(204, 26);
            this.TxtConcepto.TabIndex = 79;
            this.TxtConcepto.Text = "0";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(38, 63);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(84, 20);
            this.label2.TabIndex = 78;
            this.label2.Text = "Efectivo :";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(121, 27);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 20);
            this.label1.TabIndex = 77;
            this.label1.Text = "Saldo";
            // 
            // lblNomProducto
            // 
            this.lblNomProducto.AutoSize = true;
            this.lblNomProducto.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNomProducto.Location = new System.Drawing.Point(7, 27);
            this.lblNomProducto.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblNomProducto.Name = "lblNomProducto";
            this.lblNomProducto.Size = new System.Drawing.Size(115, 20);
            this.lblNomProducto.TabIndex = 76;
            this.lblNomProducto.Text = "Saldo inicial :";
            // 
            // FrmCerrarCaja
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::Capa_Presentacion.Properties.Resources.Transaction_48px;
            this.ClientSize = new System.Drawing.Size(536, 245);
            this.Controls.Add(this.gbxCajas);
            this.Name = "FrmCerrarCaja";
            this.Text = "Cierre de caja";
            this.Load += new System.EventHandler(this.FrmCerrarCaja_Load);
            this.gbxCajas.ResumeLayout(false);
            this.gbxCajas.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbxCajas;
        private System.Windows.Forms.Label lblsaldoActual;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button BtnApertura;
        private System.Windows.Forms.TextBox TxtConcepto;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblNomProducto;

    }
}