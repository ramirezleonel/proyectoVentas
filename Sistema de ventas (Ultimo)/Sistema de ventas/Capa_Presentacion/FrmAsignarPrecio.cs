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
    public partial class FrmAsignarPrecio : Form
    {
        private string producto;
        private float  precio;
        private bool isCerro = false;

        private float  descuento;

        public FrmAsignarPrecio()
        {
            InitializeComponent();
        }

        public FrmAsignarPrecio(string producto)
        {
            this.producto = producto;

            InitializeComponent();
            txtNombreProducto.Text = this.Producto;
        }

       
        private void btnGuardar_Click(object sender, EventArgs e)
        {
            Precio = Convert.ToSingle (txtPrecio.Text);
            Descuento = Convert.ToSingle (txtDescuento.Text);
            if (txtPrecio.Text == string.Empty || txtPrecio.Text == "0,00" || txtPrecio.Text == ",00" || txtPrecio.Text == ",0" || txtPrecio.Text == "0,0")
            {
                UtilityFrm.mensajeError("el precio no puede ser 0");
            }else{
            this.Close();
            this.isCerro = false;
            }
        }
        //propiedades
        public string Producto
        {
            get { return producto; }
            set { producto = value; }
        }
        public float  Precio
        {
            get { return precio; }
            set { precio = value; }
        }

        public float  Descuento
        {
            get { return descuento; }
            set { descuento = value; }
        }
        public bool IsCerro
        {
            get { return isCerro; }
            set { isCerro = value; }
        }
        private void txtPrecio_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                e.Handled = false;
                e.SuppressKeyPress = true;
                txtDescuento.Focus();
                if (txtPrecio.Text==string.Empty)
                {
                    txtPrecio.Text += "0,00";

                }
                if (!txtPrecio.Text.Contains(","))
                {
                    txtPrecio.Text += ",00";

                }
            }
        }

        private void txtDescuento_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                e.Handled = false;
                e.SuppressKeyPress = true;
                btnGuardar.Focus();

            }
        }

        private void txtPrecio_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtPrecio_KeyPress(object sender, KeyPressEventArgs e)
        {
            //solo valores numericos


            if (Char.IsDigit(e.KeyChar))
            {

                e.Handled = false;

            }
            else if (e.KeyChar == '.' && !txtPrecio.Text.Contains(','))
            {
                e.Handled = true;
                SendKeys.Send(",");


            }
            else if (e.KeyChar == ',' && !txtPrecio.Text.Contains(','))
            {

                e.Handled = false;
            }
            else if (Char.IsControl(e.KeyChar))
            {

                e.Handled = false;
            }

            else
            {
                e.Handled = true;

            }
        }

        private void txtDescuento_KeyPress(object sender, KeyPressEventArgs e)
        {
            //solo valores numericos


            if (Char.IsDigit(e.KeyChar))
            {

                e.Handled = false;

            }
            else if (e.KeyChar == '.' && !txtDescuento.Text.Contains(','))
            {
                e.Handled = true;
                SendKeys.Send(",");


            }
            else if (e.KeyChar == ',' && !txtDescuento.Text.Contains(','))
            {

                e.Handled = false;
            }
            else if (Char.IsControl(e.KeyChar))
            {

                e.Handled = false;
            }

            else
            {
                e.Handled = true;

            }
        }

        private void txtPrecio_Leave(object sender, EventArgs e)
        {
            if (txtPrecio.Text==string.Empty)
            {
                txtPrecio.Text += "0,00";

            }else if (!txtPrecio.Text.Contains(","))
            {
                txtPrecio.Text += ",00";

            }
        }

     

        private void FrmAsignarPrecio_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.isCerro = true;
        }

        private void FrmAsignarPrecio_Load(object sender, EventArgs e)
        {

        }
    }
}
