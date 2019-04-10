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
    public partial class FrmAperturacaja : Form
    {
        private DateTimePicker  fecha;
        public FrmAperturacaja()
        {
            InitializeComponent();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            fecha = new DateTimePicker();
            string varfecha = fecha.Text;
            Negociocaja.insertarmovcaja(9100001, Convert.ToSingle ( txtImporte.Text) ,
                 0, fecha.Value.ToString ("dd/MM/yyyy"), "usuario", 1, "mañana",
                "APERTURA DE CAJA", 0, true);
            this.Close();

        }

        private void FrmAperturacaja_Load(object sender, EventArgs e)
        {
            
           // lblTotalPagar.Text = fecha.ToShortDateString(); 
            label5.Text = Convert.ToString(DateTime.Now.Hour) + ":" + Convert.ToString(DateTime.Now.Minute); 
            llenarComboBox();
        }

        private void llenarComboBox()
        {

            this.cbCajero.DataSource = NegocioUsuario.mostrarusuario ();


            //valor real de la DB
            this.cbCajero.ValueMember = "idusuario";
            //lo que se muestra
            this.cbCajero.DisplayMember = "usuario";

        }
    }
}
