namespace Capa_Presentacion
{
    partial class FrmConfig
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
            this.gbxTareas = new System.Windows.Forms.GroupBox();
            this.cbxCondicionFrenteIVA = new System.Windows.Forms.ComboBox();
            this.lblCondicion_frenteIva = new System.Windows.Forms.Label();
            this.txtCuit = new System.Windows.Forms.TextBox();
            this.lblCuit = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtRazonSocial = new System.Windows.Forms.TextBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.btnEliminarLogo = new System.Windows.Forms.Button();
            this.pbxLogo = new System.Windows.Forms.PictureBox();
            this.btnEditar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnAgregarImagen = new System.Windows.Forms.Button();
            this.gbxTareas.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbxLogo)).BeginInit();
            this.SuspendLayout();
            // 
            // gbxTareas
            // 
            this.gbxTareas.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.gbxTareas.Controls.Add(this.btnEliminarLogo);
            this.gbxTareas.Controls.Add(this.pbxLogo);
            this.gbxTareas.Controls.Add(this.btnEditar);
            this.gbxTareas.Controls.Add(this.btnCancelar);
            this.gbxTareas.Controls.Add(this.btnGuardar);
            this.gbxTareas.Controls.Add(this.cbxCondicionFrenteIVA);
            this.gbxTareas.Controls.Add(this.lblCondicion_frenteIva);
            this.gbxTareas.Controls.Add(this.txtCuit);
            this.gbxTareas.Controls.Add(this.lblCuit);
            this.gbxTareas.Controls.Add(this.btnAgregarImagen);
            this.gbxTareas.Controls.Add(this.label2);
            this.gbxTareas.Controls.Add(this.txtRazonSocial);
            this.gbxTareas.Controls.Add(this.lblNombre);
            this.gbxTareas.Location = new System.Drawing.Point(12, 29);
            this.gbxTareas.Name = "gbxTareas";
            this.gbxTareas.Size = new System.Drawing.Size(600, 486);
            this.gbxTareas.TabIndex = 35;
            this.gbxTareas.TabStop = false;
            this.gbxTareas.Text = "Datos de Empresa";
            // 
            // cbxCondicionFrenteIVA
            // 
            this.cbxCondicionFrenteIVA.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.cbxCondicionFrenteIVA.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxCondicionFrenteIVA.Enabled = false;
            this.cbxCondicionFrenteIVA.FormattingEnabled = true;
            this.cbxCondicionFrenteIVA.Items.AddRange(new object[] {
            "IVA Responsable Inscripto",
            "IVA Responsable no Inscripto",
            "IVA no Responsable",
            "IVA Sujeto Exento",
            "Consumidor Final",
            "Responsable Monotributo",
            "Sujeto no Categorizado",
            "Proveedor del Exterior",
            "Cliente del Exterior",
            "IVA Liberado – Ley Nº 19.640",
            "IVA Responsable Inscripto – Agente de Percepción",
            "Pequeño Contribuyente Eventual",
            "Monotributista Social",
            "Pequeño Contribuyente Eventual Social"});
            this.cbxCondicionFrenteIVA.Location = new System.Drawing.Point(215, 165);
            this.cbxCondicionFrenteIVA.Name = "cbxCondicionFrenteIVA";
            this.cbxCondicionFrenteIVA.Size = new System.Drawing.Size(243, 28);
            this.cbxCondicionFrenteIVA.TabIndex = 56;
            // 
            // lblCondicion_frenteIva
            // 
            this.lblCondicion_frenteIva.AutoSize = true;
            this.lblCondicion_frenteIva.Location = new System.Drawing.Point(32, 165);
            this.lblCondicion_frenteIva.Name = "lblCondicion_frenteIva";
            this.lblCondicion_frenteIva.Size = new System.Drawing.Size(177, 20);
            this.lblCondicion_frenteIva.TabIndex = 55;
            this.lblCondicion_frenteIva.Text = "Condicion Frente al IVA";
            // 
            // txtCuit
            // 
            this.txtCuit.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtCuit.Location = new System.Drawing.Point(215, 112);
            this.txtCuit.MaxLength = 13;
            this.txtCuit.Name = "txtCuit";
            this.txtCuit.ReadOnly = true;
            this.txtCuit.Size = new System.Drawing.Size(249, 26);
            this.txtCuit.TabIndex = 55;
            // 
            // lblCuit
            // 
            this.lblCuit.AutoSize = true;
            this.lblCuit.Location = new System.Drawing.Point(163, 112);
            this.lblCuit.Name = "lblCuit";
            this.lblCuit.Size = new System.Drawing.Size(46, 20);
            this.lblCuit.TabIndex = 56;
            this.lblCuit.Text = "CUIT";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(164, 220);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(45, 20);
            this.label2.TabIndex = 52;
            this.label2.Text = "Logo";
            // 
            // txtRazonSocial
            // 
            this.txtRazonSocial.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtRazonSocial.Location = new System.Drawing.Point(215, 59);
            this.txtRazonSocial.Name = "txtRazonSocial";
            this.txtRazonSocial.ReadOnly = true;
            this.txtRazonSocial.Size = new System.Drawing.Size(280, 26);
            this.txtRazonSocial.TabIndex = 46;
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.Location = new System.Drawing.Point(109, 59);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(100, 20);
            this.lblNombre.TabIndex = 47;
            this.lblNombre.Text = "Razon social";
            // 
            // btnEliminarLogo
            // 
            this.btnEliminarLogo.BackgroundImage = global::Capa_Presentacion.Properties.Resources.Remove_Image_20px;
            this.btnEliminarLogo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnEliminarLogo.Location = new System.Drawing.Point(255, 306);
            this.btnEliminarLogo.Name = "btnEliminarLogo";
            this.btnEliminarLogo.Size = new System.Drawing.Size(30, 28);
            this.btnEliminarLogo.TabIndex = 64;
            this.btnEliminarLogo.UseVisualStyleBackColor = true;
            this.btnEliminarLogo.Click += new System.EventHandler(this.btnEliminarLogo_Click);
            // 
            // pbxLogo
            // 
            this.pbxLogo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pbxLogo.Location = new System.Drawing.Point(215, 220);
            this.pbxLogo.Name = "pbxLogo";
            this.pbxLogo.Size = new System.Drawing.Size(80, 80);
            this.pbxLogo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbxLogo.TabIndex = 63;
            this.pbxLogo.TabStop = false;
            // 
            // btnEditar
            // 
            this.btnEditar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEditar.Image = global::Capa_Presentacion.Properties.Resources.Edit_Property_20px;
            this.btnEditar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnEditar.Location = new System.Drawing.Point(279, 428);
            this.btnEditar.Name = "btnEditar";
            this.btnEditar.Size = new System.Drawing.Size(97, 38);
            this.btnEditar.TabIndex = 62;
            this.btnEditar.Text = "Modificar";
            this.btnEditar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnEditar.UseVisualStyleBackColor = true;
            this.btnEditar.Click += new System.EventHandler(this.btnEditar_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCancelar.Image = global::Capa_Presentacion.Properties.Resources.Delete_File_20px;
            this.btnCancelar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnCancelar.Location = new System.Drawing.Point(485, 428);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(97, 38);
            this.btnCancelar.TabIndex = 60;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnCancelar.UseVisualStyleBackColor = true;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // btnGuardar
            // 
            this.btnGuardar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnGuardar.Image = global::Capa_Presentacion.Properties.Resources.Save_20px;
            this.btnGuardar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnGuardar.Location = new System.Drawing.Point(382, 428);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(97, 38);
            this.btnGuardar.TabIndex = 59;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnGuardar.UseVisualStyleBackColor = true;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            // 
            // btnAgregarImagen
            // 
            this.btnAgregarImagen.BackgroundImage = global::Capa_Presentacion.Properties.Resources.Add_Image_20px;
            this.btnAgregarImagen.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnAgregarImagen.Location = new System.Drawing.Point(219, 306);
            this.btnAgregarImagen.Name = "btnAgregarImagen";
            this.btnAgregarImagen.Size = new System.Drawing.Size(30, 28);
            this.btnAgregarImagen.TabIndex = 48;
            this.btnAgregarImagen.UseVisualStyleBackColor = true;
            this.btnAgregarImagen.Click += new System.EventHandler(this.btnAgregarImagen_Click);
            // 
            // FrmConfig
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(624, 546);
            this.Controls.Add(this.gbxTareas);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "FrmConfig";
            this.Text = "FrmConfig";
            this.Load += new System.EventHandler(this.FrmConfig_Load);
            this.gbxTareas.ResumeLayout(false);
            this.gbxTareas.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbxLogo)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbxTareas;
        private System.Windows.Forms.ComboBox cbxCondicionFrenteIVA;
        private System.Windows.Forms.Label lblCondicion_frenteIva;
        private System.Windows.Forms.TextBox txtCuit;
        private System.Windows.Forms.Label lblCuit;
        private System.Windows.Forms.Button btnAgregarImagen;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtRazonSocial;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Button btnEditar;
        private System.Windows.Forms.Button btnEliminarLogo;
        private System.Windows.Forms.PictureBox pbxLogo;

    }
}