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
    public partial class FrmBusquedaAvaArticulo : Form
    {
        private string nombreProducto;
        private int idProducto;
        private int stockActual;
        private decimal precio;
        
        private bool isCerro=false;

      
        public FrmBusquedaAvaArticulo()
        {
            InitializeComponent();
        }

        private void FrmBusquedaAvaArticulo_Load(object sender, EventArgs e)
        {
            this.mostrar();
        }
        /*Metodos Propios*/
        public void mostrar()
        {
            try
            {
                this.dataLista.DataSource = NegocioArticulo.mostrar();
                //this.dataLista.Columns["precio"].DefaultCellStyle.Format = "c3";
                //this.dataLista.Columns["precio"].ValueType = Type.GetType("System.Decimal");
                //this.dataLista.Columns["precio"].DefaultCellStyle.Format = String.Format("###,##0.00");
                this.dataLista.Columns["precio"].DefaultCellStyle.Format = String.Format("$###,##0.00");
                this.dataLista.Columns[0].Width = 150;
                this.dataLista.Columns[1].Width = 250;
                this.dataLista.Columns[2].Width = 250;
                this.dataLista.Columns[3].Width = 150;
                this.dataLista.Columns[4].Width = 150;
                this.dataLista.Columns[5].Width = 150;
                this.dataLista.Columns[6].Width = 188;
            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("error con la Base de datos: " + ex.Message);
            }

            //muestro el total de las categorias
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataLista.RowCount);
        }

        private void dataLista_DoubleClick(object sender, EventArgs e)
        {
            this.idProducto = Convert.ToInt32(this.dataLista.CurrentRow.Cells["idarticulo"].Value);
            this.nombreProducto = Convert.ToString(this.dataLista.CurrentRow.Cells["nombre"].Value);
            
            //convierte primero object a string y luego en float
            this.precio = decimal.Round(Convert.ToDecimal(this.dataLista.CurrentRow.Cells["precio"].Value), 2);
            //this.precio = double.Parse(Convert.ToString(this.dataLista.CurrentRow.Cells["precio"].Value));
            this.stockActual = Convert.ToInt32(this.dataLista.CurrentRow.Cells["stock_actual"].Value);
            this.Close();
            this.isCerro = false;
        }

        //Propiedades
        public string NombreProducto
        {
            get { return nombreProducto; }
            set { nombreProducto = value; }
        }
        public int IdProducto
        {
            get { return idProducto; }
            set { idProducto = value; }
        }
        public int StockActual
        {
            get { return stockActual; }
            set { stockActual = value; }
        }
        public decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }
        public bool IsCerro
        {
            get { return isCerro; }
            set { isCerro = value; }
        }
        private void FrmBusquedaAvaArticulo_FormClosing(object sender, FormClosingEventArgs e)
        {
            isCerro = true;
        }

        private void dataLista_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode==Keys.Enter){
                this.idProducto = Convert.ToInt32(this.dataLista.CurrentRow.Cells["idarticulo"].Value);
                this.nombreProducto = Convert.ToString(this.dataLista.CurrentRow.Cells["nombre"].Value);

                //convierte primero object a string y luego en float
                this.precio = decimal.Round(Convert.ToDecimal(this.dataLista.CurrentRow.Cells["precio"].Value));
                //this.precio = double.Parse(Convert.ToString(this.dataLista.CurrentRow.Cells["precio"].Value));
                this.stockActual = Convert.ToInt32(this.dataLista.CurrentRow.Cells["stock_actual"].Value);
                this.Close();
                this.isCerro = false;
            
            }
            
        }

        private void FrmBusquedaAvaArticulo_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode==Keys.Escape){
                this.Close();
                
            }
        }
    }
}
