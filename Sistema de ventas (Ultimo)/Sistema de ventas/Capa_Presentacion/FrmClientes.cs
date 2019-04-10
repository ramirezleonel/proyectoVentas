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
    public partial class FrmClientes : Form
    {
         bool isEditar = false;
         bool isNuevo = false;
        public FrmClientes()
        {
            InitializeComponent();
        }

        private void FrmClientes_Load(object sender, EventArgs e)
        {
            isEditar = false;
            isNuevo = false;
            this.txtNombre.Focus();
            ocultarColumnas();
            mostrar();

        }

        //metodos propios
        private void mostrar()
        {
            try
            {
                this.dataLista.DataSource = NegocioCliente.mostrar();
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
                this.dataLista.DataSource = NegocioCliente.buscar(this.txtNombre.Text);
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

        //botones

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.BuscarNombre();
            UtilityFrm.limpiarTextbox(txtDireccion, txtRazonSocial, txtCodigo, txtCuit, txtDocumento);
            UtilityFrm.limpiarTextbox(txtTelefono, txtEmail);
        }

        private void txtNombre_TextChanged(object sender, EventArgs e)
        {
            this.BuscarNombre();
            UtilityFrm.limpiarTextbox(txtDireccion, txtRazonSocial, txtCodigo, txtCuit, txtDocumento);
            UtilityFrm.limpiarTextbox(txtTelefono, txtEmail);
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            //limpio textbox
            UtilityFrm.limpiarTextbox(txtDireccion, txtRazonSocial, txtNombre, txtCodigo, txtCuit, txtDocumento);
            UtilityFrm.limpiarTextbox(txtTelefono, txtEmail);


            //habilitar botones
            this.btnGuardar.Enabled = true;
            this.btnEditar.Enabled = false;
            this.btnCancelar.Enabled = true;
            this.btnNuevo.Enabled = false;


            //habilitar textbox
            this.txtDireccion.Enabled = true;
            this.txtRazonSocial.Enabled = true;
            this.txtNombre.Enabled = true;
            this.txtCodigo.Enabled = true;
            this.txtCuit.Enabled = true;
            this.txtDocumento.Enabled = true;
            this.txtTelefono.Enabled = true;
            this.txtEmail.Enabled = true;
            this.dtimeFechaNacimiento.Enabled = true;

            this.txtRazonSocial.Focus();
            isEditar = false;
            isNuevo = true;
          
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            btnNuevo.Enabled = true;
            btnEditar.Enabled = false;
            btnGuardar.Enabled = false;
            btnCancelar.Enabled = false;

            this.txtCodigo.Enabled = false;
            this.txtCuit.Enabled = false;
            this.txtDireccion.Enabled = false;
            this.txtDocumento.Enabled = false;
            this.txtEmail.Enabled = false;
            this.txtRazonSocial.Enabled = false;
            this.txtTelefono.Enabled = false;
            this.dtimeFechaNacimiento.Enabled = false;
            //limpio textbox
            UtilityFrm.limpiarTextbox(txtDireccion, txtRazonSocial, txtNombre, txtCodigo, txtCuit, txtDocumento);
            UtilityFrm.limpiarTextbox(txtTelefono, txtEmail);
            isEditar = false;
            isNuevo = false;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string respuesta = "";

                //si el string es nulo o vacio 
                if (String.IsNullOrEmpty(txtRazonSocial.Text))
                {
                    UtilityFrm.mensajeError("El Campo Nombre está incompleto");
                    errorIcono.SetError(txtRazonSocial, "Ingrese un nombre");

                }
                else
                {

                    if (isNuevo == true)
                    {
                        //variables locales para almacenar los datos vacios
                        int telefono = 0;
                        int cuit = 0;
                        int documento = 0;
                        if(txtTelefono.Text==string.Empty){
                            txtTelefono.Text = telefono.ToString();

                        }
                        if (txtCuit.Text == string.Empty)
                        {
                            txtCuit.Text = cuit.ToString();

                        }
                        if (txtDocumento.Text == string.Empty)
                        {
                            txtDocumento.Text = documento.ToString();

                        }
           
                        respuesta = NegocioCliente.insertar(txtRazonSocial.Text.Trim(), txtDireccion.Text.Trim(), Convert.ToInt64(txtCuit.Text.Trim()), dtimeFechaNacimiento.Value, Convert.ToInt32(txtTelefono.Text.Trim()), Convert.ToInt32(txtDocumento.Text.Trim()),txtEmail.Text.Trim());

                        if (respuesta.Equals("ok"))
                        {
                            UtilityFrm.mensajeConfirm("Se Agregó Correctamente");
                            this.mostrar();
                        }
                        else
                        {
                            UtilityFrm.mensajeError("No se ha podido guardar: " + respuesta);
                        }


                    }
                    //si se va a editar
                    else if (isEditar == true)
                    {

                        //respuesta = NegocioArticulo.editar(Convert.ToInt32(txtCodigo.Text.Trim()), Convert.ToString(txtNombreConfig.Text.Trim()), txtCodigoBarra.Text.Trim(), Convert.ToString(txtDescripcion.Text.Trim()), Convert.ToInt32(cbxCategoria.SelectedValue));
                        respuesta = NegocioCliente.editar(Convert.ToInt32(txtCodigo.Text.Trim()), txtRazonSocial.Text.Trim(), txtDireccion.Text.Trim(), Convert.ToInt32(txtCuit.Text.Trim()), dtimeFechaNacimiento.Value, Convert.ToInt32(txtTelefono.Text.Trim()), Convert.ToInt32(txtDocumento.Text.Trim()), txtEmail.Text.Trim());

                        if (respuesta.Equals("ok"))
                        {
                            UtilityFrm.mensajeConfirm("Se Editó Correctamente");
                            this.mostrar();


                        }
                        else
                        {
                            UtilityFrm.mensajeError("No se ha podido guardar: " + respuesta);

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
                    txtCodigo.Enabled = false;
                    txtEmail.Enabled = false;
                    txtNombre.Enabled = false;
                    txtRazonSocial.Enabled = false;
                    txtTelefono.Enabled = false;
                    UtilityFrm.limpiarTextbox(txtCodigo,
                    txtEmail,txtNombre,txtRazonSocial,txtTelefono);
                    this.btnNuevo.Focus();

                }



            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("error: " + ex.Message + " ;" + ex.StackTrace);
            }
            isEditar = false;
            isNuevo = false;
        }

        
    }
}
