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
        private bool datos=false;
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
                    //si hay datos el boolean datos se pone a true
                    datos = true;
                    foreach (DataRow item in dt.Rows)
                    {
                       txtRazonSocial.Text=item["razon_social"].ToString();
                       txtCuit.Text = item["cuit"].ToString();
                       cbxCondicionFrenteIVA.Text = item["condicion_frente_iva"].ToString();
                       string imagen1 = item["logo"].ToString();
                       if (item["logo"].ToString() != "" && item["logo"].ToString() != "null")
                       {
                            byte[] imagen = (byte[])(item["logo"]);
                          
                            MemoryStream ms = new MemoryStream(imagen);
                            pbxLogo.Image = Image.FromStream(ms);           
                        }
                       
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
            if (MessageBox.Show("Seguro que desea Modificar los datos de su empresa? , esto podria ocasionar un cambio al momento de efectuar la venta", "Modificar"
                , MessageBoxButtons.YesNo, MessageBoxIcon.Hand) == DialogResult.Yes)
            {
                activarControles();
                btnEditar.Enabled = false;
                btnGuardar.Enabled = true;
                btnCancelar.Enabled = true;
            }
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
                long cuit = txtCuit.Text == string.Empty ? 0 : Convert.ToInt64(txtCuit.Text);
                string respuesta;

                if (datos == true)
                {
                    if (pbxLogo.Image != null)
                    {
                        pbxLogo.Image.Save(ms, ImageFormat.Jpeg);

                        respuesta = NegocioConfigEmpresa.modificar(txtRazonSocial.Text, "", cuit, ms.GetBuffer());
                    }
                    else
                    {
                        respuesta = NegocioConfigEmpresa.modificar(txtRazonSocial.Text, "", cuit, null);


                    }


                    if (respuesta.Equals("ok"))
                    {
                        UtilityFrm.mensajeConfirm("Se Agregó Correctamente");
                        datos = true;
                    }
                    else
                    {

                        UtilityFrm.mensajeError(respuesta);
                        
                    }

                }
                else
                {
                    if (pbxLogo.Image != null)
                    {
                        pbxLogo.Image.Save(ms, ImageFormat.Jpeg);

                        respuesta = NegocioConfigEmpresa.agregar(txtRazonSocial.Text, "", cuit, ms.GetBuffer());

                    }
                    else
                    {
                        respuesta = NegocioConfigEmpresa.agregar(txtRazonSocial.Text, "", cuit, null);


                    }


                    if (respuesta.Equals("ok"))
                    {
                        UtilityFrm.mensajeConfirm("Se Agregó Correctamente");
                        datos = true;
                    }
                    else
                    {

                        UtilityFrm.mensajeError(respuesta);
                      
                    }
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
            pbxLogo.Image.Dispose();
            pbxLogo.Image = null;
        }
    }
}
