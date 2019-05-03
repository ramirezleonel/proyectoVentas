using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Capa_Datos;
namespace Capa_negocio
{
    public class NegocioVenta
    {
         // propiedad venta detalle
        private int iddetalle;
        private int idarticulo;
        private int importe;
        private int idventa;
        private decimal cantidad;

        public decimal Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }
        private decimal subtotal;
        private decimal descuento;
        private decimal precio;

        public int Iddetalle
        {
            get { return iddetalle; }
            set { iddetalle = value; }
        }
        

        public int Idventa
        {
            get { return idventa; }
            set { idventa = value; }
        }

       

      

        public decimal Subtotal
        {
            get { return subtotal; }
            set { subtotal = value; }
        }
       
        public decimal Descuento
        {
            get { return descuento; }
            set { descuento = value; }
        }
      

        public int Importe
        {
            get { return importe; }
            set { importe = value; }
        }
        public int Idarticulo
        {
            get { return idarticulo; }
            set { idarticulo = value; }
        }

       

        public decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }


       public static string Insertar(int idcliente, DateTime fecha, string tipo_comprobante, string serie, string correlativo, decimal iva, DataTable dtDetalles)
       {

           string rpta = "";
           Dventa objVenta = new Dventa();
           objVenta.Idcliente = idcliente;
           objVenta.Fecha = fecha;
           objVenta.Tipo_comprobante = tipo_comprobante;
           objVenta.Serie = serie;
           objVenta.Correlativo = correlativo;
           objVenta.Iva = iva;
        

           List<DDetalle_Venta> detalles = new List<DDetalle_Venta>();
           

           foreach (DataRow row in dtDetalles.Rows)
           {
               //asigno los valores de los detalle de ventas a cada objeto detalle
               DDetalle_Venta detalle = new DDetalle_Venta();
               detalle.Idarticulo = Convert.ToInt32(row["codigo"].ToString());
               detalle.Cantidad = Convert.ToDecimal(row["cantidad"].ToString());
               detalle.PrecioVenta = Convert.ToDecimal(row["precio"].ToString());
               detalle.Descuento = Convert.ToDecimal(row["descuento"].ToString());
               detalle.Importe = Convert.ToDecimal(row["Importe"].ToString());
               //agrego el item a la lista detalles
               detalles.Add(detalle);
           }

           //le paso como parametro la lista de detalles de ventas y el objeto venta previamente inicializado
           rpta = objVenta.Insertar(objVenta, detalles);
           
           return rpta;

       }
        

       public static string Eliminar(int idventa)
       {
           Dventa Obj = new Dventa();
           Obj.Idventa = idventa;
           return Obj.Eliminar(Obj);


       }

      

        public NegocioVenta()
        {
                        

        }

        public static DataTable Mostrar()
        {
            return new Dventa().Mostrar();


        }

        public static DataTable BuscarFechas(string textobuscar, string textobuscar2)
        {
            Dventa Obj = new Dventa();
            return Obj.BuscarFechas(textobuscar, textobuscar2);

        }

        public static string cambiarEstadoFacturacion(int idVenta,char estado) {
            Dventa Obj = new Dventa();
            Obj.Idventa = idVenta;
            Obj.Estado = estado;
            return Obj.CambiarEstadoFacturacion(Obj);
        }
        public static DataTable NotaDeVenta()
        {
            Dventa Obj = new Dventa();
            return new Dventa().notaDeVenta();

        }

        public static DataTable MostrarDetalle(string textobuscar)
        {
            Dventa Obj = new Dventa();
            return Obj.MostrarDetalle(textobuscar);


        }
        public string [,] Matrizventa = new string [100,100];


    }
    
}
