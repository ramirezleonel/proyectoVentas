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
    public partial class FrmDetalleVentas : Form
    {
        public FrmDetalleVentas()
        {
            InitializeComponent();
        }
        public FrmDetalleVentas(string codigoVenta,string razon_social,string fecha,string tipo_comprobante,string estado,string total)
        {
            InitializeComponent();
            txtCodigo.Text = codigoVenta;
            txtEstado.Text = estado;
            txtTipoComprobante.Text = tipo_comprobante;
            txtRazonSocial.Text = razon_social;
            txtFechaVenta.Text = fecha;
            txtTotal.Text = total;
        }

        private void btnPagarMovimiento_Click(object sender, EventArgs e)
        {
           string mensaje= NegocioVenta.cambiarEstadoFacturacion(Convert.ToInt32(txtCodigo.Text), 'F');

           if (mensaje.Equals("ok"))
           {
               UtilityFrm.mensajeConfirm("La facturación se realizó Correctamente");
           }
           else {
               UtilityFrm.mensajeError(mensaje);
           }
            
        }
    }
}
