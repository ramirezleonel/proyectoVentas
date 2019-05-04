﻿using System;
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
    public partial class FrmDetalleVentas : Form
    {
        public FrmDetalleVentas()
        {
            InitializeComponent();
        }
        public FrmDetalleVentas(string codigoVenta,string razon_social,string fecha,string tipo_comprobante,string estado,string total)
        {
            InitializeComponent();
            txtCodigo.Text = codigoVenta;
            txtEstado.Text = estado;
            txtTipoComprobante.Text = tipo_comprobante;
            txtRazonSocial.Text = razon_social;
            txtFechaVenta.Text = fecha;
            txtTotal.Text = total;
            mostrar();
        }
        private void FrmDetalleVentas_Load(object sender, EventArgs e)
        {
            dataLista.Columns["cantidad"].DefaultCellStyle.Format = String.Format("###,##0.000");
            dataLista.Columns["precio"].DefaultCellStyle.Format = String.Format("$###,##0.00");
            dataLista.Columns["descuento"].DefaultCellStyle.Format = String.Format("###,##0.00");
            dataLista.Columns["Importe"].DefaultCellStyle.Format = String.Format("$###,##0.00");
        }
        private void btnPagarMovimiento_Click(object sender, EventArgs e)
        {
           string mensaje= NegocioVenta.cambiarEstadoFacturacion(Convert.ToInt32(txtCodigo.Text), 'F');

           if (mensaje.Equals("ok"))
           {
               UtilityFrm.mensajeConfirm("La facturación se realizó Correctamente");
           }
           else {
               UtilityFrm.mensajeError(mensaje);
           }
            
        }
        public void mostrar() {

            try
            {
                dataLista.Rows.Clear();
                DataTable ventas = NegocioVenta.MostrarDetalle(txtCodigo.Text);
                foreach (DataRow venta in ventas.Rows)
                {

                   

                    //string tipo_comprobante = venta["tipo_comprobante"].ToString();
                    //tipo_comprobante = tipo_comprobante == "V" ? "VENTA" : "";
                    dataLista.Rows.Add(venta["idarticulo"], venta["articulo"], venta["precio"], venta["descuento"], venta["cantidad"], venta["importe"]);
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

        private void btnExportarExcel_Click(object sender, EventArgs e)
        {
            this.exportarAExcel();
        }
        public void exportarAExcel()
        {
            try
            {
                SaveFileDialog fichero = new SaveFileDialog();
                fichero.Filter = "Excel (*.xls)|*.xls";
                fichero.FileName = "Venta Numero "+ txtCodigo.Text+"- "+   DateTime.Now.ToString("dd-MM-yyyy");
                if (fichero.ShowDialog() == DialogResult.OK)
                {
                    Microsoft.Office.Interop.Excel.Application aplicacion;
                    Microsoft.Office.Interop.Excel.Workbook libros_trabajo;
                    Microsoft.Office.Interop.Excel.Worksheet hoja_trabajo;
                    aplicacion = new Microsoft.Office.Interop.Excel.Application();
                    libros_trabajo = aplicacion.Workbooks.Add();
                    hoja_trabajo =
                    (Microsoft.Office.Interop.Excel.Worksheet)libros_trabajo.ActiveSheet ;
                    //hoja_trabajo.Cells.Font.Bold = true;
                    hoja_trabajo.Cells.Rows[1].Font.Bold = true;
                    hoja_trabajo.Cells.Rows[1].Font.Size = 15;
                    hoja_trabajo.Cells[1, 1] = "Venta Nº : "+txtCodigo.Text+ " - Fecha "+txtFechaVenta.Text;
                   

                    hoja_trabajo.Range[hoja_trabajo.Cells[1, 1], hoja_trabajo.Cells[1, 10]].Merge();

                   // rango.Merge(true);
                    
                    //Recorremos el DataGridView rellenando la hoja de trabajo
                    for (int i = 0; i < dataLista.Columns.Count; i++)
                    {

                        hoja_trabajo.Cells[2, i + 1] = dataLista.Columns[i].Name;
                    }

                    for (int i = 0; i < dataLista.Rows.Count; i++)
                    {
                        for (int j = 0; j < dataLista.Columns.Count; j++)
                        {
                            //se coloca 3 porque la primera celda pertenece al nombre de la columna y luego los datos
                            hoja_trabajo.Cells[i+3 , j + 1] = dataLista.Rows[i].Cells[j].Value.ToString();
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

                UtilityFrm.mensajeError("Error: " + ex.Message);
            }

        }
    }
}
