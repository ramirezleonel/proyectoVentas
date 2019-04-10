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
    public partial class FrmDetallesDeStock : Form
    {
        
        public FrmDetallesDeStock(string codigoMov,string fecha,string movimiento,string estado,string total)
        {
            InitializeComponent();
            txtCodigo.Text = codigoMov;
            txtFechaMov.Text = fecha;
            txtMovimiento.Text = movimiento;
            txtEstado.Text = estado;
            txtTotal.Text = total;

        }
        
        public FrmDetallesDeStock()
        {
            InitializeComponent();
        }
        public void mostrar() {
            try
            {
                dataLista.Rows.Clear();
                DataTable productos = NegocioMovStock.mostrarDetalleMovStock(Convert.ToInt32(txtCodigo.Text));
                foreach (DataRow producto in productos.Rows)
                {


                    dataLista.Rows.Add(producto["idarticulo"], producto["Nombre del Producto"], producto["PrecioCompra"], producto["cantidad"], producto["subTotal"]);
                }

                //this.dataLista.Columns["precio"].DefaultCellStyle.Format = "c3";
                //this.dataLista.Columns["precio"].ValueType = Type.GetType("System.Decimal");
                this.dataLista.Columns["precioCompra"].DefaultCellStyle.Format = String.Format("###,##0.00");
                this.dataLista.Columns["subtotal"].DefaultCellStyle.Format = String.Format("###,##0.00");

            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("error con la Base de datos: " + ex.Message);
            }
            //datasource el origen de los datos,muestra las categorias en la grilla



        }
        private void dataLista_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void FrmDetallesDeStock_Load(object sender, EventArgs e)
        {
            this.mostrar();
        }
    }
}
