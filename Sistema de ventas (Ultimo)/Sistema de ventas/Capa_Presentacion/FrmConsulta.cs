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
    public partial class FrmConsulta : Form
    {
        public FrmConsulta()
        {
            InitializeComponent();
        }
        private void FrmConsulta_Load(object sender, EventArgs e)
        {
           
            this.dataLista.Columns["precio"].DefaultCellStyle.Format = String.Format("$###,##0.00");
            this.mostrar();
            txtProducto.Focus();
            mensajesDeAyuda();
        }
        public void mostrar()
        {
            try
            {
                dataLista.Rows.Clear();
                DataTable productos = NegocioArticulo.mostrar();
                foreach (DataRow producto in productos.Rows)
                {


                    dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
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
       private void txtProducto_TextChanged(object sender, EventArgs e)
        {
            //compara si el primer caracter es numero, si es true se cambia a codigo de barra
            if (txtProducto.Text != String.Empty)
            {
                if (Char.IsNumber(txtProducto.Text, 0) && ((rdbNombre.Checked == true) || (rbCategoria.Checked == true)))
                {
                    rdbCodigoBarra.Checked = true;

                    this.BuscarCodigoBarra();

                }
                else if (Char.IsLetter(txtProducto.Text, 0) && ((rbCodigo.Checked == true) || (rdbCodigoBarra.Checked == true)))
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

                        if (txtProducto.Text.Length > 13)
                        {
                            string prod = txtProducto.Text;
                            prod= prod.Remove(0, 13);
                             txtProducto.Text = "";
                          
                             txtProducto.Text = prod.ToString();
                            //se mueve hasta la ultima posicion
                             txtProducto.Select(txtProducto.Text.Length, 0);
                           // txtProducto.SelectAll();
                          
                        }
                        this.BuscarCodigoBarra();

                    }
                    else if (rbCodigo.Checked == true)
                    {
                        this.BuscarCodigo();
                    }
                    else if (rbCategoria.Checked == true)
                    {
                        this.BuscarCategoria();
                    }

                if (dataLista.RowCount > 0)
                {
                    decimal precio = 0;
                    precio = Convert.ToDecimal(this.dataLista.CurrentRow.Cells["precio"].Value);


                    txtProductoNombre.Text = Convert.ToString(this.dataLista.CurrentRow.Cells["producto"].Value);
                    txtPrecio.Text = Decimal.Round(precio, 2).ToString();


                }
                else { 
                //si no se encuentra ningun valor en la lista se limpian las cajas de texto de precio y productoNombre
                    txtProductoNombre.Text = "";
                    txtPrecio.Text = "0,00";
                }
            }
            else
            {

                //si no hay ningun valor en la busqueda se limpian las cajas de texto de precio y productoNombre



                txtProductoNombre.Text = "";
                    txtPrecio.Text = "0,00";
                    this.mostrar();

               
            }
           
              
        }

        private void rdbNombre_CheckedChanged(object sender, EventArgs e)
        {
            //al hacer click en un radiobutton cambia el foco al textbox producto
            txtProducto.Focus();
        }

        private void rdbCodigoBarra_CheckedChanged(object sender, EventArgs e)
        {
            //al hacer click en un radiobutton cambia el foco al textbox producto
            txtProducto.Focus();
        }

        private void rbCodigo_CheckedChanged(object sender, EventArgs e)
        {
            //al hacer click en un radiobutton cambia el foco al textbox producto
            txtProducto.Focus();
        }

        private void rbCategoria_CheckedChanged(object sender, EventArgs e)
        {
            //al hacer click en un radiobutton cambia el foco al textbox producto
            txtProducto.Focus();
        }

        private void btnProducto_Click(object sender, EventArgs e)
        {
            //segun el radiobutton que seleccione buscara
            if (rdbNombre.Checked == true)
            {
                this.BuscarNombre();
            }
            else if (rdbCodigoBarra.Checked == true)
            {

                txtProducto.Multiline = true;
                this.BuscarCodigoBarra();

            }
            else if (rbCodigo.Checked == true)
            {
                this.BuscarCodigo();
            }
            else
            {
                this.BuscarCategoria();
            }
        }
        public void BuscarNombre()
        {
            DataTable data = NegocioArticulo.buscarNombre(txtProducto.Text);
            dataLista.Rows.Clear();

            foreach (DataRow producto in data.Rows)
            {
                dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
            }

        }
        public void BuscarCategoria()
        {
            DataTable data = NegocioArticulo.buscarCategoria(txtProducto.Text);
            dataLista.Rows.Clear();
            foreach (DataRow producto in data.Rows)
            {
                dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
            }
        }
        public void BuscarCodigo()
        {
            DataTable data = NegocioArticulo.buscarIdProducto(txtProducto.Text);
            dataLista.Rows.Clear();
            foreach (DataRow producto in data.Rows)
            {
                dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
            }
        }

        public void BuscarCodigoBarra()
        {
            DataTable data = NegocioArticulo.buscarCodigoBarra(txtProducto.Text);
            dataLista.Rows.Clear();
            foreach (DataRow producto in data.Rows)
            {
                dataLista.Rows.Add(producto["idarticulo"], producto["codigo"], producto["nombre"], producto["precio"], producto["categoria"]);
            }
        }
        private void dataLista_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
             try
             { 
             
             }
             catch (Exception ex)
             {

                 UtilityFrm.mensajeError("error :" + ex);
             }
           
        }

        private void dataLista_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                FrmCambiarPrecio precio = new FrmCambiarPrecio(Convert.ToInt32(this.dataLista.CurrentRow.Cells["codigo"].Value), Convert.ToString(this.dataLista.CurrentRow.Cells["producto"].Value), Convert.ToDecimal(this.dataLista.CurrentRow.Cells["precio"].Value));

                precio.ShowDialog();

                //una vez que se modifica el precio se actualiza la grilla
                this.mostrar();
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error :"+ ex);
            }
           

        }

        private void FrmPrecio_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F1)
            {
                //limpiar la caja de texto txtProducto
                txtProducto.Text = "";
                txtProducto.Focus();
            }
            else if (e.KeyCode == Keys.Escape)
            {
                this.Close();

            }
            
        }

        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtProducto.Text = "";
        }
        //mensajes de ayuda
        private void mensajesDeAyuda()
        {

            //mensaje de ayuda en el textbox nombre

            this.ttMensajeAyuda.SetToolTip(this.txtProducto, "Ingrese el producto ha buscar");
            //mensaje de ayuda en el textbox nombre
            this.ttMensajeAyuda.SetToolTip(this.btnLimpiar, "Limpia el texto a buscar (F1)");
            //mensaje de ayuda en el textbox nombre
            this.ttMensajeAyuda.SetToolTip(this.btnProducto, "Busca el valor ingresado en la lista");


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

        private void btnCerrar_MouseLeave(object sender, EventArgs e)
        {
            btnCerrar.BackColor = Color.FromArgb(100, 0, 180);
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

        private void dataLista_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Right)
            {
                //pasa al texto el foco 
                txtProducto.Focus() ;

            }
            if (e.KeyCode == Keys.Left)
            {
                //pasa al texto el foco 
                txtProducto.Focus();


            }
            if (e.KeyCode == Keys.Enter)
            {
               if(dataLista.Rows.Count>0){

                   FrmCambiarPrecio precio = new FrmCambiarPrecio(Convert.ToInt32(this.dataLista.CurrentRow.Cells["codigo"].Value), Convert.ToString(this.dataLista.CurrentRow.Cells["producto"].Value), Convert.ToDecimal(this.dataLista.CurrentRow.Cells["precio"].Value));

                   precio.ShowDialog();

                   //una vez que se modifica el precio se actualiza la grilla
                   this.mostrar();

               }
               

            }
        }

        private void dataLista_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            
            //si los datos son validos se coloca la informacion del producto en las cajas de texto correspondientes
            if (dataLista.RowCount > 0)
            {
                decimal precio = 0;
                precio = Convert.ToDecimal(this.dataLista.CurrentRow.Cells["precio"].Value);


                txtProductoNombre.Text = Convert.ToString(this.dataLista.CurrentRow.Cells["producto"].Value);
                txtPrecio.Text = Decimal.Round(precio, 2).ToString();


            }
            if (e.Button == MouseButtons.Right)
            {

                if(dataLista.SelectedRows.Count<=1){
                    dataLista.ClearSelection(); 
                }
                dataLista[e.ColumnIndex, e.RowIndex].Selected = true; 
                ContextMenuStrip menu = new ContextMenuStrip();
                menu.Items.Add("Cambiar Precio").Name = "Cambiar";
                

                //Obtienes las coordenadas de la celda seleccionada. 
                Rectangle coordenada = dataLista.GetCellDisplayRectangle(e.ColumnIndex, e.RowIndex, false);

                int anchoCelda = coordenada.Location.X; //Ancho de la localizacion de la celda
                int altoCelda = coordenada.Location.Y;  //Alto de la localizacion de la celda

                //Y para mostrar el menú lo haces de esta forma:  
                int X = anchoCelda;
                int Y = altoCelda ;

                menu.Show(dataLista, new Point(X, Y));
                menu.ItemClicked+=new ToolStripItemClickedEventHandler(menu_ItemClicked);
            }
          
        }

        private void menu_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            //se abre la ventana cambiarpreciosel para poder cambiar los precios de los productos
            FrmCambiarPrecioSel cambiar = new FrmCambiarPrecioSel(dataLista.SelectedRows);
            cambiar.ShowDialog();
            mostrar();
        }
        
    }
}
