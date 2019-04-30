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
using System.Threading;

namespace Capa_Presentacion
{
    public partial class frmPventa : Form
    {
        
        public NegocioArticulo objnart = new NegocioArticulo();
        
        private void frmPventa_Load(object sender, EventArgs e)
        {
            this.DGVenta.Columns["Precio"].DefaultCellStyle.Format = String.Format("$###,##0.00");
            DGVenta.Columns["Importe"].DefaultCellStyle.Format = String.Format("$###,##0.00");
            this.mensajesDeAyuda();     
        }
        public frmPventa()
        {
            InitializeComponent();
            txtIdCliente.Focus();
           // DGVenta.Columns[2].DefaultCellStyle.Format = String.Format("$###,##0.00");
           // DGVenta.Columns[4].DefaultCellStyle.Format = String.Format("$###,##0.00");
           // DGVenta.Columns["Importe"].DefaultCellStyle.Format = String.Format("$###,##0.00");
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
                   cbxCategoria.SelectedIndex = 2;

                   btnNuevo.Enabled = true;
                   txtNombreProducto.Enabled = true;
                   txtNombreProducto.Focus();
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
          public void agregar_producto(int codproducto, decimal  precioProducto,decimal  descuentoProducto)
          {
              int cantidadProducto=1;
              objnart.extraerdatos(codproducto, "poridarticulo");

              TxtDetalle.Text = objnart.Nombre;
              //asigno el valor del precio pasado en el formulario frmasignarPrecio
              TxtPrecio.Text = Convert.ToString(precioProducto);
              TxtCodigo.Text = Convert.ToString(objnart.IdArticulo);
              TxtDesc.Text = Convert.ToString(descuentoProducto);
              //si el descuento esta vacio se asigna 0 o se asigna su mismo contenido

              TxtDesc.Text = (string.IsNullOrEmpty(TxtDesc.Text)) ? "0" : TxtDesc.Text;
              //lo multiplico por 1 para obtener el mismo valor

              decimal  totalPagar = Convert.ToDecimal(txtTotalPagar.Text);
              totalPagar =  (cantidadProducto * precioProducto) + (totalPagar);
                  DGVenta.Rows.Add(TxtCodigo.Text, TxtDetalle.Text, TxtPrecio.Text, TxtDesc.Text,cantidadProducto.ToString());

                  txtTotalPagar.Text = totalPagar.ToString() ;
              txtNombreProducto.Text = "";
              txtNombreProducto.Focus();
          }

          public void Buscar_producto(long codproducto, string tipo)
          {

              decimal  precio;
              decimal  descuento;
              decimal  importe;
              decimal  total = 0;
              int cantidadActual = 0;

              objnart.extraerdatos(codproducto, tipo);

              if (objnart.Sindatos == true)
              {



                  TxtDetalle.Text = objnart.Nombre;
                  TxtPrecio.Text = Convert.ToString(decimal.Round(objnart.Precio,2));
                  TxtCodigo.Text = Convert.ToString(objnart.IdArticulo);

                  //si el descuento esta vacio se asigna 0 o se asigna su mismo contenido
                  TxtDesc.Text = (string.IsNullOrEmpty(TxtDesc.Text)) ? "0" : TxtDesc.Text;

                  bool encontrado = false;

                  foreach (DataGridViewRow row in DGVenta.Rows)
                  {

                      if (Convert.ToString(row.Cells["Codigo"].Value) == TxtCodigo.Text)
                      {


                          encontrado = true;

                          row.Cells["Descuento"].Value = TxtDesc.Text;
                          //asigno el precio,descuento,cantidad
                          precio = Convert.ToDecimal (row.Cells["Precio"].Value);
                          descuento = Convert.ToDecimal (row.Cells["Descuento"].Value);
                          cantidadActual = (Convert.ToInt32(row.Cells["Cantidad"].Value));

                          //incremento la cantidad del producto agregado
                          cantidadActual++;
                          row.Cells["Cantidad"].Value = cantidadActual;
                          //calculo el precio con descuento incluido * la cantidad de articulos agregados
                           importe  = precio * cantidadActual;
                          importe= importe - ((importe * descuento) / 100);
                           row.Cells["Importe"].Value = importe;
                         

                      }

                  }

                  if (encontrado == false)
                  {
                      //si no se encuentra cantidad 
                      int Cantidad = 1;
                      precio = Convert.ToDecimal(TxtPrecio.Text);
                     descuento= Convert.ToDecimal(TxtDesc.Text);
                      //le aplico el descuento correspondiente
                     precio = precio - ((precio * descuento) /100);
                    //no calculo el precio por la cantidad porque da el mismo numero
                      DGVenta.Rows.Add(TxtCodigo.Text, TxtDetalle.Text, precio,Cantidad, TxtDesc.Text, precio);
                     
                      
                  }

                  foreach (DataGridViewRow row in DGVenta.Rows)
                  {
                      total = total + Convert.ToDecimal (row.Cells["importe"].Value);
                      decimal.Round(total, 2);
                  }
                  txtTotalPagar.Text = Convert.ToString(total);
                  txtNombreProducto.Text = "";
              }
              else
              {
                 // UtilityFrm.mensajeError( "No es una clave valida");

                  FrmMensajeAutoCierre.Show("No es una clave valida", "Error", 1000);


        
               
                  txtNombreProducto.SelectAll();
                 
              }
          }


       

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
          

        private void OnTimer(object state)
        {
            MessageBox.Show("Se ejecuto el evento");
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
                    txtIdCliente.Focus();
                }
                else
                {

                    txtIdCliente.Text = cliente.IdCliente.ToString();
                    txtRazonSocial.Text = cliente.RazonSocial.ToString();
                   if(txtIdCliente.Text=="1"){

                       cbTipoComprobante.SelectedIndex = 1;
                       cbxCategoria.SelectedIndex = 2;
                   }
                   txtNombreProducto.Focus();
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
            cbxCategoria.SelectedIndex = -1;
            btnNuevo.Enabled = false;
            btnProducto.Enabled = false;
            txtNombreProducto.Enabled = false;
            cbTipoComprobante.Enabled = false;
            cbxCategoria.Enabled = false;

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

            }else if (e.KeyCode == Keys.F2) {
                  //guarda la venta
                  btnGuardar.PerformClick();

            }
              else if (e.KeyCode == Keys.F5)
              {
                  //Cambiar la cantidad manualmente
                  if (DGVenta.Rows.Count > 0)
                  {
                      FrmAsignarValores asignarValor = new FrmAsignarValores("Cantidad");
                      asignarValor.ShowDialog();
                      //modifico la cantidad del row seleccionado

                      if (asignarValor.Cantidad != 0)
                      {
                          DGVenta.CurrentRow.Cells["Cantidad"].Value = asignarValor.Cantidad;
                          Decimal PrecioTotal = Convert.ToDecimal(DGVenta.CurrentRow.Cells["Precio"].Value);
                          PrecioTotal = PrecioTotal * asignarValor.Cantidad;
                          DGVenta.CurrentRow.Cells["Importe"].Value = PrecioTotal;

                          actualizarPrecioTotal();
                      }
                     

                  }
                 

              }
              else if (e.KeyCode == Keys.F11)
              {
                  //CONSULTA DE PRECIO
                  btnCalculadora.PerformClick();
              }
              else if (e.KeyCode == Keys.F12)
              { 
              //CONSULTA DE PRECIO
                  btnConsultas.PerformClick();
              }
              else if (e.KeyCode == Keys.Delete)
              {
                  quitarProducto();


              }
              else if (e.KeyCode == Keys.Down && txtNombreProducto.Focused == true && dataGridView1.Visible == false)
              {
                  //si se presiona el boton down y se encuentre el foco en la caja de texto de nombre de producto
                  //y la grilla de busqueda no está visible

                  //el foco se pasa a la grilla
                  if (DGVenta.Rows.Count > 0)
                  {
                      //y existen elementos en la grilla
                      DGVenta.Focus();
                  }



              }
             
        }

        

        private void btnGuardar_Click(object sender, EventArgs e)
        {


            Negociocaja objcaja = new Negociocaja();
            FrmGuardarVenta venta = new FrmGuardarVenta(decimal.Round(Convert.ToDecimal( txtTotalPagar.Text),2),Convert.ToInt32( txtIdCliente.Text));
            
            objcaja.extrestadocaja(1, "");
            //codigo de cuenta para cierre de caja
            //si está cerrado no permite generar la venta hasta no abrir la caja
            if (objcaja.Codcuenta == 9100002)
            { UtilityFrm.mensajeError("La caja esta cerrada, para facturar realizar la apertura correspondiente");
            }
            else
            {
                venta.ListadoDeProducto = DGVenta;
                venta.ShowDialog();
                if (venta.Trans == "ok")
                {
                    UtilityFrm.mensajeConfirm("La venta se realizó correctamente");
                    UtilityFrm.limpiarTextbox(txtNombreProducto, TxtPrecio, TxtDesc, TxtCodigo, TxtDetalle);
                    txtTotalPagar.Text = "0,00";
                    //limpia la grilla de productos
                    DGVenta.Rows.Clear();
                    txtNombreProducto.Enabled = true;
                    TxtDesc.Enabled = true;
                    TxtPrecio.Enabled = true;
                    btnProducto.Enabled = true;
                    txtNombreProducto.Focus();
                   
                }
                else
                {
                    UtilityFrm.mensajeError("Ha ocurrido un error: "+venta.Trans);
                }
            }
        }

        private void txtNombreProducto_TextChanged_1(object sender, EventArgs e)
        {


            if (txtNombreProducto.TextLength >= 2 && IsNumeric(txtNombreProducto.Text) != true)
            {


                dataGridView1.Visible = true;
                dataGridView1.DataSource = NegocioArticulo.buscarNombre(txtNombreProducto.Text);

                dataGridView1.Columns[0].Visible = false;
                dataGridView1.Columns[1].Visible = false;
                dataGridView1.Columns[2].Width = 350;
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
                Buscar_producto(Convert.ToInt64(TxtCodigo.Text), "poridarticulo");
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

                UtilityFrm.limpiarTextbox(txtNombreProducto, TxtPrecio, TxtDesc, TxtCodigo, TxtDetalle);

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
                    txtNombreProducto.Focus();
             }
          
        }

       

        private void txtNombreProducto_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Down && dataGridView1.Visible == true)
            {
                //si se preciona la tecla hacia abajo se pasa el foco a la grilla
                dataGridView1.Focus();

            }

            if (e.KeyCode == Keys.Enter)
            {
               
                  
                    //se pasa el control permitiendo eliminar el beep
                    e.SuppressKeyPress = true;
               
                try
                {
                    if (txtNombreProducto.TextLength == 13 && IsNumeric(txtNombreProducto.Text) == true)
                    {
                        Buscar_producto(Convert.ToInt64(txtNombreProducto.Text), "porbarra");


                    }
                    else
                    {
                        Buscar_producto(Convert.ToInt64(txtNombreProducto.Text), "poridarticulo");

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

                    Buscar_producto(Convert.ToInt32(this.dataGridView1.CurrentRow.Cells["idarticulo"].Value), "poridarticulo");
                    dataGridView1.Visible = false;
                    txtNombreProducto.Focus();
                
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("No hay datos asignados "+ex.Message);
                txtNombreProducto.Focus();
            }
           
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
            UtilityFrm.limpiarTextbox(txtIdCliente,TxtDetalle,txtNombreProducto,txtRazonSocial);
            UtilityFrm.limpiarTextbox(TxtPrecio,TxtCodigo);

            DGVenta.Rows.Clear();
            txtTotalPagar.Text = "0,00";
            TxtPrecio.Text = "0,00";
       
            TxtDesc.Text = "0";
            TxtDesc.Enabled = false;
            btnGuardar.Enabled = false;
            btnProducto.Enabled = false;
            btnNuevo.Enabled = false;
            btnCancelar.Enabled = false;
            txtIdCliente.Focus();
            txtNombreProducto.Enabled = false;
            cbTipoComprobante.SelectedIndex = -1;
            cbTipoComprobante.Enabled = false;

        }
        private void dataGridView1_KeyDown(object sender, KeyEventArgs e)
        {
            
                try
                {


                    if (e.KeyCode == Keys.Enter)
                    {
                    Buscar_producto(Convert.ToInt32(this.dataGridView1.CurrentRow.Cells["idarticulo"].Value), "poridarticulo");
                    dataGridView1.Visible = false;
                    txtNombreProducto.Focus();
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
                cbTipoComprobante.Enabled = true;
                cbxCategoria.Enabled = true;
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
        private void DGVenta_KeyDown(object sender, KeyEventArgs e)
        {

            if (e.KeyCode == Keys.Up && DGVenta.Rows.Count > 0 && DGVenta.Rows[0].Selected)
            {
                //Si se presiona la tecla up, existe elementos en la grilla y se selecciona antes del primer elemento
                txtNombreProducto.Focus();

            }
        }

      
        /*METODOS PROPIOS*/
        //mensajes de ayuda
        private void mensajesDeAyuda()
        {

            //mensaje de ayuda en el textbox nombre
            this.ttMensajeAyuda.SetToolTip(this.txtNombreProducto, "Ingrese el producto que desea buscar");
            //mensaje de ayuda en el textbox nombre
            this.ttMensajeAyuda.SetToolTip(this.TxtCodigo, "Ingrese el Codigo de Cliente");
            //mensaje de ayuda del boton calculadora
            this.ttMensajeAyuda.SetToolTip(this.btnCalculadora, "Acceso a la Calculadora de windows(F11)");
            //mensaje de ayuda en el consulta de precios
            this.ttMensajeAyuda.SetToolTip(this.btnConsultas, "Consulta de precios (F12)");
        }



        public void quitarProducto()
        {
            try
            {
                if (DGVenta.Rows.Count > 0)
                {
                    if (MessageBox.Show("Seguro que desea Eliminar un producto?", "Eliminar"
                        , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
                    {

                        //selecciono la primera "0" porque solo selecciono 1 row
                        int rowSelected = DGVenta.SelectedRows[0].Index;
                        DGVenta.Rows.RemoveAt(rowSelected);
                        actualizarPrecioTotal();
                    }


                }
                else
                {

                    UtilityFrm.mensajeError("No existe Producto seleccionado ");


                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error: " + ex.Message);
            }

        }
        public void actualizarPrecioTotal() {
            if (DGVenta.Rows.Count > 0)
            {
                decimal total=0;
                foreach (DataGridViewRow row in DGVenta.Rows)
                {
                   
                    total = decimal.Round( total+  Convert.ToDecimal( row.Cells["Importe"].Value),2);

                }

                //asigno la sumatoria del importe(cantidad*precio) de los productos para saber el total a pagar en txtTotalPagar
                txtTotalPagar.Text = total.ToString();
            }
            else {
                txtTotalPagar.Text = "0,00";
                txtNombreProducto.Focus();
            }
           
        
        }
        public void limpiarCampos() {
            UtilityFrm.limpiarTextbox(TxtDesc,TxtPrecio,TxtDetalle,TxtCodigo);
            if ((DGVenta.Rows.Count > 0))
            {
                //si no hay productos agregados cambian los botones de guardado y cancelar a disabled
                btnGuardar.Enabled = true;
                btnCancelar.Enabled = true;


            }
            else { 
               btnGuardar.Enabled = false;
               btnCancelar.Enabled = false;
            }
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

        private void btnAyuda_Click(object sender, EventArgs e)
        {

        }

        private void btnConsultas_Click(object sender, EventArgs e)
        {
            FrmConsulta consultas = new FrmConsulta();
            consultas.Show();
        }

        private void DGVenta_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (DGVenta.Rows.Count > 0)
            {
                FrmAsignarValores asignarValor = new FrmAsignarValores("Cantidad");
                asignarValor.ShowDialog();
                //modifico la cantidad del row seleccionado
             

                if (asignarValor.Cantidad != 0)
                {
                    DGVenta.CurrentRow.Cells["Cantidad"].Value = asignarValor.Cantidad;
                    Decimal PrecioTotal = Convert.ToDecimal( DGVenta.CurrentRow.Cells["Precio"].Value);
                    PrecioTotal = PrecioTotal * asignarValor.Cantidad;
                    DGVenta.CurrentRow.Cells["Importe"].Value = PrecioTotal;
                }
                
            }
        }

       
      
      

    }
}
