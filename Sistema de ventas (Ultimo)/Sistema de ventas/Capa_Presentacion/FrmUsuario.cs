using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Capa_Presentacion
{
    public partial class FrmUsuario : Form
    {
        public FrmUsuario()
        {
            InitializeComponent();
        }

        
        private void FrmUsuario_Load(object sender, EventArgs e)
        {

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            txtProducto.Enabled = true;
            txtContraseña.Enabled = true;
            txtConfirmar.Enabled = true;
            cbxRoles.Enabled=true;
            btnGuardar.Enabled = true;
            btnCancelar.Enabled = true;
            btnAgregar.Enabled = false;
            btnBuscar.Enabled=false;
            btnListar.Enabled=false;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            txtProducto.Enabled = false;
            txtContraseña.Enabled = false;
            txtConfirmar.Enabled = false;
            cbxRoles.Enabled = false;
            txtConfirmar.Enabled = false;

            btnGuardar.Enabled = false;
            btnCancelar.Enabled = false;
            btnAgregar.Enabled = true;
            btnBuscar.Enabled = true;
            btnListar.Enabled = true;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Desea Guardar?", "Guardar"
                  , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
            {

                btnGuardar.Enabled = false;
                btnCancelar.Enabled = false;
                btnAgregar.Enabled = true;
                btnBuscar.Enabled = true;
                btnListar.Enabled = true;

            }
        }
    }
}
