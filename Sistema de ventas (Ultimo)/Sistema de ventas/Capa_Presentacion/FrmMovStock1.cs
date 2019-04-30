using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Media;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Capa_negocio;
namespace Capa_Presentacion
{
    public partial class FrmMovStock1 : Form
    {
        private bool isIngreso = false;
        private bool isEgreso = false;
        private float totalPagar = 0;

        public FrmMovStock1()
        {
            InitializeComponent();
        }
        private void FrmMovStock1_Load(object sender, EventArgs e)
        {
            this.isIngreso = false;
            this.isEgreso = false;

            this.mostrar();
        }
        private void FrmMovStock1_KeyDown(object sender, KeyEventArgs e)
        {
            //atajos de Teclado
            if (btnGuardar.Enabled == true && e.KeyCode == Keys.F2)
            {
                //llama al evento clicck de btnGuardar
                btnGuardar.PerformClick();
                //btnGuardar_Click(null, null);	
            }
            //btnProducto
            else if (e.KeyCode == Keys.P & (e.Alt || e.Shift))
            {
                btnBuscarProd.PerformClick();

            }
            //btnProveedor
            else if (e.KeyCode == Keys.R & (e.Alt || e.Shift))
            {

                btnBuscarProv.PerformClick();
            }
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

    
  
        
        //cbregistar es el checkbox que al estar tildado podemos ingresar los comprobantes
        //caso contrario desabilita los controles para ingresar datos de comprobante Recibido
        private void cbRegistrar_CheckedChanged(object sender, EventArgs e)
        {
            if (cbRegistrar.Checked == true)
            {
                cbTipoComprobante.Enabled = true;
               cbIVA.Enabled = true;
                txtSerie.Enabled = true;
                txtCorrelativa.Enabled = true;

            }
            else
            {
                cbTipoComprobante.Enabled = false;
                cbIVA.Enabled = false;
                txtSerie.Enabled = false;
                txtCorrelativa.Enabled = false;
            }
        }
       
        /*TextBox*/
        //Eventos textChanged
        private void txtSerie_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                string serie = txtSerie.Text;
                //agrego ceros a la izquierda
                txtSerie.Text = serie.PadLeft(4, '0');
            }

        }

        private void txtCorrelativa_KeyDown(object sender, KeyEventArgs e)
        {

            if (e.KeyCode == Keys.Enter)
            {
                string correlativa = txtCorrelativa.Text;
                //agrego ceros a la izquierda
                txtCorrelativa.Text = correlativa.PadLeft(8, '0');
            }
        }

        private void txtSerie_Leave(object sender, EventArgs e)
        {

            string serie = txtSerie.Text;
            //agrego ceros a la izquierda
            txtSerie.Text = serie.PadLeft(4, '0');

        }

        private void txtCorrelativa_Leave(object sender, EventArgs e)
        {


            string correlativa = txtCorrelativa.Text;
            //agrego ceros a la izquierda
            txtCorrelativa.Text = correlativa.PadLeft(8, '0');
        }

        private void txtIngOegr_TextChanged(object sender, EventArgs e)
        {
            if (txtIngOegr.Text.Count() > 0)
            {
                btnAgregar.Enabled = true;
            }
            else
            {
                btnAgregar.Enabled = false;
            }


        }
        private void txtCorrelativa_TextChanged(object sender, EventArgs e)
        {
            if (txtCorrelativa.Text.Count() == 8)
            {
                btnBuscarProd.Focus();
            }
        }
        private void txtSerie_TextChanged(object sender, EventArgs e)
        {
            if (txtSerie.Text.Count() == 4)
            {
                txtCorrelativa.Focus();
            }
        }
        private void txtPrecioCompra_TextChanged(object sender, EventArgs e)
        {
            if (txtPrecioCompra.Text.Count() > 0)
            {

                btnCambiarPrecio.Enabled = true;
                txtIngOegr.Enabled = true;
            }
            else {
                btnCambiarPrecio.Enabled = false;
                txtIngOegr.Enabled = false;
            }
           
        }
        //Eventos keyPress
        private void txtPrecioCompra_KeyPress(object sender, KeyPressEventArgs e)
        {
            //solo valores numericos o comas
            UtilityFrm.NumDecTeclado(e, txtPrecioCompra);
        }
        private void txtIngOegr_KeyPress(object sender, KeyPressEventArgs e)
        {
            //solo valores numericos o comas
            UtilityFrm.NumDecTeclado(e, txtIngOegr);
        }
        private void txtSerie_KeyPress(object sender, KeyPressEventArgs e)
        {
            //solo valores numericos
            UtilityFrm.NumTeclado(e, txtCorrelativa);
        }
        private void txtCorrelativa_KeyPress(object sender, KeyPressEventArgs e)
        {
            //solo valores numericos

            UtilityFrm.NumTeclado(e, txtCorrelativa);
        }
        //Eventos keyDown
        private void txtPrecioCompra_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode==Keys.Enter){
                e.Handled = false;
                //se pasa el control permitiendo eliminar el beep
                e.SuppressKeyPress = true;
                btnCambiarPrecio.Focus();
                if(!txtPrecioCompra.Text.Contains(",")){
                    txtPrecioCompra.Text += ",00";
                
                }
            }
        }
        private void txtIngOegr_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                e.Handled = false;
                //se pasa el control permitiendo eliminar el beep
                e.SuppressKeyPress = true;
                btnAgregar.Focus();

            }
        }
        
       

        /*Metodos Propios*/
        public void mostrar()
        {
            try
            {
                this.dataLista.DataSource = NegocioMovStock.mostrar();
               
            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("error con la Base de datos: " + ex.Message);
            }
            //datasource el origen de los datos,muestra movimientos de stock en la grilla
            this.dataLista.Columns["total"].DefaultCellStyle.Format = String.Format("$###,##0.00");
            
            //muestro el total de los movimientos
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataLista.RowCount);

        }
        public void limpiarTodo() {
            
            btnBuscarProd.Enabled = false;
            btnCancelar.Enabled = false;
            btnIngreso.Enabled = true;
            btnEgreso.Enabled = true;
            btnBuscarProv.Enabled = false;
            cbIVA.Enabled = false;
            dtpFechaGenerar.Enabled = false;
            cbRegistrar.Enabled = false;
            cbRegistrar.Checked = false;
            cbTipoComprobante.Enabled = false;
            txtSerie.Enabled = false;
            txtCorrelativa.Enabled = false;
            txtIngOegr.Enabled = false;
            btnAgregar.Enabled = false;
            btnQuitar.Enabled = false;
            btnCambiarPrecio.Enabled = false;
            txtPrecioCompra.Enabled = false;
            btnGuardar.Enabled = false;
            this.isIngreso = false;
            this.isEgreso = false;
            //limpiar caja de texto ,textbox
            UtilityFrm.limpiarTextbox(txtIdArticulo, txtPrecioVenta,
                txtNombreProducto, txtCorrelativa, txtSerie, txtStockActual);
            UtilityFrm.limpiarTextbox(txtNombreProveedor, txtIdProveedor,
                txtIngOegr, txtPrecioCompra);
           
            //dejar en blanco el combobox
            cbIVA.SelectedIndex=-1;
            cbTipoComprobante.SelectedIndex = -1;
            dataListaMov.Rows.Clear();
            
        
        }
        public void buscarPorFecha() {
            dataLista.DataSource = NegocioMovStock.buscarFecha(dtpFechaIni.Value.ToString("dd/MM/yyyy"), dtpFechaFin.Value.ToString("dd/MM/yyyy"));

            //muestro el total de los movimientos
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataLista.RowCount);
        
        }
        /*Lista*/
        private void dataListaMov_SelectionChanged(object sender, EventArgs e)
        {
            if (dataListaMov.Rows.Count > 0)
            {

                btnQuitar.Enabled = true;
            }
            else
            {
                btnQuitar.Enabled = false;
            }
        }
        private void dataListaMov_RowsAdded(object sender, DataGridViewRowsAddedEventArgs e)
        {
            if (dataListaMov.RowCount == 0)
            {

                btnGuardar.Enabled = false;
            }
            else
            {

                btnGuardar.Enabled = true;
            }
        }
        private void dataListaMov_RowsRemoved(object sender, DataGridViewRowsRemovedEventArgs e)
        {
            if (dataListaMov.RowCount == 0)
            {

                btnGuardar.Enabled = false;
            }
            else
            {

                btnGuardar.Enabled = true;
            }
        }
    
        /*Botones*/
        //Evento Click

        //Operaciones de guardar y cancelar un Ingreso o Egreso
        private void btnCancelar_Click(object sender, EventArgs e)
        {
            //si la respuesta es si elimina la fila actual
            if (MessageBox.Show("Se Borrarán todos los Datos Agregados, ¿Seguro que desea Cancelar? ", "Movimiento Stock"
               , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
            {
                limpiarTodo();
                this.btnIngreso.Focus();
            }

        }
        private void btnTodos_Click(object sender, EventArgs e)
        {
            this.mostrar();
        }
        private void btnGuardar_Click(object sender, EventArgs e)
        {
            
            //variables locales para almacenar los datos del datatable
            int idProveedor = 0;
            string correlativa = "0";
            string serie = "0";
            string comprobante = "";
           
            decimal IVA = 0;

            //si no esta vacio agrego los valores 
            if (!(txtIdProveedor.Text == string.Empty))
            {
                idProveedor = Convert.ToInt32(txtIdProveedor.Text);
            }
            if (cbRegistrar.Checked == true)
            {
                try
                {
                    correlativa = (txtCorrelativa.Text);
                    serie = (txtSerie.Text);
                    comprobante = cbTipoComprobante.SelectedItem.ToString();
                    //cbTipoComprobante.ValueMember
                    IVA = Convert.ToDecimal(cbIVA.SelectedItem.ToString());
                }
                catch (Exception ex)
                {
                    UtilityFrm.mensajeError("Datos invalidos de los registros :" +ex.Message);
                    if(cbTipoComprobante.Text==null||cbTipoComprobante.Text==string.Empty){
                        errorIcono.SetError(cbTipoComprobante, "Seleccione un tipo de comprobante");
                    }
                    if (txtSerie.Text == null || txtSerie.Text == string.Empty)
                    {
                        errorIcono.SetError(txtSerie, "Complete el campo Serie");
                    }
                    if (txtCorrelativa.Text == null || txtCorrelativa.Text == string.Empty)
                    {
                        errorIcono.SetError(txtCorrelativa, "Complete el campo correlativa");
                    }
                    if (cbIVA.Text== null || cbIVA.Text == string.Empty)
                    {
                        errorIcono.SetError(cbIVA, "Seleccione IVA correspondiente");
                    }
                    //sale del boton guardar
                    return;
                }
                

            }

            DataTable dt = new DataTable();
            dt.Columns.Add("Codigo", typeof(string));
            dt.Columns.Add("Precio", typeof(decimal));
            dt.Columns.Add("PrecioVenta", typeof(decimal));
            dt.Columns.Add("Cantidad", typeof(string));
            dt.Columns.Add("StockActual", typeof(string));
            if (isIngreso == true && isEgreso == false)
            {
          //INGRESO
              
                foreach (DataGridViewRow row in dataListaMov.Rows)
                {
                    
                    dt.Rows.Add(row.Cells[0].Value, row.Cells[2].Value, row.Cells[3].Value, row.Cells[4].Value, row.Cells[5].Value);
                
                }
                string respuesta = NegocioMovStock.insertar(idProveedor, dtpFechaGenerar.Value,
                    serie, correlativa, comprobante, IVA, "EMITIDO","INGRESO", dt);

                if (respuesta.Equals("ok"))
                {
                    limpiarTodo();
                    UtilityFrm.mensajeConfirm("Se Agrego Correctamente");
                    
                    this.mostrar();


                }
                else
                {
                    UtilityFrm.mensajeError("No se ha podido Agregar: " + respuesta);

                }

            }
            else if(isIngreso==false&&isEgreso==true){
                //EGRESO

                foreach (DataGridViewRow row in dataListaMov.Rows)
                {
               
                    dt.Rows.Add(row.Cells[0].Value, row.Cells[2].Value, row.Cells[3].Value, row.Cells[4].Value, row.Cells[5].Value);

                }
                string respuesta = NegocioMovStock.insertar(idProveedor, dtpFechaGenerar.Value,
                    serie, correlativa, comprobante, IVA, "EMITIDO", "EGRESO", dt);

                if (respuesta.Equals("ok"))
                {
                    limpiarTodo();
                    UtilityFrm.mensajeConfirm("Se Agrego Correctamente");

                    this.mostrar();


                }
                else
                {
                    UtilityFrm.mensajeError("No se ha podido Agregar: " + respuesta);

                }
            }
            

        }

        private void btnProveedor_Click(object sender, EventArgs e)
        {
            FrmBusquedaAvaProveedor proveedor = new FrmBusquedaAvaProveedor();
            proveedor.ShowDialog();

            //si el usuario cierra la ventana isCerro es true, sino si selecciono algun articulo isCerro
            try
            {
                if (proveedor.IsCerro)
                {
                    txtIdProveedor.Text = string.Empty;
                    txtNombreProveedor.Text = string.Empty;

                }
                else
                {

                    txtIdProveedor.Text = proveedor.IdProveedor.ToString();
                    txtNombreProveedor.Text = proveedor.NombreProveedor.ToString();

                }
                cbRegistrar.Focus();
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error al seleccionar un proveedor. Causa:" + ex.Message);
                btnBuscarProv.Focus();
            }
            
        }
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.buscarPorFecha();
        }
        private void btnQuitar_Click(object sender, EventArgs e)
        {
            try
            {
                DataGridViewRow fila = dataListaMov.CurrentRow;
                decimal precioCompra = Convert.ToDecimal(fila.Cells["Precio"].Value);
                int cantidad = Convert.ToInt32(fila.Cells["Cantidad"].Value);
                dataListaMov.Rows.Remove(fila);
                totalPagar = (float)(cantidad * precioCompra) - (totalPagar);
                lblTotalPagar.Text = "TOTAL A PAGAR $ :" + totalPagar;

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error al Borrar Fila :" + ex.Message);
            }
            UtilityFrm.limpiarTextbox(txtIngOegr,txtPrecioCompra,txtNombreProducto,txtIdArticulo,txtPrecioVenta);
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            
            int cantidad = Convert.ToInt32(txtIngOegr.Text);
            decimal precio;
            bool encontrado = false;

            //INGRESO
            if (isIngreso == true && isEgreso == false)
            {

                foreach (DataGridViewRow row in dataListaMov.Rows)
                {
                    if (Convert.ToString(row.Cells["Codigo"].Value) == txtIdArticulo.Text)
                    {

                        encontrado = true;
                        precio = Convert.ToDecimal(row.Cells["Precio"].Value);
                        int cantidadIngreso = (Convert.ToInt32(row.Cells["Cantidad"].Value)) + (cantidad);
                        //sumo la cantidad que ingresó con la cantidad actual
                        row.Cells["Cantidad"].Value = cantidadIngreso;
                        totalPagar = (float)(cantidadIngreso * precio) + (totalPagar);
                        lblTotalPagar.Text = "TOTAL A PAGAR $ : " + totalPagar;
                    }

                }

                if (encontrado == false)
                {

                    dataListaMov.Rows.Add(txtIdArticulo.Text, txtNombreProducto.Text, txtPrecioCompra.Text, txtPrecioVenta.Text, txtIngOegr.Text, txtStockActual.Text);
                    //multiplico precioCompra del textBox txtPrecioCompra y cantidadIngreso del textBox txtIngOegr
                    totalPagar = (float)(cantidad * Convert.ToDecimal(txtPrecioCompra.Text)) + totalPagar;
                    lblTotalPagar.Text = "TOTAL A PAGAR $ :" + totalPagar;
                }


            }
                //EGRESO
            else {
                foreach (DataGridViewRow row in dataListaMov.Rows)
                {
                    if (Convert.ToString(row.Cells["Codigo"].Value) == txtIdArticulo.Text)
                    {

                        encontrado = true;

                        precio = Convert.ToDecimal(row.Cells["Precio"].Value);
                        int cantidadEgreso = (Convert.ToInt32(row.Cells["Cantidad"].Value)) + (cantidad);
                        //sumo la cantidad que ingresó con la cantidad actual
                        row.Cells["Cantidad"].Value = cantidadEgreso;
                        //calculo la cantidad Egresado * precio de venta del producto y sumo el total que ya tenia
                        totalPagar = (float)(cantidadEgreso * precio) + (totalPagar);
                        lblTotalPagar.Text = "TOTAL A PAGAR $ : " + totalPagar;
                    }

                }

                if (encontrado == false)
                {

                    dataListaMov.Rows.Add(txtIdArticulo.Text, txtNombreProducto.Text, txtPrecioCompra.Text, txtPrecioVenta.Text, txtIngOegr.Text, txtStockActual.Text);
                    //multiplico precioCompra del textBox txtPrecioCompra y cantidadIngreso del textBox txtIngOegr
                    totalPagar = (float)(cantidad * Convert.ToDecimal(txtPrecioVenta.Text)) + totalPagar;
                    lblTotalPagar.Text = "TOTAL A PAGAR $ :" + totalPagar;
                }
            
            }
           

            UtilityFrm.limpiarTextbox(txtIngOegr);



        }
        private void btnProducto_Click(object sender, EventArgs e)
        {
            FrmBusquedaAvaArticulo producto = new FrmBusquedaAvaArticulo();
            producto.ShowDialog();
            //si el usuario cierra la ventana isCerro es true, sino si selecciono algun articulo isCerro
            try
            {
                if (producto.IsCerro)
                {
                    txtIdArticulo.Text = string.Empty;
                    txtPrecioVenta.Text = string.Empty;
                    txtNombreProducto.Text = string.Empty;
                }
                else
                {

                    txtIdArticulo.Text = producto.IdProducto.ToString();
                    txtPrecioVenta.Text = producto.Precio.ToString();
                    txtNombreProducto.Text = producto.NombreProducto.ToString();
                    txtStockActual.Text = producto.StockActual.ToString();
                    txtPrecioCompra.Enabled = true;
                   

                }
                txtPrecioCompra.Text = string.Empty;
                txtIngOegr.Text = string.Empty;
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error al seleccionar un articulo. Causa:" + ex.Message);
            }
            txtPrecioCompra.Focus();
        }
        private void btnIngreso_Click(object sender, EventArgs e)
        {
            
            btnBuscarProd.Enabled = true;
            btnCancelar.Enabled = true;
            btnIngreso.Enabled = false;
            btnEgreso.Enabled = false;
            btnBuscarProv.Enabled = true;
            cbRegistrar.Enabled = true;
            dtpFechaGenerar.Enabled = true;
            btnBuscarProd.Enabled = true;
            //btnGuardar.Enabled = true;
            this.isIngreso = true;
            this.isEgreso = false;
            lblTotalPagar.Enabled = true;
            //cambiar foco
            btnBuscarProv.Focus();
        }
        private void btnEgreso_Click(object sender, EventArgs e)
        {

            btnBuscarProd.Enabled = true;
            btnCancelar.Enabled = true;
            btnIngreso.Enabled = false;
            btnEgreso.Enabled = false;
            btnBuscarProv.Enabled = true;
            cbRegistrar.Enabled = true;
            dtpFechaGenerar.Enabled = true;
            txtIngOegr.Enabled = true;
            btnBuscarProd.Enabled = true;
            this.isIngreso = false;
            this.isEgreso = true;
            lblTotalPagar.Enabled = false;

            //cambiar foco
            btnBuscarProv.Focus();
        }
        private void btnCambiarPrecio_Click(object sender, EventArgs e)
        {
            try
            {
                FrmCambiarPrecio camPrecio = new FrmCambiarPrecio(txtNombreProducto.Text, Convert.ToDecimal(txtPrecioVenta.Text), Convert.ToDecimal(txtPrecioCompra.Text));
                camPrecio.ShowDialog();
                txtPrecioVenta.Text = Convert.ToString(camPrecio.PrecioVenta);
                txtIngOegr.Focus();
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Valor erroneo, Posiblemente se deba al valor decimal");
            }


        }
        //Evento Mouse Hover
        private void btnProveedor_MouseHover(object sender, EventArgs e)
        {
            this.ttMensajeAyuda.SetToolTip(btnBuscarProv, "Seleccione Proveedor, Atajo de Teclado:(Shift+r o Alt+r)");

        }
        private void btnProducto_MouseHover(object sender, EventArgs e)
        {
            //mensaje de ayuda en el textbox nombre
            this.ttMensajeAyuda.SetToolTip(btnBuscarProd, "Seleccione Producto, Atajo de Teclado:(Shift+p o Alt+p)");
        }

        /*TabControl*/
        private void tabControl1_KeyDown(object sender, KeyEventArgs e)
        {
             if (e.KeyCode == Keys.F11)
            {
                this.tabControl1.SelectedTab = tabLista;
            
            }
            else if (e.KeyCode == Keys.F12)
            {

                this.tabControl1.SelectedTab = tabGenerar;

            }
             else if (e.KeyCode == Keys.NumPad1&&tabControl1.SelectedIndex==2)
             {

                 this.tabControl1.SelectedTab = tabGenerar;

             }
        }
        private void tabControl1_Selected(object sender, TabControlEventArgs e)
        {
            //cuando se cambia del tabGenerar al tabLista se produce el evento
            if (tabControl1.SelectedIndex == 0 && btnIngreso.Enabled == false && btnEgreso.Enabled == false)
            {
                if (MessageBox.Show("Se Borrarán todos los Datos Agregados, ¿Seguro que desea Cancelar? ", "Movimiento Stock"
                    , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
                {
                    limpiarTodo();
                    tabControl1.SelectedIndex = 0;

                }
                else {

                    tabControl1.SelectedIndex = 1;
                }


            }else if(tabControl1.SelectedIndex == 1){

                btnIngreso.Focus();
            }
            
           
        }

        private void btnGuardar_MouseHover(object sender, EventArgs e)
        {
              this.ttMensajeAyuda.SetToolTip(btnGuardar, "Guardar, Atajo de Teclado:(F2)");

        }

        private void dataLista_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            btnAnular.Enabled = true;
        }

        private void btnAnular_Click(object sender, EventArgs e)
        {
            /*anular un movimiento,no se puede eliminar*/
              //si la respuesta es si elimina la fila actual
                if (MessageBox.Show("Estás seguro de Anular un Movimiento,se modificará el Stock?", "Anular"
                   , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
                {
            string respuesta = string.Empty;
            respuesta = NegocioMovStock.anular(Convert.ToInt32(this.dataLista.CurrentRow.Cells[0].Value));
            if (respuesta.Equals("ok"))
            {
                UtilityFrm.mensajeConfirm(dataLista.CurrentRow.Cells[3].Value.ToString() + " se anuló correctamente");
            }
            else
            {

                UtilityFrm.mensajeError("Error: " + respuesta);
            }

          }

        }

        private void panelHorizontal_Paint(object sender, PaintEventArgs e)
        {

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

        private void btnCancelar1_Click(object sender, EventArgs e)
        {
            //si la respuesta es si elimina la fila actual
            if (MessageBox.Show("Se Borrarán todos los Datos Agregados, ¿Seguro que desea Cancelar? ", "Movimiento Stock"
               , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
            {
                limpiarTodo();
            }
        }

        private void btnBuscarProv_Click(object sender, EventArgs e)
        {
            FrmBusquedaAvaProveedor proveedor = new FrmBusquedaAvaProveedor();
            proveedor.ShowDialog();

            //si el usuario cierra la ventana isCerro es true, sino si selecciono algun articulo isCerro
            try
            {
                if (proveedor.IsCerro)
                {
                    txtIdProveedor.Text = string.Empty;
                    txtNombreProveedor.Text = string.Empty;

                }
                else
                {

                    txtIdProveedor.Text = proveedor.IdProveedor.ToString();
                    txtNombreProveedor.Text = proveedor.NombreProveedor.ToString();

                }
                cbRegistrar.Focus();
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error al seleccionar un proveedor. Causa:" + ex.Message);
                btnBuscarProv.Focus();
            }
        }

        private void btnBuscarProd_Click(object sender, EventArgs e)
        {
            FrmBusquedaAvaArticulo producto = new FrmBusquedaAvaArticulo();
            producto.ShowDialog();
            //si el usuario cierra la ventana isCerro es true, sino si selecciono algun articulo isCerro
            try
            {
                if (producto.IsCerro)
                {
                    txtIdArticulo.Text = string.Empty;
                    txtPrecioVenta.Text = string.Empty;
                    txtNombreProducto.Text = string.Empty;
                }
                else
                {

                    txtIdArticulo.Text = producto.IdProducto.ToString();
                    txtPrecioVenta.Text = producto.Precio.ToString();
                    txtNombreProducto.Text = producto.NombreProducto.ToString();
                    txtStockActual.Text = producto.StockActual.ToString();
                    txtPrecioCompra.Enabled = true;


                }
                txtPrecioCompra.Text = string.Empty;
                txtIngOegr.Text = string.Empty;
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error al seleccionar un articulo. Causa:" + ex.Message);
            }
            txtPrecioCompra.Focus();
        }


        private void dataLista_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if(dataLista.Rows.Count>0){
                abrirDetalleVenta();

            }
           
        }

        private void dataLista_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter&&dataLista.Rows.Count>0)
            {
                abrirDetalleVenta();
            }
        }
        public void abrirDetalleVenta() {
            DateTime date = Convert.ToDateTime(this.dataLista.CurrentRow.Cells["fecha"].Value);
            FrmDetallesDeStock stock = new FrmDetallesDeStock(Convert.ToString(this.dataLista.CurrentRow.Cells["idmov_stock"].Value),
                               date.ToShortDateString(),
                               Convert.ToString(this.dataLista.CurrentRow.Cells["movimiento"].Value),
                             Convert.ToString(this.dataLista.CurrentRow.Cells["estado"].Value),
                             Convert.ToString(Decimal.Round(Convert.ToDecimal(this.dataLista.CurrentRow.Cells["total"].Value), 2)));
            stock.ShowDialog();
        }
        private void txtPrecioCompra_Leave(object sender, EventArgs e)
        {
            if(txtPrecioCompra.Text.Length>0){

                if (!txtPrecioCompra.Text.Contains(","))
                {
                    txtPrecioCompra.Text += ",00";

                }
            }
        }

        

    
      
  }
}
