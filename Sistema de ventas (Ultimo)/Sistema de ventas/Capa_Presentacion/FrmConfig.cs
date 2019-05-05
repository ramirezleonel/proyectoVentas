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
using System.IO;
using System.Drawing.Imaging;
namespace Capa_Presentacion
{
    public partial class FrmConfig : Form
    {
        public FrmConfig()
        {
            InitializeComponent();
        }
        private void FrmConfig_Load(object sender, EventArgs e)
        {
            this.mostrarDatos();
           
           
        }

        private void mostrarDatos()
        {
 
            try
            {
                DataTable dt = NegocioConfigEmpresa.mostrar();
                if (dt.Rows.Count == 1)
                {

                    foreach (DataRow item in dt.Rows)
                    {
                       txtRazonSocial.Text=item["razon_social"].ToString();
                       txtCuit.Text = item["cuit"].ToString();
                       cbxCondicionFrenteIVA.Text = item["condicion_frente_iva"].ToString();
                        
                    }

                }
                else
                {
                    UtilityFrm.mensajeError("No existen Datos de la Empresa Cargados");
                    
                    this.activarControles();
                }
            
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error: "+ex.Message+" "+ex.StackTrace);
            }
           
        }



      
        public void desactivarControles(){
            txtRazonSocial.ReadOnly = true;
            cbxCondicionFrenteIVA.Enabled = false;
            txtCuit.ReadOnly = true;
            btnAgregarImagen.Enabled = false;
            btnEliminarLogo.Enabled = false;
            
        }
        public void activarControles()
        {
            txtRazonSocial.ReadOnly = false;
            cbxCondicionFrenteIVA.Enabled = true;
            txtCuit.ReadOnly = false;
            btnAgregarImagen.Enabled = true;
            btnEliminarLogo.Enabled = true;
            txtRazonSocial.Focus();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            activarControles();
            btnEditar.Enabled = false;
            btnGuardar.Enabled = true;
            btnCancelar.Enabled = true;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            desactivarControles();
            btnEditar.Enabled = true;
            btnGuardar.Enabled = false;
            btnCancelar.Enabled = false;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {

            try
            {
                desactivarControles();
                btnEditar.Enabled = true;
                btnGuardar.Enabled = false;
                btnCancelar.Enabled = false;
                MemoryStream ms= new MemoryStream();
                pbxLogo.Image.Save(ms,ImageFormat.Jpeg);

               string respuesta= NegocioConfigEmpresa.agregar(txtRazonSocial.Text, cbxCondicionFrenteIVA.SelectedText, Convert.ToInt64( txtCuit.Text),ms.GetBuffer());
               if (respuesta.Equals("ok"))
               {
                   UtilityFrm.mensajeConfirm("Se Agregó Correctamente");
               }
               else {

                   UtilityFrm.mensajeError(respuesta);
               
               }
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error:"+ex.Message );
            }
           
        }

        private void btnAgregarImagen_Click(object sender, EventArgs e)
        {
            try
            {
                OpenFileDialog open = new OpenFileDialog();
                if (open.ShowDialog() == DialogResult.OK)
                {
                    string imagen = open.FileName;
                    pbxLogo.Image = Image.FromFile(imagen);
                    
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("El archivo seleccionado no es un tipo de imagen válido, "+ex.Message);
            }
        }

        private void btnEliminarLogo_Click(object sender, EventArgs e)
        {

        }
    }
}
