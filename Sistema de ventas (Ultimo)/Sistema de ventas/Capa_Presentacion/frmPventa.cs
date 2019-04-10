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
using System.Diagnostics;

namespace Capa_Presentacion
{
    public partial class frmPventa : Form
    {
        
        public NegocioArticulo objnart = new NegocioArticulo();
        
        public frmPventa()
        {
            InitializeComponent();
        }

     
          public void Buscar_Cliente(int codCliente)
        {
            if (codCliente>0)
            {
               DataTable dt= NegocioCliente.buscarCodigoCliente(codCliente.ToString());
               if (dt.Rows.Count!=0)
               {
                   DataRow row = dt.Rows[0];
                   string cliente = row["razon_social"].ToString();
                  
                   
                   UtilityFrm.mensajeConfirm("Se encontro el Cliente " + cliente);
                   txtRazonSocial.Text = cliente;
                  
                   if(row["idcliente"].ToString()=="1"){
                       //si es consumidor final nota de ventas
                   cbTipoComprobante.SelectedIndex = 1;
                   btnNuevo.Enabled = true;
                   }

               }
               else
               {
                   UtilityFrm.mensajeError("Error No se ha encontrado el Cliente");
                   clienteIncorrecto();
                   btnCliente.Focus();
               }
               
            }
            else
            {
                UtilityFrm.mensajeError("Error No se ha encontrado el Cliente");
                clienteIncorrecto();
                btnCliente.Focus();

            }
          }
          public void agregar_producto(int codproducto, float  precioProducto,float  descuentoProducto)
          {
              int cantidadProducto=1;
              objnart.extraerdatos(codproducto, "poridarticulo");

              TxtDetalle.Text = objnart.Nombre;
              //asigno el valor del precio pasado en el formulario frmasignarPrecio
              TxtPrecio.Text = Convert.ToString(precioProducto);
              TxtCodigo.Text = Convert.ToString(objnart.IdArticulo);
              TxtDesc.Text = Convert.ToString(descuentoProducto);
              Totales();
              //lo multiplico por 1 para obtener el mismo valor
              float  totalPagar = Convert.ToSingle (txtTotalPagar.Text);
              totalPagar =  (cantidadProducto * precioProducto) + (totalPagar);
                  DGVenta.Rows.Add(TxtCodigo.Text, TxtDetalle.Text, TxtPrecio.Text, TxtDesc.Text, TxtSubtotal.Text,cantidadProducto.ToString(), Convert.ToString(Convert.ToSingle (TxtSubtotal.Text) * Convert.ToInt32(cantidadProducto)));

                  txtTotalPagar.Text = totalPagar.ToString() ;
              txtNombreProducto.Text = "";
              txtNombreProducto.Focus();
          }

          public void Buscar_producto(long codproducto, string tipo)
          {
              float  totalPagar = 0;
            
              float  precio;
              float  descuento;
              float  importe;
              float  total = 0;




              objnart.extraerdatos(codproducto, tipo);

              if (objnart.Sindatos == true)
              {



                  TxtDetalle.Text = objnart.Nombre;
                  TxtPrecio.Text = Convert.ToString(objnart.Precio);
                  TxtCodigo.Text = Convert.ToString(objnart.IdArticulo);
                  Totales();

                  bool encontrado = false;

                  foreach (DataGridViewRow row in DGVenta.Rows)
                  {

                      if (Convert.ToString(row.Cells["Codigo"].Value) == TxtCodigo.Text)
                      {


                          encontrado = true;

                          row.Cells["Descuento"].Value = TxtDesc.Text;
                          precio = Convert.ToSingle (row.Cells["Precio"].Value);
                          descuento = Convert.ToSingle (row.Cells["Descuento"].Value);
                          importe = Convert.ToSingle (row.Cells["Importe"].Value);

                         // int cantidadActual = (Convert.ToInt32(row.Cells["Cantidad"].Value)) + (cantidad);
                          int cantidadActual = (Convert.ToInt32(row.Cells["Cantidad"].Value));
                          row.Cells["Importe"].Value = importe - ((precio * descuento) / 100);

                          //sumo la cantidad que ingresó con la cantidad actual
                          row.Cells["Cantidad"].Value = cantidadActual;
                          totalPagar = (float )(cantidadActual * precio) + (totalPagar);
                          
                          //lblTotalPagar.Text = "TOTAL A PAGAR $ : " + totalPagar;

                      }

                  }

                  if (encontrado == false)
                  {

                      DGVenta.Rows.Add(TxtCodigo.Text, TxtDetalle.Text, TxtPrecio.Text, TxtDesc.Text, TxtSubtotal.Text, Convert.ToString(Convert.ToDecimal(TxtSubtotal.Text) * 3));
                      //multiplico precioCompra del textBox txtPrecioCompra y cantidadIngreso del textBox txtIngOegr
                      //totalPagar = (float)(cantidadIngreso * Convert.ToDecimal(txtPrecioCompra.Text)) + totalPagar;
                      //lblTotalPagar.Text = "TOTAL A PAGAR $ :" + totalPagar;
                  }

                  foreach (DataGridViewRow row in DGVenta.Rows)
                  {
                      total = total + Convert.ToSingle (row.Cells["importe"].Value);

                  }
                  txtTotalPagar.Text = Convert.ToString(total);
                  txtNombreProducto.Text = "";
              }
              else
              {
                  MessageBox.Show ("No es una clave valida");
              
              }
          }
        public void Totales()
        {
            //si el descuento esta vacio se asigna 0 o se asigna su mismo contenido
            TxtDesc.Text = (string.IsNullOrEmpty (TxtDesc.Text )) ? "0" : TxtDesc.Text;
            //resto el descuento
            TxtSubtotal.Text = Convert.ToString(Convert.ToDecimal (TxtPrecio.Text) - ((Convert.ToDecimal (TxtPrecio.Text) * Convert.ToDecimal (TxtDesc.Text)) / 100));
        
        }

        private void TxtDesc_TextChanged(object sender, EventArgs e)
        {
            Totales();
        }

        private void TxtPrecio_TextChanged(object sender, EventArgs e)
        {
            Totales();
        }


        

        private void dataGridView1_Enter(object sender, EventArgs e)
        {
            //dataGridView1.Visible = false;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        public bool IsNumeric(string input)
        {
            long test;

            return long.TryParse(input, out test);
        }
     

        private void btnCliente_Click(object sender, EventArgs e)
        {
            FrmBusquedaAvaCliente cliente = new FrmBusquedaAvaCliente();
            
            cliente.ShowDialog();
            //si el usuario cierra la ventana isCerro es true, sino si selecciono algun articulo isCerro
            try
            {
                if (cliente.IsCerro)
                {
                    txtIdCliente.Text = string.Empty;
                    txtRazonSocial.Text = string.Empty;
                   
                }
                else
                {

                    txtIdCliente.Text = cliente.IdCliente.ToString();
                    txtRazonSocial.Text = cliente.RazonSocial.ToString();
                   if(txtIdCliente.Text=="1"){

                       cbTipoComprobante.SelectedIndex = 1;
                   }

                }
                
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error al seleccionar un cliente. Causa:" + ex.Message+"cadena:"+ex.StackTrace);
                UtilityFrm.limpiarTextbox(txtIdCliente,txtRazonSocial);
                btnCliente.Focus();
            }
        }

        private void txtIdCliente_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                try
                {
                    Buscar_Cliente(Convert.ToInt32(txtIdCliente.Text));
                    
                }
                catch (Exception ex)
                {
                    UtilityFrm.mensajeError("Error al seleccionar un cliente. Causa:" + ex.Message);
                    clienteIncorrecto();
                    btnCliente.Focus();
                    
                }


            }
          
        }

        public void clienteIncorrecto(){
            //cuando el cliente no es encontrado o ingreso incorrecto de los datos
            UtilityFrm.limpiarTextbox(txtRazonSocial,txtIdCliente);
            //deselecciona el combobox de tipo comprobante
            cbTipoComprobante.SelectedIndex = -1;
            btnNuevo.Enabled = false;
            btnProducto.Enabled = false;

        }
        private void frmPventa_KeyDown(object sender, KeyEventArgs e)
        {
              if (e.KeyCode == Keys.F1) {
                try
                {
                    Buscar_Cliente(1);
                    //consumidor final es 1
                    txtIdCliente.Text = "1";
                   
                }
                catch (Exception ex)
                {
                    UtilityFrm.mensajeError("Error al seleccionar un cliente. Causa:" + ex.Message);
                    clienteIncorrecto();
                    btnCliente.Focus();

                }

            }
              if (e.KeyCode == Keys.F2) {
                  //guarda la venta
                  btnGuardar.PerformClick();              
                              
              }
        }

        

        private void btnGuardar_Click(object sender, EventArgs e)
        {


            Negociocaja objcaja = new Negociocaja();
            FrmGuardarVenta venta = new FrmGuardarVenta(decimal.Round(Convert.ToDecimal( txtTotalPagar.Text),2));
            
            //objcaja.extrestadocaja(1, "");
            //if (objcaja.Codcuenta == 9100002)
            //{ MessageBox.Show("La caja esta cerrada, para facturar realizar la apertura correspondiente"); }
            //else
            //{
                venta.ListadoDeProducto = DGVenta;
                venta.ShowDialog();
                //if (venta.Trans == "ok")
                //{
                //    UtilityFrm.limpiarTextbox(txtNombreProducto, TxtPrecio, TxtDesc, TxtCodigo, TxtSubtotal, TxtDetalle);
                //    txtTotalPagar.Text = "0,0";
                //    //limpia la grilla de productos
                //    txtNombreProducto.Enabled = true;
                //    TxtDesc.Enabled = true;
                //    TxtPrecio.Enabled = true;
                //    btnProducto.Enabled = true;
                //    DGVenta.Rows.Clear();
                //    txtNombreProducto.Focus();
                //}
                //else
                //{

                //}
            //}
        }

        private void txtNombreProducto_TextChanged_1(object sender, EventArgs e)
        {


            if (txtNombreProducto.TextLength >= 2 && IsNumeric(txtNombreProducto.Text) != true)
            {


                dataGridView1.Visible = true;
                dataGridView1.DataSource = NegocioArticulo.buscarNombre(txtNombreProducto.Text);

                dataGridView1.Columns[0].Visible = false;
                dataGridView1.Columns[1].Visible = false;
                dataGridView1.Columns[2].Width = 500;
                dataGridView1.Columns[3].Visible = false;
                dataGridView1.Columns[4].Visible = false;
                dataGridView1.Columns[5].Visible = false;
                dataGridView1.Columns[6].Visible = false;
               


            }
            //else if (IsNumeric(txtNombreProducto.Text) == true)
           
            //{
            //    dataGridView1.Visible = true;
            //    dataGridView1.DataSource = NegocioArticulo.buscarIdProducto(txtNombreProducto.Text);
            //    dataGridView1.Columns[0].Visible = true;
            //    dataGridView1.Columns[1].Visible = false;
            //    dataGridView1.Columns[2].Width = 400;
            //    dataGridView1.Columns[3].Visible = false;
            //    dataGridView1.Columns[4].Visible = false;
            //    dataGridView1.Columns[5].Visible = false;
            //    dataGridView1.Columns[6].Visible = false;
              
            //}
            
            else
                if (IsNumeric(txtNombreProducto.Text) == true && txtNombreProducto.TextLength >= 13)
            {
                Buscar_producto(Convert.ToInt64(txtNombreProducto.Text), "porbarra");
            }
                else 
            {
                dataGridView1.Visible = false;
            }
        }

        private void btnAgregar_Click_1(object sender, EventArgs e)
        {
            try
            {
                Buscar_producto(Convert.ToInt32(TxtCodigo.Text), "poridarticulo");
            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("No existe ningun producto para agregar");
           
                
            }
          
        }


        private void btnQuitar_Click(object sender, EventArgs e)
        {
            decimal totalPagar=Convert.ToDecimal( txtTotalPagar.Text);
            try
            {
                DataGridViewRow fila = DGVenta.CurrentRow;
                decimal precio = Convert.ToDecimal(fila.Cells["Precio"].Value);
                DGVenta.Rows.Remove(fila);
                totalPagar = (totalPagar- precio);
                txtTotalPagar.Text = totalPagar.ToString();

                UtilityFrm.limpiarTextbox(txtNombreProducto, TxtPrecio, TxtDesc, TxtCodigo, TxtSubtotal, TxtDetalle);

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error al Borrar Fila :" + ex.Message);
            }
            //UtilityFrm.limpiarTextbox(txtIngOegr, txtPrecioCompra, txtNombreProducto, txtIdArticulo, txtPrecioVenta);
        }



        private void TxtPrecio_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                e.Handled = false;
                e.SuppressKeyPress = true;
                
                if (!TxtPrecio.Text.Contains(","))
                {
                    TxtPrecio.Text += ",00";

                }
                TxtDesc.Focus();
            }
        }

        private void TxtPrecio_Leave(object sender, EventArgs e)
        {
            if (!TxtPrecio.Text.Contains(","))
            {
                TxtPrecio.Text += ",00";

            }
           
        }

        private void TxtSubtotal_Leave(object sender, EventArgs e)
        {
            if (!TxtPrecio.Text.Contains(","))
            {
                TxtPrecio.Text += ",00";

            }
        }

      

        private void TxtPrecio_KeyPress(object sender, KeyPressEventArgs e)
        {
            //solo valores numericos o comas
            if (Char.IsDigit(e.KeyChar))
            {

                e.Handled = false;

            }
            else if (e.KeyChar == '.' && !TxtPrecio.Text.Contains(',')) {
                e.Handled = true;
                SendKeys.Send(",");
               
                
            }
            else if (e.KeyChar == ',' && !TxtPrecio.Text.Contains(','))
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

        private void TxtDesc_KeyPress(object sender, KeyPressEventArgs e)
        {
            //solo valores numericos o comas
            UtilityFrm.NumTeclado(e, TxtDesc);
        }

        private void TxtDesc_Leave(object sender, EventArgs e)
        {
            if(TxtDesc.Text==""){
                TxtDesc.Text = "0";
            }

        }

        private void TxtDesc_KeyDown(object sender, KeyEventArgs e)
        {
             if (e.KeyCode == Keys.Enter)
            {
                    if (TxtDesc.Text == "")
                     {
                           TxtDesc.Text = "0";
                      }
             }
          
        }

        private void dataGridView1_KeyDown_1(object sender, KeyEventArgs e)
        {
            //if (e.KeyCode == Keys.Down||e.KeyCode == Keys.Up && dataGridView1.Visible == true)
            //{

            //    dataGridView1.Focus();

            //}
            try
            {
                if (e.KeyCode == Keys.Enter)
                {
                     int idArticulo = Convert.ToInt32(this.dataGridView1.CurrentRow.Cells["idarticulo"].Value);
                    string nombreProducto = Convert.ToString(this.dataGridView1.CurrentRow.Cells["nombre"].Value);
                    FrmAsignarPrecio asignarPrecio = new FrmAsignarPrecio(nombreProducto);
                    asignarPrecio.ShowDialog();
                    
                    //si se ha cerrado que no haga nada
                    if (asignarPrecio.IsCerro)
                    {

                    }
                    else
                    {
                        agregar_producto(idArticulo, asignarPrecio.Precio, asignarPrecio.Descuento);
                    }


                }
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("No hay datos asignados " + ex.Message);
                txtNombreProducto.Focus();  
            }
           
        }

        private void txtNombreProducto_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Down && dataGridView1.Visible == true)
            {

                dataGridView1.Focus();

            }

            if (e.KeyCode == Keys.Enter)
            {

                try
                {
                    if (txtNombreProducto.TextLength == 13 && IsNumeric(txtNombreProducto.Text) == true)
                    {
                        Buscar_producto(Convert.ToInt64(txtNombreProducto.Text), "porbarra");


                    }
                    else
                    {
                        Buscar_producto(Convert.ToInt32(txtNombreProducto.Text), "poridarticulo");

                    }
                }
                catch (Exception ex)
                {

                    UtilityFrm.mensajeError("Error: "+ex.Message);
                }
              
            }
        }

        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {
            try
            {
                int idArticulo = Convert.ToInt32(this.dataGridView1.CurrentRow.Cells["idarticulo"].Value);
                string nombreProducto = Convert.ToString(this.dataGridView1.CurrentRow.Cells["nombre"].Value);
                FrmAsignarPrecio asignarPrecio = new FrmAsignarPrecio(nombreProducto);
                asignarPrecio.ShowDialog();
                //si se ha cerrado que no haga nada
                if (asignarPrecio.IsCerro)
                {

                }
                else
                {
                    //agregar_producto(Convert.ToInt32(txtNombreProducto.Text), "poridarticulo",);
                    agregar_producto(idArticulo, asignarPrecio.Precio, asignarPrecio.Descuento);
                }
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("No hay datos asignados "+ex.Message);
                txtNombreProducto.Focus();
            }
           
        }

     

        private void frmPventa_Click(object sender, EventArgs e)
        {
            //if(dataGridView1.Visible==true){
            //    dataGridView1.Visible = false;
            //}
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Seguro que desea cancelar la venta?", "Cancelar"
                   , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
            {
                cancelarVenta();   
            }
        }
        public void cancelarVenta() {
            UtilityFrm.limpiarTextbox(txtIdCliente,TxtDetalle,txtNombreProducto,txtRazonSocial,TxtSubtotal);
            UtilityFrm.limpiarTextbox(TxtDesc,TxtPrecio,TxtCodigo);
            DGVenta.Rows.Clear();
            txtTotalPagar.Text = "0,00";
            btnGuardar.Enabled = false;
            btnProducto.Enabled = false;
            btnNuevo.Enabled = false;
            btnCancelar.Enabled = false;
            txtIdCliente.Focus();

        }
        private void dataGridView1_KeyDown(object sender, KeyEventArgs e)
        {
            
                try
                {


                    if (e.KeyCode == Keys.Enter)
                    {
                    Buscar_producto(Convert.ToInt32(this.dataGridView1.CurrentRow.Cells["idarticulo"].Value), "poridarticulo");
                    dataGridView1.Visible = true;
                    
                   // int idArticulo = Convert.ToInt32(this.dataGridView1.CurrentRow.Cells["idarticulo"].Value);
                   // string nombreProducto = Convert.ToString(this.dataGridView1.CurrentRow.Cells["nombre"].Value);
                   // FrmAsignarPrecio asignarPrecio = new FrmAsignarPrecio(nombreProducto);
                   // asignarPrecio.ShowDialog();
                    //si se ha cerrado que no haga nada
                   // if (asignarPrecio.IsCerro)
                   // {

                   // }
                   // else
                   // {
                      //  agregar_producto(Convert.ToInt32(txtNombreProducto.Text), "poridarticulo",);
                    //    agregar_producto(idArticulo, asignarPrecio.Precio, asignarPrecio.Descuento);
                   // }

                    }
                    else if (e.KeyCode == Keys.Up)
                          
                         {
                //pasa de la lista al campo nombreProducto 
                            if(dataGridView1.Rows.Count>0 && dataGridView1.Rows[0].Selected){
                            txtNombreProducto.Focus();
                            txtNombreProducto.SelectAll();
                    
                                }
                         }

                }
                catch (Exception ex)
                {

                    UtilityFrm.mensajeError("No hay datos asignados " + ex.Message);
                   dataGridView1.Visible = true;
                    txtNombreProducto.Focus();
                }


            
            
        }

        private void txtRazonSocial_TextChanged(object sender, EventArgs e)
        {
            if (txtRazonSocial.Text.Count() > 0)
            {
                txtNombreProducto.Enabled = true;
                TxtDesc.Enabled = true;
                TxtPrecio.Enabled = true;
                btnProducto.Enabled = true;
            
            
            }
        }

        private void DGVenta_RowsAdded(object sender, DataGridViewRowsAddedEventArgs e)
        {
            if (DGVenta.RowCount == 0)
            {

                btnGuardar.Enabled = false;
                btnCancelar.Enabled = false;
            }
            else
            {

                btnGuardar.Enabled = true;
                btnCancelar.Enabled = true;
            }
        }

        private void DGVenta_RowsRemoved(object sender, DataGridViewRowsRemovedEventArgs e)
        {
            if (DGVenta.RowCount == 0)
            {

                btnGuardar.Enabled = false;
            }
            else
            {

                btnGuardar.Enabled = true;
            }
        }

        private void txtIdCliente_Leave(object sender, EventArgs e)
        {

        }

        private void TxtDetalle_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void frmPventa_Load(object sender, EventArgs e)
        {
            txtIdCliente.Focus();
        }

       

        private void btnCalculadora_Click(object sender, EventArgs e)
        {
            //calculadora
            Process proceso = new Process();
            proceso.StartInfo.FileName = "calc.exe";
            proceso.StartInfo.Arguments = "";
            proceso.Start();
        }

        //VENTANA Y PANEL SUPERIOR

        private void btnMaximizar_Click(object sender, EventArgs e)
        {
            //maximizar
            this.btnRestaurar.Visible = true;
            this.btnMaximizar.Visible = false;
            this.WindowState = FormWindowState.Maximized;
        }
        private void btnCerrar_Click(object sender, EventArgs e)
        {
            //cierra
            this.Close();
        }
        private void btnMinimizar_Click(object sender, EventArgs e)
        {
            //minimiza
            this.WindowState = FormWindowState.Minimized;
        }
        private void btnRestaurar_Click(object sender, EventArgs e)
        {
            //restaurar
            this.btnRestaurar.Visible = false;
            this.btnMaximizar.Visible = true;
            this.WindowState = FormWindowState.Normal;
        }

        private void panelHorizontal_DoubleClick(object sender, EventArgs e)
        {
            if (btnRestaurar.Visible == false || btnMaximizar.Visible == true)
            {
                //maximizar
                this.btnRestaurar.Visible = true;
                this.btnMaximizar.Visible = false;
                this.WindowState = FormWindowState.Maximized;

            }
            else
            {
                //restaurar
                this.btnRestaurar.Visible = false;
                this.btnMaximizar.Visible = true;
                this.WindowState = FormWindowState.Normal;
            }
        }
        private void btnCerrar_MouseMove(object sender, MouseEventArgs e)
        {
            btnCerrar.BackColor = Color.Red;
        }
        private void btnCerrar_MouseLeave(object sender, EventArgs e)
        {
            btnCerrar.BackColor = Color.FromArgb(100, 0, 180);
        }
        private void btnRestaurar_MouseMove(object sender, MouseEventArgs e)
        {
            btnRestaurar.BackColor = Color.FromArgb(65, 39, 60);
        }
        private void btnRestaurar_MouseLeave(object sender, EventArgs e)
        {
            btnRestaurar.BackColor = Color.FromArgb(100, 0, 180);
        }
        private void btnMaximizar_MouseMove(object sender, MouseEventArgs e)
        {
            btnMaximizar.BackColor = Color.FromArgb(65, 39, 60);
        }
        private void btnMaximizar_MouseLeave(object sender, EventArgs e)
        {
            btnMaximizar.BackColor = Color.FromArgb(100, 0, 180);
        }
        private void btnMinimizar_MouseMove(object sender, MouseEventArgs e)
        {
            btnMinimizar.BackColor = Color.FromArgb(65, 39, 60);
        }
        private void btnMinimizar_MouseLeave(object sender, EventArgs e)
        {
            btnMinimizar.BackColor = Color.FromArgb(100, 0, 180);
        }

        int posY = 0;
        int posX = 0;
        private void panelHorizontal_MouseMove(object sender, MouseEventArgs e)
        {
            //mientra no se apreta el boton izquierdo del mouse actualiza el valor posX Y posY 
            if (e.Button != MouseButtons.Left)
            {
                posY = e.Y;
                posX = e.X;

            }
            else
            {
                //Left tiene la distancia que hay entre el borde izq y el fondo de la pantalla
                Left = Left + (e.X - posX);
                //top tiene la distancia que hay entre el borde sup y el fondo de la pantalla
                Top = Top + (e.Y - posY);

            }
        }
        private void btnProducto_Click(object sender, EventArgs e)
        {
            FrmBusquedaAvaArticulo objfrmbarticulo = new FrmBusquedaAvaArticulo();
            objfrmbarticulo.ShowDialog();
            //si el usuario cierra la ventana isCerro es true, sino si selecciono algun articulo isCerro
            try
            {
                if (objfrmbarticulo.IsCerro)
                {

                }
                else
                {

                    FrmAsignarPrecio asignarPrecio = new FrmAsignarPrecio(objfrmbarticulo.NombreProducto);
                    asignarPrecio.ShowDialog();
                    //si se ha cerrado que no haga nada
                    if (asignarPrecio.IsCerro)
                    {

                    }
                    else
                    {
                        agregar_producto(objfrmbarticulo.IdProducto, asignarPrecio.Precio, asignarPrecio.Descuento);
                    }
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error al seleccionar un producto. Causa:" + ex.Message + ",cadena:" + ex.StackTrace);
                btnCliente.Focus();
            }

        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            FrmAsignarPrecio asignarPrecio = new FrmAsignarPrecio();
            asignarPrecio.ShowDialog();
        }

        private void txtIdCliente_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsLetter(e.KeyChar))
            {
                txtNombreProducto.Focus();
                txtNombreProducto.Text += e.KeyChar;
                //se mueve hasta la ultima posicion
                txtNombreProducto.Select(txtNombreProducto.Text.Length, 0);
            }
        }

      
      

    }
}
