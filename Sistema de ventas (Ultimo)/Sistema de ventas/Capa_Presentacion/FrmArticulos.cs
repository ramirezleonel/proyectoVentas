using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using Capa_negocio;
using Capa_Presentacion.DataSet;
namespace Capa_Presentacion
{
    public partial class FrmArticulos : Form
    {
        //campos
        //en el caso de que guarde una articulo nuevo o editado
        private bool isNuevo, isEditar;
        public FrmArticulos()
        {
            InitializeComponent();
              
        }
        private void FrmArticulos_Load(object sender, EventArgs e)
        {
         
           llenarComboBoxCategoria();
           isEditar = false;
           isNuevo= false;
           this.mostrar();
           mensajesDeAyuda();
     


          this.tabControl1.SelectedIndex = 0;

        this.txtNombre.Select();

        this.txtNombre.Focus();
         
          // txtNombre.TextChanged += new EventHandler(txtNombre_TextChanged);

      
         
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
            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("error con la Base de datos: " + ex.Message);
            }
            //datasource el origen de los datos,muestra las categorias en la grilla

            //oculto las dos primeras columnas
            this.ocultarColumnas();
            //muestro el total de las categorias
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataLista.RowCount);
            
        }
        private void ocultarColumnas()
        {
            //no muestro la columna eliminar categoria
            this.dataLista.Columns[0].Visible = false;

        }
        private void BuscarNombre()
        {
            try
            {
                this.dataLista.DataSource = NegocioArticulo.buscarNombre(this.txtNombre.Text);
            }

            catch (Exception ex)
            {
                UtilityFrm.mensajeError("Error Con Base de Datos :" + ex.Message);

            }
            //datasource el origen de los datos 

            //oculto las dos primeras columnas
            this.ocultarColumnas();
            //muestro el total de las categorias
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataLista.RowCount);

        }
        private void generarCodigoBarra() {
            try
            {
                string codigoBarra = NegocioArticulo.obtenerIdArticulo().ToString();

                codigoBarra = codigoBarra.PadLeft(12, '0');
                int codigoControl = NegocioArticulo.calcDigControl(codigoBarra);
                txtCodigoBarra.Text = codigoBarra + codigoControl;
            }
            catch (FormatException ex)
            {
                UtilityFrm.mensajeError("No se a podido generar codigo Barra:" + ex.Message);
            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("Error:" + ex.Message);
            }
        
        }
        private void BuscarCodigoBarra() {
            try
            {
                this.dataLista.DataSource = NegocioArticulo.buscarCodigoBarra(this.txtNombre.Text);
            }

            catch (Exception ex)
            {
                UtilityFrm.mensajeError("Error Con Base de Datos :" + ex.Message);

            }
            //datasource el origen de los datos 

            //oculto las dos primeras columnas
            this.ocultarColumnas();
            //muestro el total de las categorias
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataLista.RowCount);
        
        }
        private void BuscarCategoria()
        {
            try
            {
                this.dataLista.DataSource = NegocioArticulo.buscarCategoria(this.txtNombre.Text);
            }

            catch (Exception ex)
            {
                UtilityFrm.mensajeError("Error Con Base de Datos :" + ex.Message);

            }
            //datasource el origen de los datos 

            //oculto las dos primeras columnas
            this.ocultarColumnas();
            //muestro el total de las categorias
            lblTotal.Text = "Total de Registros: " + Convert.ToString(dataLista.RowCount);

        }
        //muestra en el combobox los resultados cargados en categoria
        private void llenarComboBoxCategoria() {
            this.cbxCategoria.DataSource = NegocioCategoria.mostrar();
            //valor real de la DB
            this.cbxCategoria.ValueMember = "idcategoria";
            //lo que se muestra
            this.cbxCategoria.DisplayMember = "nombre";
        
        }
        //mensajes de ayuda
        private void mensajesDeAyuda()  
        {

            //mensaje de ayuda en el textbox nombre
            this.ttMensajeAyuda.SetToolTip(this.txtNombre, "Ingrese el producto que desea buscar,(F1) para limpiar");
            //mensaje de ayuda en el textbox nombre
            this.ttMensajeAyuda.SetToolTip(this.txtNombreConfig, "Ingrese el nombre del producto");
            //mensaje de ayuda en el textbox nombre
            this.ttMensajeAyuda.SetToolTip(this.txtDescripcion, "Ingrese la descripción del producto");
            //mensaje de ayuda en el textbox codigoBarra
            this.ttMensajeAyuda.SetToolTip(this.txtCodigoBarra, "Ingrese el codigo de barra");
            //mensaje de ayuda del boton buscar
            this.ttMensajeAyuda.SetToolTip(this.btnBuscar, "Buscar por nombre de producto");
            //mensaje de ayuda del boton eliminar
            this.ttMensajeAyuda.SetToolTip(this.btnEliminar, "Borrar articulo");
            //mensaje de ayuda del boton Imprimir
            this.ttMensajeAyuda.SetToolTip(this.btnImprimir, "imprime la lista de articulos");
            //mensaje de ayuda del boton nuevo codbar
            this.ttMensajeAyuda.SetToolTip(this.btnNuevoCodBar, "Crear un nuevo Codigo de barra");
            //mensaje de ayuda del boton nuevo codbar
            this.ttMensajeAyuda.SetToolTip(this.txtPrecio, "Ingrese un precio con los decimales correspondientes");
            //mensaje de ayuda en el textbox cantInicial
            this.ttMensajeAyuda.SetToolTip(this.txtCantInicial, "Ingrese el stock inicial para un producto");
        }
       
        /*EVENTOS*/
        //textBox
        private void txtNombre_TextChanged(object sender, EventArgs e)
        {
            if (txtNombre.Text != String.Empty)
            {
                if (Char.IsNumber(txtNombre.Text, 0) && ((rdbNombre.Checked == true) || (rbCategoria.Checked == true)))
                {
                    rdbCodigoBarra.Checked = true;

                    this.BuscarCodigoBarra();

                }
                else if (Char.IsLetter(txtNombre.Text, 0) && (rdbCodigoBarra.Checked == true))
                {

                    rdbNombre.Checked = true;

                    this.BuscarNombre();
                }
                else if (rdbNombre.Checked == true) //segun el radiobutton que seleccione buscara
                {
                    this.BuscarNombre();
                }
                else if (rdbCodigoBarra.Checked == true)
                {

                    if (txtNombre.Text.Length > 13)
                    {
                        string prod = txtNombre.Text;
                        prod = prod.Remove(0, 13);
                        txtNombre.Text = "";

                        txtNombre.Text = prod.ToString();
                        //se mueve hasta la ultima posicion
                        txtNombre.Select(txtNombre.Text.Length, 0);
                        // txtProducto.SelectAll();

                    }
                    this.BuscarCodigoBarra();

                }

                else if (rbCategoria.Checked == true)
                {
                    this.BuscarCategoria();
                }
            }
            else {

                this.BuscarNombre();
            }
        }
        /*Botones*/
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            //segun el radiobutton que seleccione buscara
            if (rdbNombre.Checked == true)
            {
                this.BuscarNombre();
                UtilityFrm.limpiarTextbox(txtDescripcion, txtNombreConfig, txtCodigo, txtCodigoBarra);
            }
            else if (rdbCodigoBarra.Checked == true)
            {
                this.BuscarCodigoBarra();
                UtilityFrm.limpiarTextbox(txtDescripcion, txtNombreConfig, txtCodigo, txtCodigoBarra);

            }
            else
            {
                this.BuscarCategoria();
                UtilityFrm.limpiarTextbox(txtDescripcion, txtNombreConfig, txtCodigo, txtCodigoBarra);
            }
        }
        private void btnNuevo_Click(object sender, EventArgs e)
        {
            //limpio textbox
            UtilityFrm.limpiarTextbox(txtDescripcion, txtNombreConfig, txtNombre, txtCodigo,txtCodigoBarra);
            //habilitar botones
            this.cbxPesable.Enabled = true;
            this.btnGuardar.Enabled = true;
            this.btnEditar.Enabled = false;
            this.btnCancelar.Enabled = true;
            this.btnNuevo.Enabled = false;
            this.btnNuevoCodBar.Enabled = true;
            this.cbxCategoria.Enabled = true;
            //this.cbxCategoria.Text = "";
            //habilitar textbox
            this.txtCodigoBarra.Enabled = true;
            this.txtPrecio.Enabled = true;
            this.txtDescripcion.Enabled = true;
            this.txtNombreConfig.Enabled = true;
            this.txtCantInicial.Enabled = true;
          
            this.txtCodigoBarra.Focus();
            isEditar = false;
            isNuevo = true;
            generarCodigoBarra();
            txtCodigoBarra.SelectAll();
        }
        private void btnCancelar_Click(object sender, EventArgs e)
        {
         
            btnNuevo.Enabled = true;
            btnEditar.Enabled = false;
            btnGuardar.Enabled = false;
            btnCancelar.Enabled = false;
            this.btnNuevoCodBar.Enabled = false;
            //habilito el codigo para poder editar
            this.txtPrecio.Enabled = false;
            this.cbxCategoria.Enabled = false;
            this.txtCodigo.Enabled = false;
            this.txtCodigoBarra.Enabled = false;
            this.txtNombreConfig.Enabled = false;
            this.txtDescripcion.Enabled = false;
            this.txtCantInicial.Enabled = false;
            this.cbxPesable.Enabled = false;
            UtilityFrm.limpiarTextbox(txtDescripcion, txtNombreConfig, txtNombre, txtCodigo, txtCodigoBarra, txtCantInicial);
            UtilityFrm.limpiarTextbox(txtPrecio);
            UtilityFrm.limpiarErrorProvider(txtPrecio,txtNombreConfig,txtCantInicial, errorIcono);
            isEditar = false;
            isNuevo = false;
        }
        private void btnGuardar_Click(object sender, EventArgs e)
        {
           
            try
            {
                string respuesta = "";

                //si el string es nulo o vacio 
                if (String.IsNullOrEmpty(txtNombreConfig.Text) || String.IsNullOrEmpty(txtPrecio.Text) || String.IsNullOrEmpty(txtCantInicial.Text))
                {
                    UtilityFrm.mensajeError("Hay Campos sin completar,rellene y vuelva a intentarlo");
                   
                    if(txtNombreConfig.Text.Length==0){ errorIcono.SetError(txtNombreConfig, "Ingrese un Nombre de Producto");}
                    if (txtPrecio.Text.Length == 0) { errorIcono.SetError(txtPrecio, "Ingrese un Precio"); }
                    if (txtCantInicial.Text.Length == 0) { errorIcono.SetError(txtCantInicial, "Ingrese una Cantidad Inicial"); }    
                    
                
                }
                else
                {
                    int pesable = cbxPesable.Checked == true ? 1 : 0;
                    if (isNuevo == true)
                    {
                        //pesable es un bit que representa un producto si es pesable (KG) o no
                       
                        respuesta = NegocioArticulo.insertar(txtNombreConfig.Text.Trim(), txtCodigoBarra.Text.Trim(), txtDescripcion.Text.Trim(), Convert.ToInt32(cbxCategoria.SelectedValue), Convert.ToDecimal(txtPrecio.Text.Trim()),Convert.ToInt32(txtCantInicial.Text.Trim()),pesable);

                        if (respuesta.Equals("ok"))
                        {
                            UtilityFrm.mensajeConfirm("Se Agregó Correctamente");
                            this.mostrar();
                            isEditar = false;
                            isNuevo = false;
                            UtilityFrm.limpiarErrorProvider(txtCantInicial,txtNombreConfig,txtPrecio,errorIcono);
                        }
                       


                    }
                    //si se va a editar
                    else if (isEditar == true)
                    {

                        //respuesta = NegocioArticulo.editar(Convert.ToInt32(txtCodigo.Text.Trim()), Convert.ToString(txtNombreConfig.Text.Trim()), txtCodigoBarra.Text.Trim(), Convert.ToString(txtDescripcion.Text.Trim()), Convert.ToInt32(cbxCategoria.SelectedValue));
                        respuesta = NegocioArticulo.editar(Convert.ToInt32(txtCodigo.Text.Trim()), Convert.ToString(txtNombreConfig.Text.Trim()), txtCodigoBarra.Text.Trim(), Convert.ToString(txtDescripcion.Text.Trim()), Convert.ToInt32(cbxCategoria.SelectedValue), Convert.ToDecimal(txtPrecio.Text.Trim()),Convert.ToInt32(txtCantInicial.Text.Trim()),pesable);

                        if (respuesta.Equals("ok"))
                        {
                            UtilityFrm.mensajeConfirm("Se Editó Correctamente");
                            this.mostrar();
                            isEditar = false;
                            isNuevo = false;

                        }
                       

                    }
                    else
                    {
                        UtilityFrm.mensajeError("No se ha podido guardar: " + respuesta);

                    }

                    //habilito el codigo para poder editar
                    btnCancelar.Enabled = false;
                    btnGuardar.Enabled = false;
                    btnNuevo.Enabled = true;
                    errorIcono.Clear();
                    txtPrecio.Enabled = false;
                    txtDescripcion.Enabled = false;
                    txtCodigoBarra.Enabled = false;
                    txtNombreConfig.Enabled = false;
                    txtCantInicial.Enabled = false;
                    cbxCategoria.Enabled=false;
                    btnNuevoCodBar.Enabled = false;
                    this.cbxPesable.Enabled = false;
                    UtilityFrm.limpiarTextbox(txtDescripcion, txtNombreConfig, txtNombre, txtCodigo, txtCodigoBarra, txtCantInicial);
                    UtilityFrm.limpiarTextbox(txtPrecio);
                    UtilityFrm.limpiarErrorProvider(txtCantInicial, txtPrecio, txtNombreConfig,errorIcono);
                    this.btnNuevo.Focus();

                }



            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("error: " + ex.Message + " ;" + ex.StackTrace);
                isEditar = false;
                isNuevo = false;
            }
            

        }
        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Seguro que desea Editar?", "Editar"
                , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
            {
                this.btnNuevo.Enabled = false;
                this.cbxCategoria.Enabled = true;
                this.btnCancelar.Enabled = true;
                this.btnGuardar.Enabled = true;
                this.btnEditar.Enabled = false;
                this.btnNuevoCodBar.Enabled = true;
                txtPrecio.Enabled = true;
                txtNombreConfig.Enabled = true;
                txtCodigoBarra.Enabled = true;
                txtDescripcion.Enabled = true;
                txtCantInicial.Enabled = false;
                txtPrecio.Enabled = true;
                cbxPesable.Enabled = true;
                isEditar = true;
                isNuevo = false;
                //habilitarTextbox();


            }
        }
        private void btnEliminar_Click(object sender, EventArgs e)
        {
            string respuesta = "";
            try
            {

                //si la respuesta es si elimina la fila actual
                if (MessageBox.Show("Seguro que desea Eliminar?", "Eliminar"
                   , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
                {
                    /*eliminar varias categoria*/
                    if (chkEliminar.Checked == true)
                    {
                        foreach (DataGridViewRow row in dataLista.Rows)
                        {
                            //Si la fila esta marcada lo elimina
                            if (Convert.ToBoolean(row.Cells[0].Value))
                            {

                                //le paso el idcategoria para poder eliminarlo
                                respuesta = NegocioArticulo.eliminar(Convert.ToInt32(row.Cells[1].Value));
                                if (respuesta.Equals("ok"))
                                {
                                    UtilityFrm.mensajeConfirm(row.Cells[3].Value.ToString() +" Se Eliminó Correctamente");
                                }
                                else
                                {

                                    UtilityFrm.mensajeError("Error: " + respuesta);
                                }

                            }
                        }


                    }
                    else
                    {
                        /*eliminar un solo producto*/
                        respuesta = NegocioArticulo.eliminar(Convert.ToInt32(this.dataLista.CurrentRow.Cells[1].Value));
                        if (respuesta.Equals("ok"))
                        {
                            UtilityFrm.mensajeConfirm(dataLista.CurrentRow.Cells[3].Value.ToString() + " se eliminó correctamente");
                        }
                        else
                        {

                            UtilityFrm.mensajeError("Error: " + respuesta);
                        }


                    }
                    mostrar();
                }
                //desabilito el checkbox y el boton eliminar
                chkEliminar.Checked = false;
                btnEliminar.Enabled = false;
            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("Error: " + respuesta + ", " + ex.Message);
            }

        }       
      
        
        //checkBox
        private void chkEliminar_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEliminar.Checked == true)
            {
                this.dataLista.Columns[0].Visible = true;

            }
            else
            {
                this.dataLista.Columns[0].Visible = false;
            }
        }

        //TabControl
        private void tabControl1_Selected_1(object sender, TabControlEventArgs e)
        {
            //si selecciono el tabLista borro los textbox y button
            if (tabControl1.SelectedIndex == 0)
            {
                txtCodigo.Text = string.Empty;
                txtCodigoBarra.Text = string.Empty;
                txtDescripcion.Text = string.Empty;
                txtNombreConfig.Text = string.Empty;
                txtPrecio.Text = string.Empty;
                txtCantInicial.Text= string.Empty;
                cbxCategoria.Enabled = false;
                btnEditar.Enabled = false;
                btnNuevo.Enabled = true;
                btnGuardar.Enabled = false;
                btnCancelar.Enabled = false;
                txtPrecio.Enabled = false;
                txtCantInicial.Enabled = false;
                txtNombreConfig.Enabled = false;
                txtCodigoBarra.Enabled = false;
                txtDescripcion.Enabled = false;
                btnNuevoCodBar.Enabled = false;
                errorIcono.Clear();

                this.txtNombre.Select();

                this.txtNombre.Focus();
            }
            if (tabControl1.SelectedIndex == 1)
            {
                btnEliminar.Enabled = false;
            }
        }
       
        //lista de datos
        private void dataLista_DoubleClick(object sender, EventArgs e)
        {
            this.btnNuevo.Enabled = false;
            this.btnEditar.Enabled = true;
            this.btnCancelar.Enabled = true;
            string temporal = string.Empty;
            
            //para editar categoria lleva a la caja de texto de configuracion
            txtCodigo.Text = Convert.ToString(this.dataLista.CurrentRow.Cells["idarticulo"].Value);
            txtCodigoBarra.Text = Convert.ToString(this.dataLista.CurrentRow.Cells["codigo"].Value);
            cbxCategoria.SelectedValue = Convert.ToString(this.dataLista.CurrentRow.Cells["idcategoria"].Value);
            txtNombreConfig.Text = Convert.ToString(this.dataLista.CurrentRow.Cells["nombre"].Value);
            txtDescripcion.Text = Convert.ToString(this.dataLista.CurrentRow.Cells["descripcion"].Value);
            decimal precio = 0;
            precio = Convert.ToDecimal(this.dataLista.CurrentRow.Cells["precio"].Value);
            
            txtPrecio.Text = Convert.ToString(Decimal.Round(precio,2));
            txtCantInicial.Text = Convert.ToString(this.dataLista.CurrentRow.Cells["stock_actual"].Value);
          

            this.tabControl1.SelectedTab = tabConfiguracion;
        }
        private void dataLista_Click_1(object sender, EventArgs e)
        {
            btnEliminar.Enabled = true;
        }
        private void dataLista_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try {	        
            //se produce un evento cuando hago click en la columna 0 que es eliminar de la lista
            //se comparan el indice de columna de la lista =0 y el indice de la columna del evento=0
                if (e.ColumnIndex == dataLista.Columns[0].Index && e.RowIndex>= 0)
            {
                //creo una datagridviewrow para guarda los datos de la fila actual
                DataGridViewRow fila = dataLista.Rows[e.RowIndex];
                //creo un checkboxcell para obtener el checkbox seleccionado
                DataGridViewCheckBoxCell tildado = (DataGridViewCheckBoxCell)fila.Cells[0];


                if (Convert.ToBoolean(tildado.Value) == true)
                {
                    //si el valor de tildado es null es true y se desactiva 
                    tildado.Value = CheckState.Unchecked;

                }
                else
                {
                    //caso contrario se activa
                    tildado.Value = CheckState.Checked;
                }

              }
           }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("Has seleccionado una Opcion Incorrecta, el Origen es: " + ex.Message);
               
            }
        }

        private void txtCodigoBarra_KeyDown(object sender, KeyEventArgs e)
        {
            //comparo el evento pasado como parametro y el enum keys.enter
            if (e.KeyCode == Keys.Enter)
            {
                this.txtNombreConfig.Focus();
                //se pasa el control permitiendo eliminar el beep
                e.SuppressKeyPress = true;
            }
        }

        private void txtNombreConfig_KeyDown(object sender, KeyEventArgs e)
        {
            //comparo el evento pasado como parametro y el enum keys.enter
            if (e.KeyCode == Keys.Enter)
            {
                this.txtDescripcion.Focus();
                //se pasa el control permitiendo eliminar el beep
                e.SuppressKeyPress = true;
            }
        }

        private void cbxCategoria_KeyDown(object sender, KeyEventArgs e)
        {
            //comparo el evento pasado como parametro y el enum keys.enter
            if (e.KeyCode == Keys.Enter)
            {
                this.txtPrecio.Focus();
                //se pasa el control permitiendo eliminar el beep
                e.SuppressKeyPress = true;
            }
        }

     

        private void tabConfiguracion_Click(object sender, EventArgs e)
        {
            this.btnNuevo.Focus();
        }

        private void tabConfiguracion_MouseClick(object sender, MouseEventArgs e)
        {
            this.btnNuevo.Focus();
        }


        

        private void btnGenerarCodigo_Click(object sender, EventArgs e)
        {
            FrmEtiquetas codigoBarra = new FrmEtiquetas();
            codigoBarra.ShowDialog();
        }

        private void txtPrecio_KeyDown(object sender, KeyEventArgs e)
        {
         
            //comparo el evento pasado como parametro y el enum keys.enter
            if (e.KeyCode == Keys.Enter)
            {
                if (txtCantInicial.Enabled == true)
                {
                    
                    txtCantInicial.Focus();
                }
                else {

                    this.btnGuardar.Focus();
                
                }

                //si el usuario no ingreso los decimales se agregan los ceros correspondientes
                if (txtPrecio.Text.Length > 0 && !txtPrecio.Text.Contains(","))
                {
                    txtPrecio.Text += ",00";

                }
                //se pasa el control permitiendo eliminar el beep
                e.SuppressKeyPress = true;
            }
        }

        private void btnGenerar_Click(object sender, EventArgs e)
        {
            FrmCodigoBarraExistente codBarra;
            if (txtCodigoBarra.Text.Length > 0)
            {
                codBarra = new FrmCodigoBarraExistente(txtCodigoBarra.Text);
                codBarra.ShowDialog();

            }
            else {
                 codBarra = new FrmCodigoBarraExistente();
                codBarra.ShowDialog();
            }
           
            //si no cerro cambio el textbox txtcodigobarra
            if(!codBarra.IsCerro){

                txtCodigoBarra.Text = codBarra.CodigoDeBarra;
            }
            

        }

        private void btnImprimir_Click(object sender, EventArgs e)
        {
            
            FrmImpArticulo impArt = new FrmImpArticulo(dataLista);
            impArt.ShowDialog();
            
        }


       

        private void txtPrecio_KeyPress(object sender, KeyPressEventArgs e)
        {
            //solo valores numericos

            UtilityFrm.NumDecTeclado(e,txtPrecio);
        }

        private void txtCodigoBarra_KeyPress(object sender, KeyPressEventArgs e)
        {
            UtilityFrm.NumTeclado(e, txtCodigoBarra);
        }

        private void txtPrecio_TextChanged(object sender, EventArgs e)
        {
            UtilityFrm.limpiarErrorProvider(txtPrecio,errorIcono);
            if (txtPrecio.Text.Length > 0 && txtPrecio.Text[0] == ',')
            {
                
                txtPrecio.Text = "";
            }
            else if(txtPrecio.Text.Length==0) {
                errorIcono.SetError(txtPrecio,"Es necesario un valor Numerico en el campo Precio");
            }
        }

        private void txtCantInicial_KeyPress(object sender, KeyPressEventArgs e)
        {
            UtilityFrm.NumTeclado(e,txtCantInicial);
        }

        private void txtCodigoBarra_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtCantInicial_TextChanged(object sender, EventArgs e)
        {
            UtilityFrm.limpiarErrorProvider(txtCantInicial, errorIcono);
            if(txtCantInicial.Text.Length==0) {
                errorIcono.SetError(txtCantInicial,"Es necesario un valor Numerico en el campo Cantidad Inicial");
            }
        }

        private void txtNombreConfig_TextChanged(object sender, EventArgs e)
        {
            UtilityFrm.limpiarErrorProvider(txtNombreConfig, errorIcono);
            if (txtNombreConfig.Text.Length == 0)
            {
                errorIcono.SetError(txtNombreConfig, "Es necesario un nombre de producto");
            }
        }

        private void rdbNombre_CheckedChanged(object sender, EventArgs e)
        {
            txtNombre.Focus();
        }

        private void rdbCodigoBarra_CheckedChanged(object sender, EventArgs e)
        {
            txtNombre.Focus();
        }

        private void rbCategoria_CheckedChanged(object sender, EventArgs e)
        {
            txtNombre.Focus();
        }

        private void txtDescripcion_KeyDown(object sender, KeyEventArgs e)
        {
            //comparo el evento pasado como parametro y el enum keys.enter
            if (e.KeyCode == Keys.Enter)
            {
                this.cbxCategoria.Focus();
                //se pasa el control permitiendo eliminar el beep
                e.SuppressKeyPress = true;
            }
        }

        private void FrmArticulos_KeyDown(object sender, KeyEventArgs e)
        {
            //comparo el evento pasado como parametro y el enum keys.enter
            if (e.KeyCode == Keys.F1)
           {
                this.txtNombre.Focus();
                txtNombre.Text = "";
               
            }
        }

        private void txtNombre_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Up)
            {
                //pasa a la lista el foco 
                dataLista.Focus();

            }
            if (e.KeyCode == Keys.Down)
            {
                //pasa a la lista el foco 
                dataLista.Focus();

            }
        }

        private void txtCantInicial_KeyDown(object sender, KeyEventArgs e)
        {
            //comparo el evento pasado como parametro y el enum keys.enter
            if (e.KeyCode == Keys.Enter)
            {
                //this.btnGuardar.Focus();
                this.cbxPesable.Focus();
                //se pasa el control permitiendo eliminar el beep
                e.SuppressKeyPress = true;
            }
        }

        private void txtCodigo_TextChanged(object sender, EventArgs e)
        {

        }

        private void panelHorizontal_Paint(object sender, PaintEventArgs e)
        {

        }

        private void cbxPesable_KeyDown(object sender, KeyEventArgs e)
        {
            //comparo el evento pasado como parametro y el enum keys.enter
            if (e.KeyCode == Keys.Enter)
            {
                this.btnGuardar.Focus();

                //se pasa el control permitiendo eliminar el beep
                e.SuppressKeyPress = true;
            }
        }

        private void tabLista_Click(object sender, EventArgs e)
        {

        }
        
       


          
    }
}
