using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Capa_negocio;

namespace Capa_Presentacion
{
    public partial class FrmCerrarCaja : Form
    {
        
        public FrmCerrarCaja()
        {
            InitializeComponent();
        }

        private void BtnApertura_Click(object sender, EventArgs e)
        {
            Negociocaja objcaja = new Negociocaja();
            objcaja.extrestadocaja(1, "");
            float importe = 0 ;
            if (TxtConcepto.Text == "" || TxtConcepto.Text == "0")
            {
                MessageBox.Show("ingrese un importe para continuar");

            }
            else
            {
                importe = Convert.ToSingle( TxtConcepto.Text ) -  Convert.ToSingle(label3.Text) ;

                if (importe < 0)
                {
                    Negociocaja.insertarmovcaja(9100003, 0, (importe * -1) , objcaja.Fecha, "usuario", 1, "mañana", "FALTANTE DE CAJA", 0, true );
                }

                else if (importe > 0)  
                {
                    Negociocaja.insertarmovcaja(9100004, 0, importe, objcaja.Fecha, "usuario", 1, "mañana", "SOBRANTE DE CAJA", 0, true);
                }
               
                    Negociocaja.insertarmovcaja(9100002, 0, 0, objcaja.Fecha, "usuario", 1, "mañana", "CIERRE DE CAJA", 0, true);
                
                
                //Negociocaja.insertarmovcaja (    
          
            }
            this.Close();

        }

        private void FrmCerrarCaja_Load(object sender, EventArgs e)
        {
            Negociocaja objcaja = new Negociocaja();
            objcaja.extrestadocaja(1, "");
            objcaja.extrestadocaja(2, objcaja.Fecha);
            label3.Text = Convert.ToString(objcaja.Ingreso -  objcaja.Egreso);
        }
    }
}
