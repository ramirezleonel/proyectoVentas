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
    public partial class FrmCaja : Form
    {
        

        private string ingegr;

        private long valoringreso;

        private long valoregreso;

        private DateTimePicker  fecha;

        public FrmCaja()
        {
            
            InitializeComponent();
        }

        private void btnCierreX_Click(object sender, EventArgs e)
        {
         
            
           
          

        }

        private void btnCierreZ_Click(object sender, EventArgs e)
        {
            try
            {
          
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error de impresión, Causa:"+ex);
            }
            
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            
            Negociocaja objcaja = new Negociocaja();
            FrmAperturacaja objformapcaja = new FrmAperturacaja();
            objcaja.extrestadocaja(1, "");
            if (objcaja.Fecha.Substring(0, 10) == dtpFechaCaja.Value.ToString("dd/MM/yyyy"))
            {
                MessageBox.Show("La caja del dia de la fecha se encuentra cerrada");

            }
            else
            {
                objformapcaja.ShowDialog();
                refrescarcaja(Convert.ToString(DateTime.Today));
                objcaja.extrestadocaja(1, "");
                estadoabicerrada(objcaja.Codcuenta);
            }
           
            

        }

        //muestra en el combobox los resultados cargados en tipo movimiento de caja
        private void llenarComboBoxTipoMovimiento()
        {
           

            
            this.cbTipoMov.DataSource = Negociocaja.mostrartipomov(6,0, ingegr);
            //valor real de la DB
            this.cbTipoMov.ValueMember = "Codtipomov";
            //lo que se muestra
            this.cbTipoMov.DisplayMember = "Nombre";

        }

        //muestra en el combobox los resultados cargados en tipo movimiento de caja
        private void llenarComboBoxPlancuenta()
        {
            
            if (cbTipoMov.ValueMember != "")
            {
                this.cbxPlanCuenta.DataSource = Negociocaja.mostrartipomov(5, Convert.ToInt32(cbTipoMov.SelectedValue), " ");
            
            }
            
             
            //valor real de la DB
            this.cbxPlanCuenta.ValueMember = "Codigo_Plan";
            //lo que se muestra
            this.cbxPlanCuenta.DisplayMember = "Cuenta";

        }

        private void buscarporfecha()
        
        {
            {
                try
                {
                    this.dataLista.DataSource = Negociocaja.buscarmovimiento ( Convert.ToString  ( this.dtpFechaCaja.Text));
                }

                catch (Exception ex)
                {
                    UtilityFrm.mensajeError("Error Con Base de Datos :" + ex.Message);

                }
                //datasource el origen de los datos 

                //oculto las dos primeras columnas
               // this.ocultarColumnas();
                //muestro el total de las categorias
                lblTotal.Text = "Total de Registros: " + Convert.ToString(dataLista.RowCount);

            }     
           
        }

        private void grpboxConsulta_Enter(object sender, EventArgs e)
        {

        }

        private void FrmCaja_Load(object sender, EventArgs e)
        {
            //fecha =  DateTime.Now;
           
            checkradioingegr();
            
            llenarComboBoxTipoMovimiento();
            
            Negociocaja objcaja = new Negociocaja();
            objcaja.extrestadocaja(1,"");

            if (objcaja.Fecha.Substring (0,10) != dtpFechaCaja.Value.ToString ("dd/MM/yyyy"))
            {
                if (objcaja.Codcuenta == 9100001)
                {
                    DialogResult dialogResult = MessageBox.Show("La caja se encuentra abierta de una fecha anterior, desea cerrarla?", "Caja abierta", MessageBoxButtons.YesNo);
                    if (dialogResult == DialogResult.Yes)
                    {
                        FrmCerrarCaja  objcerrar = new FrmCerrarCaja ();
                        objcerrar.ShowDialog();
                        
                    }
                    else if (dialogResult == DialogResult.No)
                    {
                        //do something else
                    }
                
                }
            
            }

            if (objcaja.Codcuenta == 9100002)
            {
                if (objcaja.Fecha.Substring(0, 10) == dtpFechaCaja.Value.ToString("dd/MM/yyyy"))
                {
                    MessageBox.Show("La caja del dia de hoy esta cerrada");
                }
                else
                {
                    DialogResult dialogResult = MessageBox.Show("La caja se encuentra cerrada, desea abrirla?", "Caja cerrada", MessageBoxButtons.YesNo);
                    if (dialogResult == DialogResult.Yes)
                    {
                        FrmAperturacaja objapertura = new FrmAperturacaja();
                        objapertura.ShowDialog();
                    }
                }
                //  else if (dialogResult == DialogResult.No)
               // {
                    //do something else
               // }
                
                
            }
            estadoabicerrada(objcaja.Codcuenta);
            refrescarcaja(Convert.ToString(DateTime.Today));
            totales();
        }

        private void cbTipoMov_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            llenarComboBoxPlancuenta();
        }

        private void rbIngreso_CheckedChanged(object sender, EventArgs e)
        {

            checkradioingegr();
           

        }

        private void rbEgreso_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void checkradioingegr()
        {
            if (rbIngreso.Checked == true)
            {
                ingegr = "I";
            }

            if (rbEgreso.Checked == true)
            {
                ingegr = "E";
            }
            
            llenarComboBoxTipoMovimiento();
              
        
        }

        private void BtnCerrar_Click(object sender, EventArgs e)
        {
            FrmCerrarCaja objcerrar = new FrmCerrarCaja();
            objcerrar.ShowDialog();
            refrescarcaja(Convert.ToString(DateTime.Today));
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
           string rpta = Negociocaja.insertarmovcaja(Convert.ToInt32(cbxPlanCuenta.SelectedValue), (rbIngreso.Checked == true) ? Convert.ToSingle  (textBox2.Text) : 0,
                (rbEgreso.Checked == true) ? Convert.ToSingle  (textBox2.Text) : 0,Convert.ToString ( DateTime.Today ), "usuario", 1, "mañana",
                TxtConcepto.Text,0,true );
            refrescarcaja(Convert.ToString ( DateTime.Today));
        
        }

        public void refrescarcaja(string fecha)
        {


           // DateTimePicker fecha = new DateTimePicker();
            
            dataLista.DataSource = Negociocaja.buscarmovimiento(fecha);

            dataLista.AutoResizeColumns();
            dataLista.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
           // dataLista.Columns[0].Width = 20;
            
            //Cod_mov,Cod_cuenta,Concepto,Fecha ,Comprobante,Ingreso,Egreso,Turno
           
        }

        private void dtpFechaCaja_KeyPress(object sender, KeyPressEventArgs e)
        {
           
        }

        private void dtpFechaCaja_KeyDown(object sender, KeyEventArgs e)
        {
            
            if (e.KeyCode == Keys.Enter)
            {

                refrescarcaja (dtpFechaCaja.Value.ToString ("dd/MM/yyyy"));
                totales(); 
            }
        }

        private void totales()
        {
          float   varingreso = 0;
          float   varegreso = 0;


            foreach (DataGridViewRow row in dataLista.Rows)
            {
                
                varingreso  = varingreso  + Convert.ToSingle(row.Cells["ingreso"].Value);
                varegreso = varegreso + Convert.ToSingle(row.Cells["egreso"].Value);
            }
            float total = varingreso - varegreso;
            txtTotalIngreso.Text = varegreso.ToString()  ;
            txtToltaEgreso.Text  = varingreso.ToString () ;
            txtTotal.Text = total.ToString();
           
            // Convert.ToSingle ( txtTotalIngreso.Text  ), Convert.ToSingle ( txtToltaEgreso.Text ), Convert.ToSingle ( txtTotal.Text )
        }
        private void estadoabicerrada(long codcuenta)
        {
            if (codcuenta == 9100001)
            {
                botonhabdes(false, true);
            }

            if (codcuenta  == 9100002)
            {
                botonhabdes(true, false);

            }
        
        }

        private void botonhabdes(bool habloq1, bool habloq2)
        { 
          
          BtnApertura.Enabled = habloq1;
          BtnCerrar.Enabled = habloq2;
          btnAgregar.Enabled = habloq2;

        }

        private void dtpFechaCaja_ValueChanged(object sender, EventArgs e)
        {

        }

        private void dataLista_MouseClick(object sender, MouseEventArgs e)
        {
            
            if (e.Button == MouseButtons.Right)
            {

                contextMenuStrip1.Show(dataLista, new Point(e.X, e.Y));
                
             
            } 
        }

        private void dataLista_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Menudelete_Click(object sender, EventArgs e)
        {
            Negociocaja objcaja = new Negociocaja();
            bool eliminar = true;

            DataGridViewRow row = dataLista.CurrentRow;
            if (9100001 == Convert.ToInt32(row.Cells["Cod_cuenta"].Value.ToString()))
            {
                MessageBox.Show("No se puede eliminar la apertura");
                eliminar = false;
            }
            
            
            else
            {
                if (9100002 == Convert.ToInt32(row.Cells["Cod_cuenta"].Value.ToString()))
                {
                    objcaja.extrestadocaja(1, "");
                    if (Convert.ToInt32(row.Cells["Cod_mov"].Value.ToString()) != objcaja.Codmov)
                    {
                        MessageBox.Show("No se puede eliminar este cierre");
                        eliminar = false;
                    }

                }
                if (eliminar == true)
                {
                    DialogResult dialogResult = MessageBox.Show("Seguro que quiere eliminar el movimiento?", "Precaucion", MessageBoxButtons.YesNo);
                    if (dialogResult == DialogResult.Yes)
                    {
                        string rta = Negociocaja.eliminar(Convert.ToInt32(row.Cells["Cod_mov"].Value.ToString()));
                        if (rta == "ok")
                        {
                            MessageBox.Show("Se elimino correctamente");

                        }

                    }

                }

            }
            refrescarcaja(dtpFechaCaja.Value.ToString("dd/MM/yyyy"));
            objcaja.extrestadocaja(1, "");
            estadoabicerrada(objcaja.Codcuenta);
        }
    
    }
}
