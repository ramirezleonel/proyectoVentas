using Capa_negocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Capa_Presentacion
{
    public partial class FrmAvanzadoArticulo : Form
    {
        private bool isCerro = false;
        private bool isPesable = false;

        

        private string nombreProducto;

       
        private int idProducto;
      
        private int stockActual;

        
        private decimal precio;




        public bool IsPesable
        {
            get { return isPesable; }
            set { isPesable = value; }
        }
        public string NombreProducto
        {
            get { return nombreProducto; }
            set { nombreProducto = value; }
        }
        public int IdProducto
        {
            get { return idProducto; }
            set { idProducto = value; }
        }
        public int StockActual
        {
            get { return stockActual; }
            set { stockActual = value; }
        }
        public decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }

        public bool IsCerro
        {
            get { return isCerro; }
            set { isCerro = value; }
        }
        public FrmAvanzadoArticulo()
        {
            InitializeComponent();
            IsPesable = false;
            this.mostrar();
        }

        private void mostrar()
        {
            try
            {

                DataTable data = NegocioArticulo.mostrar();


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"], producto["stock_actual"]);
                    //    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
           
        }
        public FrmAvanzadoArticulo(Boolean pesable)
        {
            InitializeComponent();
            if(pesable==true){
                IsPesable = true;
                mostrarPesable();
            }
            
        }
        private void btnProducto_Click(object sender, EventArgs e)
        {
            //segun el radiobutton que seleccione buscara
            if (rdbNombre.Checked == true)
            {
                if (IsPesable == true)
                {
                    this.BuscarNombrePesable();
                }
                else
                {
                    this.BuscarNombre();
                }
            }
            else if (rdbCodigoBarra.Checked == true)
            {

                txtProducto.Multiline = true;
                if (IsPesable == true)
                {
                    this.BuscarCodigoBarraPesable();

                }
                else
                {
                    this.BuscarCodigoBarra();
                }

            }
            else if (rbCodigo.Checked == true)
            {
                 if (IsPesable == true)
                 {
                    this.BuscarIdArticuloPesable();
                 }
                 else
                 {
                     this.BuscarIdArticulo();
                 }
            }
            else
            {
                if (IsPesable == true)
                {
                    this.BuscarCategoriaPesable();
                }
                else {

                    this.BuscarCategoriaPesable();
                
                }
            }
        }

        private void FrmAvanzadoArticulo_Load(object sender, EventArgs e)
        {
            this.dataLista.Columns["PrecioProducto"].DefaultCellStyle.Format = String.Format("$###,##0.00");
            
            txtProducto.Focus();
            mensajesDeAyuda();
        }

        private void mostrarPesable()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable data = NegocioArticulo.mostrarPesable();


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"], producto["stock_actual"]);

                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
        }

        private void mensajesDeAyuda()
        {
        }

        private void txtProducto_TextChanged(object sender, EventArgs e)
        {
            //compara si el primer caracter es numero, si es true se cambia a codigo de barra
            if (txtProducto.Text != String.Empty)
            {
                if (Char.IsNumber(txtProducto.Text, 0) && ((rdbNombre.Checked == true) || (rbCategoria.Checked == true)))
                {
                    rdbCodigoBarra.Checked = true;
                    if (IsPesable == true)
                    {
                        this.BuscarCodigoBarraPesable();

                    }
                    else {
                        this.BuscarCodigoBarra();
                    }
                    

                }
                else if (Char.IsLetter(txtProducto.Text, 0) && ((rbCodigo.Checked == true) || (rdbCodigoBarra.Checked == true)))
                {

                    rdbNombre.Checked = true;
                    if (IsPesable == true)
                    {
                        this.BuscarNombrePesable();

                    }
                    else
                    {
                        this.BuscarNombre();
                    }
                  
                }
                else if (rdbNombre.Checked == true) //segun el radiobutton que seleccione buscara
                {

                    if (IsPesable == true)
                    {
                        this.BuscarNombrePesable();

                    }
                    else
                    {
                        this.BuscarNombre();
                    }
                    
                }
                else if (rdbCodigoBarra.Checked == true)
                {

                    if (txtProducto.Text.Length > 13)
                    {
                        string prod = txtProducto.Text;
                        prod = prod.Remove(0, 13);
                        txtProducto.Text = "";

                        txtProducto.Text = prod.ToString();
                        //se mueve hasta la ultima posicion
                        txtProducto.Select(txtProducto.Text.Length, 0);
                        // txtProducto.SelectAll();

                    }
                    if (IsPesable == true)
                    {
                        this.BuscarCodigoBarraPesable();

                    }
                    else
                    {
                        this.BuscarCodigoBarra();
                    }
                  

                }
                else if (rbCodigo.Checked == true)
                {
                    if (IsPesable == true)
                    {
                        this.BuscarIdArticuloPesable();

                    }
                    else
                    {
                        this.BuscarIdArticulo();
                    }
                    
                }
                else if (rbCategoria.Checked == true)
                {

                    if (IsPesable == true)
                    {
                        this.BuscarCategoriaPesable();

                    }
                    else
                    {
                        this.BuscarCategoria();
                    }
                  
                }



            }
            else
            {

                //si no hay ningun valor en la busqueda se limpian las cajas de texto de precio y productoNombre



             
                this.mostrarPesable();


            }
          
            
        }

        //No pesables
        private void BuscarCodigoBarra()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable data = NegocioArticulo.buscarCodigoBarra(txtProducto.Text);


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"]);
                    //    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
        }
        private void BuscarIdArticulo()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable data = NegocioArticulo.buscarIdProducto(txtProducto.Text);


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"]);
                    //    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
        }
        private void BuscarCategoria()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable data = NegocioArticulo.buscarCategoria(txtProducto.Text);


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"]);
                    //    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
        }
        private void BuscarNombre()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable data = NegocioArticulo.buscarNombre(txtProducto.Text);


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"]);
                    //    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
        }

        //Pesables
        private void BuscarCategoriaPesable()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable data = NegocioArticulo.mostrarPesableXbusqueda(txtProducto.Text, "categoria");


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"]);
                    //    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
        }
        private void BuscarIdArticuloPesable()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable data = NegocioArticulo.mostrarPesableXbusqueda(txtProducto.Text, "idarticulo");


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"]);
                    //    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
        }
        private void BuscarNombrePesable()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable data = NegocioArticulo.mostrarPesableXbusqueda(txtProducto.Text, "nombre");


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"], producto["stock_actual"]);
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
        }
        private void BuscarCodigoBarraPesable()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable data = NegocioArticulo.mostrarPesableXbusqueda(txtProducto.Text, "codigo");


                foreach (DataRow producto in data.Rows)
                {

                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"]);
                    //    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
                }

            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error: " + ex.Message);
            }
        }
      
        private void dataLista_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                productoSeleccionado();
            
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("Error: "+ex.Message);
            }
            
        }

        private void dataLista_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Right)
            {
                //pasa al texto el foco 
                txtProducto.Focus();

            }
            if (e.KeyCode == Keys.Left)
            {
                //pasa al texto el foco 
                txtProducto.Focus();


            }
            if (e.KeyCode == Keys.Enter)
            {
                if (dataLista.Rows.Count > 0)
                {

                    try
                    {
                        productoSeleccionado();

                    }
                    catch (Exception ex)
                    {

                        UtilityFrm.mensajeError("Error: " + ex.Message);
                    }

                }


            }
        }
        public void productoSeleccionado() {

            this.idProducto = Convert.ToInt32(this.dataLista.CurrentRow.Cells["codigo"].Value);
            this.nombreProducto = Convert.ToString(this.dataLista.CurrentRow.Cells["producto"].Value);

            //convierte primero object a string y luego en float
            this.precio = decimal.Round(Convert.ToDecimal(this.dataLista.CurrentRow.Cells["precioProducto"].Value), 2);
            //this.precio = double.Parse(Convert.ToString(this.dataLista.CurrentRow.Cells["precio"].Value));
            this.stockActual = Convert.ToInt32(this.dataLista.CurrentRow.Cells["stock_actual"].Value);
            this.Close();
            this.isCerro = false;
        }

        private void txtProducto_KeyDown(object sender, KeyEventArgs e)
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






    }
}
