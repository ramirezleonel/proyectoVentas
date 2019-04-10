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
using System.Data;
using System.Data.SqlClient;
namespace Capa_Presentacion
{
    public partial class FrmGuardarVenta : Form
    {
        private string trans;

        public string Trans
        {
            get { return trans; }
            set { trans = value; }
        }
        private int idCliente;
        private DataGridView listadoDeProducto;
        private bool isCerro = false;
        private decimal totalAPagar = 0;
        public bool IsCerro
        {
            get { return isCerro; }
            set { isCerro = value; }
        }
        public DataGridView ListadoDeProducto
        {
            get { return listadoDeProducto; }
            set { listadoDeProducto = value; }
        }
        public FrmGuardarVenta(decimal totalAPagar)
        {
           
            InitializeComponent();
            this.totalAPagar = decimal.Round(totalAPagar, 2);
            txtTotalAPagar.Text = Convert.ToString(totalAPagar);
            
           
        }

        private void txtAbono_KeyDown(object sender, KeyEventArgs e)
        {
            decimal totalPagar=0;
            decimal abono = 0;
            decimal cambio = 0;
            if (e.KeyCode == Keys.Enter)
            {
                e.Handled = false;
                e.SuppressKeyPress = true;
                btnGuardar.Focus();
                try
                {
                    if (!txtAbono.Text.Contains(","))
                    {
                        txtAbono.Text += ",00";
                    }
                    totalPagar = Convert.ToDecimal(txtTotalAPagar.Text);
                    abono = Convert.ToDecimal(txtAbono.Text);
                    cambio = abono - (totalPagar);
                    //si el cambio es positivo lo agrego o sino muestro un msj
                    if (cambio >= 0 || abono >= totalPagar)
                    {
                        txtCambio.Text = cambio.ToString();
                        lblPrecioEfectivo.Text = Convert.ToString(abono - cambio);
                        lblPrecioTotal.Text = lblPrecioEfectivo.Text;
                    }
                    else
                    {
                        UtilityFrm.mensajeError("El valor ingresado es Incorrecto");
                        txtAbono.Text = "0,0";
                        txtAbono.Focus();
                    }

                }
                catch (Exception ex)
                {
                     UtilityFrm.mensajeError("El valor ingresado es Incorrecto ,"+ex.Message);
                     UtilityFrm.limpiarTextbox(txtCambio,txtAbono);
                }
              


                
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {

            NegocioVenta objventa = new NegocioVenta();
            DataTable dt = new DataTable();
            dt.Columns.Add("Codigo", typeof(string));
            dt.Columns.Add("Precio", typeof(decimal));
            dt.Columns.Add("Descuento", typeof(decimal));
            dt.Columns.Add("Importe", typeof(decimal));
            dt.Columns.Add("Cantidad", typeof(string));
            dt.Columns.Add("Subtotal", typeof(string));


            foreach (DataGridViewRow fila in listadoDeProducto.Rows)
            {


                dt.Rows.Add(fila.Cells[0].Value, fila.Cells[2].Value, fila.Cells[3].Value, fila.Cells[4].Value, fila.Cells[5].Value, fila.Cells[6].Value);

                
               
            }


            if (MessageBox.Show("Desea Imprimir Venta?", "Imprimir"
               , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
            {
                FrmImpVenta venta = new FrmImpVenta(totalAPagar);
                venta.Show();
            }
            else {
                this.Close();
            }
            

           // string Rta = NegocioVenta.Insertar(1, DateTime.Today , "TICKET", "", "", 0, dt,objventa );
            
            //if (Rta == "OK")
            //{
            //   Rta = Negociocaja.insertarmovcaja(4110107, Convert.ToSingle(txtTotalAPagar.Text), 0, Convert.ToString(DateTime.Today), "usuario", 1, "mañana", "Venta nro : " +  objventa.Idventa.ToString (), objventa.Idventa, true);

            //   if (Rta == "ok")
            //   {
            //       trans = Rta;
            //       this.Close();
            //   }
    
            //}

           // if (MessageBox.Show("Desea Imprimir Ticket?", "Imprimir"
           //     , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
           // {
                //try
                //{
                    //if (listadoDeProducto.Rows.Count > 0) {
                    //  FiscalPrinterLib.HASAR hasar = new FiscalPrinterLib.HASAR();
                    // hasar.AutodetectarControlador(1);

                    //hasar.AbrirComprobanteFiscal(FiscalPrinterLib.DocumentosFiscales.TICKET_C);
                    //      foreach (DataGridViewRow fila in listadoDeProducto.Rows)
                    //    {
                    //      string producto = fila.Cells["producto"].Value.ToString();
                    //    double precio = Convert.ToDouble(fila.Cells["importe"].Value);
                    //   hasar.ImprimirItem(producto, 1, precio, 21, 0);

                    // }
                    //hasar.ImprimirItem("perro", 1, 100, 21, 0);
                    // hasar.AbrirCajonDeDinero();
                    //para dar el vuelto
                    //si el texto esta vacio asigno 0 sino el valor de la caja de texto
                    // double abono = txtAbono.Text == string.Empty ? 0 : Convert.ToDouble(txtAbono.Text);
                    //if(abono>0){
                    //hasar.ImprimirPago("pagos", abono);
                    //}

                    //hasar.CerrarComprobanteFiscal();
                    //hasar.Finalizar();
                    //this.Close();
                    //this.isCerro = false;

                    //}
                    //else {
                    //  UtilityFrm.mensajeError("No existe ningun articulo asignado");
                    //}

                    //}
                    //catch (Exception ex)
                    //{
                    //  UtilityFrm.mensajeError("Error en el Comprobante Fiscal,causa: "+ex.Message);

                    //}

                    //}
                    // else {

                    //     this.Close();
                    //     this.isCerro = false;
             //   }
            
        }

        private void txtAbono_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsDigit(e.KeyChar))
            {

                e.Handled = false;

            }
            else if (e.KeyChar == '.' && !txtAbono.Text.Contains(',')) {
                e.Handled = true;
                SendKeys.Send(",");
               
                
            }
            else if (e.KeyChar == ',' && !txtAbono.Text.Contains(','))
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

        private void FrmGuardarVenta_Load(object sender, EventArgs e)
        {
           //el foco se posa en abono
            txtAbono.Select();
            txtAbono.Focus();

        }

        private void FrmGuardarVenta_FormClosing(object sender, FormClosingEventArgs e)
        {
             isCerro=true;
        }

        private void txtAbono_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
