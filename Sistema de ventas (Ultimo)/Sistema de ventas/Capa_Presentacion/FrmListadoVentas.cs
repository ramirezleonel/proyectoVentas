using Capa_negocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Capa_Presentacion
{
    public partial class FrmListadoVentas : Form
    {
        public FrmListadoVentas()
        {
            InitializeComponent();
        }

        private void FrmListadoVentas_Load(object sender, EventArgs e)
        {
            this.mostrar();
            this.actualizarTotal();
            this.mensajesDeAyuda();
            this.dataLista.Columns["Total"].DefaultCellStyle.Format = String.Format("###,##0.00");
            this.dataLista.Columns["fecha"].DefaultCellStyle.Format = "dd/MM/yyyy";
        }
        //mensajes de ayuda
        private void mensajesDeAyuda()
        {

            //mensaje de ayuda en el textbox total
            this.ttMensajeAyuda.SetToolTip(this.txtTotal, "Total de ventas");
            //mensaje de ayuda en el textbox buscar
            this.ttMensajeAyuda.SetToolTip(this.btnBuscar, "Buscar por fecha seleccionada");
            //mensaje de ayuda del boton listar ventas
            this.ttMensajeAyuda.SetToolTip(this.btnTodos, "Listar todas las ventas");
            //mensaje de ayuda del boton exportar excel
            this.ttMensajeAyuda.SetToolTip(this.btnExportarExcel,"Exportar a excel");
        }

        public void mostrar()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable ventas = NegocioVenta.Mostrar();
                foreach (DataRow venta in ventas.Rows)
                {

                    string estado = venta["estado"].ToString();

                    if (estado.Equals("F"))
                    {
                        estado = "FACTURADO";

                    }
                    else if(estado.Equals("P")){
                        estado = "PENDIENTE";
                    }


                    //string tipo_comprobante = venta["tipo_comprobante"].ToString();
                    //tipo_comprobante = tipo_comprobante == "V" ? "VENTA" : "";
                    dataLista.Rows.Add(venta["idventa"], venta["razon_social"], venta["fecha"], venta["tipo_comprobante"], venta["total"],estado);
                    //
                } 

                //this.dataLista.Columns["precio"].DefaultCellStyle.Format = "c3";
                //this.dataLista.Columns["precio"].ValueType = Type.GetType("System.Decimal");
                //this.dataLista.Columns["precio"].DefaultCellStyle.Format = String.Format("###,##0.00");

            }
            catch (Exception ex)
            {
                UtilityFrm.mensajeError("error con la Base de datos: " + ex.Message);
            }
            //datasource el origen de los datos,muestra las categorias en la grilla




        }
        public void exportarAExcel()
        {
            try
            {
                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xls)|*.xls";
                fichero.FileName = "Listado de ventas - " + DateTime.Now.ToString("dd-MM-yyyy");
                if (fichero.ShowDialog() == DialogResult.OK)
                {
                    Microsoft.Office.Interop.Excel.Application aplicacion;
                    Microsoft.Office.Interop.Excel.Workbook libros_trabajo;
                    Microsoft.Office.Interop.Excel.Worksheet hoja_trabajo;
                    aplicacion = new Microsoft.Office.Interop.Excel.Application();
                    libros_trabajo = aplicacion.Workbooks.Add();
                    hoja_trabajo =
                        (Microsoft.Office.Interop.Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);
                
                   
                    //Recorremos el DataGridView rellenando la hoja de trabajo
                    for (int i = 0; i < dataLista.Columns.Count; i++)
                    {
                       
                        hoja_trabajo.Cells[1, i+1] = dataLista.Columns[i].Name;
                    }

                    for (int i = 0; i < dataLista.Rows.Count; i++)
                    {
                        for (int j = 0; j < dataLista.Columns.Count; j++)
                        {
                            //se coloca 2 porque la primera celda pertenece al nombre de la columna y luego los datos
                            hoja_trabajo.Cells[i + 2, j + 1] = dataLista.Rows[i].Cells[j].Value.ToString();
                        }
                    }

                    //ajustar el tamaño de las celdas deacuerdo al tamaño de las columnas agregadas
                    hoja_trabajo.Cells.Columns.AutoFit();
                    //guardo el archivo con la ruta del archivo
                    libros_trabajo.SaveAs(fichero.FileName,
                        Microsoft.Office.Interop.Excel.XlFileFormat.xlWorkbookNormal);
                    libros_trabajo.Close(true);
                    aplicacion.Quit();
                    if (MessageBox.Show("Desea abrir el Excel ?", "Abrir Excel"
                        , MessageBoxButtons.YesNo, MessageBoxIcon.Asterisk) == DialogResult.Yes)
                    {
                        Process.Start(fichero.FileName);
                    }
                    
                }
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error: "+ex.Message);
            }
           
        }
        public void actualizarTotal() {
            decimal totalVendido= Convert.ToDecimal("0,00");
            
            if (dataLista.Rows.Count > 0)
            {
                foreach (DataGridViewRow venta in dataLista.Rows)
                {
                    totalVendido = totalVendido+ decimal.Round( Convert.ToDecimal( venta.Cells["Total"].Value),2);
                }
                txtTotal.Text = totalVendido.ToString();
            }
            else {

                txtTotal.Text = "0,00";
            }
        }
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            this.buscarPorFecha();
            this.actualizarTotal();
        }

        /*Metodos propios*/
        public void buscarPorFecha()
        {
            dataLista.Rows.Clear();
            try
            {
                DataTable dt = NegocioVenta.BuscarFechas(dtpFechaIni.Value.ToString("dd/MM/yyyy"), dtpFechaFin.Value.ToString("dd/MM/yyyy"));
                foreach (DataRow venta in dt.Rows)
                {
                     dataLista.Rows.Add(venta["idventa"], venta["razon_social"], venta["fecha"], venta["tipo_comprobante"], venta["total"]);
                }
       
            }

            catch (Exception ex)
            {
                UtilityFrm.mensajeError("Error Con Base de Datos :" + ex.Message);

            }
           
           

        }

        private void btnTodos_Click(object sender, EventArgs e)
        {
            this.mostrar();
            this.actualizarTotal();
        }

       


      

        private void btnCalculadora_Click(object sender, EventArgs e)
        {
            //calculadora
            Process proceso = new Process();
            proceso.StartInfo.FileName = "calc.exe";
            proceso.StartInfo.Arguments = "";
            proceso.Start();
        }

        private void btnExportarExcel_Click(object sender, EventArgs e)
        {
            exportarAExcel();
        }

        private void dataLista_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode==Keys.Enter){
                if (dataLista.Rows.Count > 0)
                {
                    DateTime date = Convert.ToDateTime(this.dataLista.CurrentRow.Cells["fecha"].Value);

                    FrmDetalleVentas venta = new FrmDetalleVentas(Convert.ToString(this.dataLista.CurrentRow.Cells["codigo"].Value),
                        Convert.ToString(this.dataLista.CurrentRow.Cells["razon_social"].Value),
                        date.ToShortDateString(),
                         Convert.ToString(this.dataLista.CurrentRow.Cells["tipo_comprobante"].Value),
                        Convert.ToString(this.dataLista.CurrentRow.Cells["estado"].Value),
                        Convert.ToString(Decimal.Round(Convert.ToDecimal(this.dataLista.CurrentRow.Cells["total"].Value), 2)));
                    venta.ShowDialog();
                }
            }
            this.buscarPorFecha();
        }

        private void dataLista_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {

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

        private void dataLista_CellMouseDoubleClick_1(object sender, DataGridViewCellMouseEventArgs e)
        {
               if (dataLista.Rows.Count > 0)
                {
                    DateTime date = Convert.ToDateTime(this.dataLista.CurrentRow.Cells["fecha"].Value);

                    FrmDetalleVentas venta = new FrmDetalleVentas(Convert.ToString(this.dataLista.CurrentRow.Cells["codigo"].Value),
                        Convert.ToString(this.dataLista.CurrentRow.Cells["Razon_social"].Value),
                        date.ToShortDateString(),
                         Convert.ToString(this.dataLista.CurrentRow.Cells["tipo_comprobante"].Value),
                        Convert.ToString(this.dataLista.CurrentRow.Cells["estado"].Value),
                        Convert.ToString(Decimal.Round(Convert.ToDecimal(this.dataLista.CurrentRow.Cells["total"].Value), 2)));
                    venta.ShowDialog();
                }
             this.mostrar();
           
           
        }

        private void btnVisualizarLista_Click(object sender, EventArgs e)
        {
            if (dataLista.Visible == false && chartRankingVentas.Visible == true)
            {
                dataLista.Visible = true;
                chartRankingVentas.Visible = false;
            }
        }

        private void btnVisualizarGrafico_Click(object sender, EventArgs e)
        {
            if (dataLista.Visible == true&&chartRankingVentas.Visible==false)
            {
                dataLista.Visible = false;
                chartRankingVentas.Series["Ventas"].Points.Clear();
                chartRankingVentas.Series["Ventas"].Points.AddXY("Producto1", 30);
                chartRankingVentas.Series["Ventas"].Points.AddXY("Producto2", 50);
                chartRankingVentas.Series["Ventas"].Points.AddXY("Producto3", 20);
                chartRankingVentas.Series["Ventas"].Points.AddXY("Producto4", 70);
                chartRankingVentas.Series["Ventas"].Points.AddXY("Producto5", 1000);
                chartRankingVentas.Visible = true;
     
            }
        }



    }
}
