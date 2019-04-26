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
    public partial class FrmAsignarValores : Form
    {
        private int cantidad = 0;
        private Decimal precio = Convert.ToDecimal("0,00");
        
        //getter y setter
        public int Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }
        public Decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }
        public FrmAsignarValores()
        {
            InitializeComponent();
        }
        public FrmAsignarValores(string label)
        {
            InitializeComponent();
            lblValor.Text = label;
        }
        private void txtValor_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtValor_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode==Keys.Enter){
                e.SuppressKeyPress = true;
                btnGuardar.Focus();
             
            }
        }

        private void txtValor_KeyPress(object sender, KeyPressEventArgs e)
        {
            UtilityFrm.NumDecTeclado(e, txtValor);
        }

        private void FrmAsignarValores_Load(object sender, EventArgs e)
        {
            
        }

        private void FrmAsignarValores_KeyDown(object sender, KeyEventArgs e)
        {
            //atajos del teclado
            if(e.KeyCode==Keys.Escape){
                this.Close();
            
            }else if(e.KeyCode==Keys.F2){
            //si se presiona la tecla F2 se guarda el valor
                btnGuardar.PerformClick();            
            }

            
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtValor.Text.Length == 0 || txtValor.Text == "0")
            {

                UtilityFrm.mensajeError("Valor ingresado incorrecto, verifique el valor ingresado y vuelva a intentarlo");

            }
            else {
                try
                {
                    this.cantidad = Convert.ToInt32(txtValor.Text);
                    this.Close();
                }
                catch (Exception ex)
                {

                    UtilityFrm.mensajeError("El formato ingresado es incorrecto :"+ex.Message);
                }
               
            }
        }
    }
}
