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

        public int Iddetalle
        {
            get { return iddetalle; }
            set { iddetalle = value; }
        }
        private int idventa;

        public int Idventa
        {
            get { return idventa; }
            set { idventa = value; }
        }

        private int cantidad;

        public int Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }
        private decimal subtotal;

        public decimal Subtotal
        {
            get { return subtotal; }
            set { subtotal = value; }
        }
        private decimal descuento;

        public decimal Descuento
        {
            get { return descuento; }
            set { descuento = value; }
        }
        private int idarticulo;

        public int Idarticulo
        {
            get { return idarticulo; }
            set { idarticulo = value; }
        }

        private decimal precio;

        public decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }


       public static string Insertar(int idcliente, DateTime fecha, string tipo_comprobante, string serie, string correlativo, decimal iva, DataTable dtDetalles,NegocioVenta objventa)
       {

           string rpta = "";
           Dventa obj = new Dventa();
           obj.Idcliente = idcliente;
           obj.Fecha = fecha;
           obj.Tipo_comprobante = tipo_comprobante;
           obj.Serie = serie;
           obj.Correlativo = correlativo;
           obj.Iva = iva;
        

           List<DDetalle_Venta> detalles = new List<DDetalle_Venta>();
           

           foreach (DataRow row in dtDetalles.Rows)
           {
               DDetalle_Venta detalle = new DDetalle_Venta();
               detalle.Idarticulo = Convert.ToInt32(row["codigo"].ToString());
               detalle.Cantidad = Convert.ToInt32(row["cantidad"].ToString());
               detalle.Precio_venta = Convert.ToDecimal(row["precio"].ToString());
               detalle.Descuento = Convert.ToDecimal(row["descuento"].ToString());
               
  
           }

           
           rpta = obj.Insertar(obj, detalles);
           objventa.idventa = obj.Idventa;
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
