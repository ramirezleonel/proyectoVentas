using Capa_negocio;
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
    public partial class FrmListadoVentas : Form
    {
        public FrmListadoVentas()
        {
            InitializeComponent();
        }

        private void FrmListadoVentas_Load(object sender, EventArgs e)
        {
            this.mostrar();
            this.actualizarTotal();
            this.mensajesDeAyuda();
        }
        //mensajes de ayuda
        private void mensajesDeAyuda()
        {

            //mensaje de ayuda en el textbox total
            this.ttMensajeAyuda.SetToolTip(this.txtTotal, "Total de ventas");
            //mensaje de ayuda en el textbox buscar
            this.ttMensajeAyuda.SetToolTip(this.btnBuscar, "Buscar por fecha seleccionada");
            //mensaje de ayuda del boton listar ventas
            this.ttMensajeAyuda.SetToolTip(this.btnTodos, "Listar todas las ventas");
         
        }

        public void mostrar()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable ventas = NegocioVenta.Mostrar();
                foreach (DataRow venta in ventas.Rows)
                {

                    string estado = venta["estado"].ToString();
                    if (estado.Equals("F"))
                    {
                        estado = "FACTURADO";

                    }
                    else if(estado.Equals("P")){
                        estado = "PENDIENTE";
                    }


                    //string tipo_comprobante = venta["tipo_comprobante"].ToString();
                    //tipo_comprobante = tipo_comprobante == "V" ? "VENTA" : "";
                    dataLista.Rows.Add(venta["idventa"], venta["razon_social"], venta["fecha"], venta["tipo_comprobante"], venta["serie"], venta["correlativo"], venta["total"],estado);
                    //
                } 

                //this.dataLista.Columns["precio"].DefaultCellStyle.Format = "c3";
                //this.dataLista.Columns["precio"].ValueType = Type.GetType("System.Decimal");
                //this.dataLista.Columns["precio"].DefaultCellStyle.Format = String.Format("###,##0.00");

            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("error con la Base de datos: " + ex.Message);
            }
            //datasource el origen de los datos,muestra las categorias en la grilla




        }

        public void actualizarTotal() {
            decimal totalVendido= Convert.ToDecimal("0,00");
            
            if (dataLista.Rows.Count > 0)
            {
                foreach (DataGridViewRow venta in dataLista.Rows)
                {
                    totalVendido = totalVendido+ decimal.Round( Convert.ToDecimal( venta.Cells["Total"].Value),2);
                }
                txtTotal.Text = totalVendido.ToString();
            }
            else {

                txtTotal.Text = "0,00";
            }
        }
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.buscarPorFecha();
            this.actualizarTotal();
        }

        /*Metodos propios*/
        public void buscarPorFecha()
        {
            dataLista.Rows.Clear();
            try
            {
                DataTable dt = NegocioVenta.BuscarFechas(dtpFechaIni.Value.ToString("dd/MM/yyyy"), dtpFechaFin.Value.ToString("dd/MM/yyyy"));
                foreach (DataRow venta in dt.Rows)
                {
                     dataLista.Rows.Add(venta["idventa"], venta["razon_social"], venta["fecha"], venta["tipo_comprobante"], venta["serie"], venta["correlativo"], venta["total"]);
                }
       
            }

            catch (Exception ex)
            {
                UtilityFrm.mensajeError("Error Con Base de Datos :" + ex.Message);

            }
           
           

        }

        private void btnTodos_Click(object sender, EventArgs e)
        {
            this.mostrar();
        }

        private void dataLista_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataLista_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataLista.Rows.Count > 0)
            {
                DateTime date = Convert.ToDateTime(this.dataLista.CurrentRow.Cells["fecha"].Value);

                FrmDetalleVentas venta = new FrmDetalleVentas(Convert.ToString(this.dataLista.CurrentRow.Cells["codigo"].Value),
                    Convert.ToString(this.dataLista.CurrentRow.Cells["Razon_social"].Value),
                    date.ToShortDateString(),
                     Convert.ToString(this.dataLista.CurrentRow.Cells["tipo_comprobante"].Value),
                    Convert.ToString(this.dataLista.CurrentRow.Cells["estado"].Value),
                    Convert.ToString(Decimal.Round(Convert.ToDecimal(this.dataLista.CurrentRow.Cells["total"].Value), 2)));
                venta.ShowDialog();
            }
        }
    }
}
