using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Capa_Presentacion;
using System.Threading;
namespace SistemaVentas
{
    public partial class FrmInicio : Form
    {
        
        public FrmInicio()
        {
            //le paso al delegado threadStart el metodo abrirformulario
            Thread t = new Thread(new ThreadStart(abrirFormulario));
            t.Start();
            //Thread.Sleep(1000);
            Thread.Sleep(3000);

            InitializeComponent();
            t.Abort();
        }

        private void FrmInicio_Load(object sender, EventArgs e)
        {

        }

        private void FrmInicio_KeyDown(object sender, KeyEventArgs e)
        {
           
            if (e.KeyCode == Keys.F1)
            {
                //AYUDAS DE TECLADO
                if (lbl1.Visible == true)
                {
                    lbl1.Visible = false;
                    lbl2.Visible = false;
                    lbl1.SendToBack();
                    lbl2.SendToBack();
                }
                else
                {

                    lbl1.Visible = true;
                    lbl2.Visible = true;
                    lbl1.BringToFront();
                    lbl2.BringToFront();
                }  

            }
            //dependiendo del boton ingresa se presiona el boton automaticamente para abrir el formulario

            //
            if(e.KeyCode==Keys.F1){
              
                

            }
            else if (e.KeyCode == Keys.NumPad2) {

                btnVentas.PerformClick();

            }
            else if (e.KeyCode == Keys.NumPad3)
            {

                btnProveedor.PerformClick();

            }
            else if (e.KeyCode == Keys.NumPad4)
            {
                btnClientes.PerformClick();


            }
            else if (e.KeyCode == Keys.NumPad5)
            {
                btnCaja.PerformClick();


            }
            else if (e.KeyCode == Keys.NumPad6)
            {
                btnUsuarios.PerformClick();


            }
            else if (e.KeyCode == Keys.NumPad7)
            {
                btnStock.PerformClick();


            }
        }


        public void abrirFormulario()
        {

            Application.Run( new SplashScreen());
        }

        //color panelprincipal 65; 39; 60
        //metodos
        private void abrirMDIParent(Form formularioHijo) {

            if (panelPrincipal.Controls.Count > 0)
            {
                this.panelPrincipal.Controls.RemoveAt(0);
            }
                //forma de mostrarse como ventana de nivel superior desactivada
               
                formularioHijo.TopLevel = false;
                formularioHijo.Dock= DockStyle.Fill;
                this.panelPrincipal.Controls.Add(formularioHijo);
                this.panelPrincipal.Tag = formularioHijo;
                formularioHijo.Show();
            
        
        }
       
        //maximizar
            //this.btnRestaurar.Visible = true;
            //this.btnMax.Visible = false;
            //this.WindowState = FormWindowState.Maximized;

   

       
        int posY = 0;
        int posX = 0;
        private void panelHorizontal_MouseMove(object sender, MouseEventArgs e)
        {
            //mientra no se apreta el boton izquierdo del mouse actualiza el valor posX Y posY 
            if(e.Button!= MouseButtons.Left){
                posY = e.Y;
                posX = e.X;
            
            }else{
                //Left tiene la distancia que hay entre el borde izq y el fondo de la pantalla
                Left = Left + (e.X - posX);
                //top tiene la distancia que hay entre el borde sup y el fondo de la pantalla
                Top= Top + (e.Y - posY);
            
            }
        }

        //VENTANA Y PANEL SUPERIOR
        private void btnRestaurar_Click(object sender, EventArgs e)
        {
            //vuelve tamaño original
            this.btnRestaurar.Visible = false;
            this.btnMaximizar.Visible = true;
            this.WindowState = FormWindowState.Normal;
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
        private void btnMaximizar_Click(object sender, EventArgs e)
        {
            //maximizar
            this.btnRestaurar.Visible = true;
            this.btnMaximizar.Visible = false;
            this.WindowState = FormWindowState.Maximized;
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
                //maximizar
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
            btnCerrar.BackColor=Color.FromArgb(100, 0, 180);
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


        //BOTONES LATERAL IZQUIERDO
        int usuariosY;
        int cajaY;
        int clientesY;
        int proveedorY;
        int ventasY;
        int stockY;
        int consultasY;
        //valor constante que se tienen que mover los botones
        int movimiento=155;
        private void btnProductos_Click(object sender, EventArgs e)
        {
             

            if (btnCategoria.Visible == false && btnListaProducto.Visible == false)
            {
             
                //asigno los valores de la coordenadas Y de los botones antes de mover
                ventasY = btnVentas.Location.Y;
                proveedorY = btnProveedor.Location.Y;
                clientesY = btnClientes.Location.Y;
                cajaY = btnCaja.Location.Y;
                usuariosY = btnUsuarios.Location.Y;
                stockY = btnStock.Location.Y;
                consultasY = btnConsultas.Location.Y;

                btnCategoria.Visible = true;
                btnListaProducto.Visible = true;
                pnCategoria.Visible = true;
                pnlistaProducto.Visible = true;
                btnConsultas.Visible = true;
                pnConsultas.Visible = true;
               

                //al hacer click en producto se desplaza los submenus
                //sumo la posicion actual más un valor preciso para abarcar la posicion exacta
                //botones
                btnVentas.Location = new System.Drawing.Point(0, (ventasY+movimiento));
                btnProveedor.Location = new System.Drawing.Point(0, (proveedorY + movimiento));
                btnClientes.Location = new System.Drawing.Point(0, (clientesY + movimiento));
                btnCaja.Location = new System.Drawing.Point(0, (cajaY + movimiento));
                btnUsuarios.Location = new System.Drawing.Point(0, (usuariosY + movimiento));
                btnStock.Location = new System.Drawing.Point(0, (stockY + movimiento));
               
                //paneles
                pnVentas.Location=new System.Drawing.Point(0, (ventasY+movimiento));
                pnProveedor.Location=new System.Drawing.Point(0, (proveedorY+movimiento));
                pnClientes.Location=new System.Drawing.Point(0, (clientesY + movimiento));
                pnCaja.Location=new System.Drawing.Point(0, (cajaY + movimiento));
                pnUsuarios.Location = new System.Drawing.Point(0, (usuariosY + movimiento));
                pnStock.Location = new System.Drawing.Point(0, (stockY + movimiento));
               
            }
            else {

                btnCategoria.Visible = false;
                btnListaProducto.Visible = false ;
                pnCategoria.Visible = false;
                pnlistaProducto.Visible = false;
                btnConsultas.Visible = false;
                pnConsultas.Visible = false;
               
                //al hacer click en producto se contrae los submenus
                //botones
                btnVentas.Location = new System.Drawing.Point(0, 150);
                btnUsuarios.Location = new System.Drawing.Point(0, usuariosY);
                btnCaja.Location = new System.Drawing.Point(0, cajaY);
                btnClientes.Location = new System.Drawing.Point(0, clientesY);
                btnProveedor.Location = new System.Drawing.Point(0, proveedorY);
                btnStock.Location = new System.Drawing.Point(0, (stockY));
                
                //paneles
                pnVentas.Location = new System.Drawing.Point(0, ventasY);
                pnProveedor.Location = new System.Drawing.Point(0, proveedorY );
                pnClientes.Location = new System.Drawing.Point(0, clientesY );
                pnCaja.Location = new System.Drawing.Point(0, cajaY );
                pnUsuarios.Location = new System.Drawing.Point(0, usuariosY );
                pnStock.Location = new System.Drawing.Point(0, stockY);
          
            }
        }

        private void btnListaProducto_Click(object sender, EventArgs e)
        {
            FrmArticulos articulos = new FrmArticulos();
            //FrmProducto articulos = new FrmProducto();
            //abrirMDIParent(articulos);
            articulos.ShowDialog();
            
        }

        private void btnCategoria_Click(object sender, EventArgs e)
        {
            FrmCategoria categoria = new FrmCategoria();
            abrirMDIParent(categoria);
        }

        private void btnProveedor_Click(object sender, EventArgs e)
        {
            FrmProveedor proveedor = new FrmProveedor();
            abrirMDIParent(proveedor);
        }

        private void btnClientes_Click(object sender, EventArgs e)
        {
            FrmClientes clientes = new FrmClientes();
            abrirMDIParent(clientes);
        }

        private void btnStock_Click(object sender, EventArgs e)
        {
           
                     
            FrmMovStock1 stock = new FrmMovStock1();
            stock.ShowDialog();
            //abrirMDIParent(stock);
        }

        private void lblSistemaVenta_Click(object sender, EventArgs e)
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
                //maximizar
                this.btnRestaurar.Visible = false;
                this.btnMaximizar.Visible = true;
                this.WindowState = FormWindowState.Normal;
            }
        }

        private void btnIngreso_Click(object sender, EventArgs e)
        {
           
        }

        private void panelHorizontal_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnVentas_Click(object sender, EventArgs e)
        {
            frmPventa objventa = new frmPventa();
            objventa.ShowDialog();
        }

        private void btnCaja_Click(object sender, EventArgs e)
        {
            FrmCaja caja = new FrmCaja();
            caja.ShowDialog();
        }

        private void btnConsultas_Click(object sender, EventArgs e)
        {
            try
            {
                FrmConsulta precio = new FrmConsulta();
                precio.ShowDialog();
            }
            catch (Exception ex)
            {

                UtilityFrm.mensajeError("error "+ex);
            }
            

        }

        private void btnTecnico_Click(object sender, EventArgs e)
        {
            FrmConfig precio = new FrmConfig();
            precio.ShowDialog();

        }

        private void btnUsuarios_Click(object sender, EventArgs e)
        {
            FrmUsuario usuario = new FrmUsuario();
            abrirMDIParent(usuario);
        }

      

       

     

       

       

      

      
       
    }
}
