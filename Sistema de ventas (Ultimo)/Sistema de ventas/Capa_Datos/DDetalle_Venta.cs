using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
namespace Capa_Datos
{
    public class DDetalle_Venta
    {
        private int idarticulo;

        public int Idarticulo
        {
            get { return idarticulo; }
            set { idarticulo = value; }
        }


        private decimal subtotal;


        public decimal Subtotal
        {
            get { return subtotal; }
            set { subtotal = value; }
        }

        private int iddetalle_venta;

        public int Iddetalle_venta
        {
            get { return iddetalle_venta; }
            set { iddetalle_venta = value; }
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
        private decimal precio_venta;

        public decimal Precio_venta
        {
            get { return precio_venta; }
            set { precio_venta = value; }
        }
        private decimal descuento;

        public decimal Descuento
        {
            get { return descuento; }
            set { descuento = value; }
        }
        public DDetalle_Venta()
        {

        }
        public DDetalle_Venta(int iddetalle_venta, int idventa, int cantidad, decimal precio_venta, decimal descuento, decimal subtotal, int idarticulo)
        {
            this.iddetalle_venta = iddetalle_venta;
            this.idventa = idventa;
            this.cantidad = cantidad;
            this.precio_venta = precio_venta;
            this.descuento = descuento;
            this.subtotal = subtotal;
            this.idarticulo = idarticulo;


        }

        public string Insertar(DDetalle_Venta Detalle_Venta, ref SqlConnection sqlcon, ref SqlTransaction sqltra)
        {
            string rpta = "";

            try
            {
                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.Transaction = sqltra;
                sqlcmd.CommandText = "spinsertar_detalle_venta";
                sqlcmd.CommandType = CommandType.StoredProcedure;

                SqlParameter pariddetallev = ProcAlmacenado.asignarParametros("@iddetalle_venta", SqlDbType.Int);
                sqlcmd.Parameters.Add(pariddetallev);

                SqlParameter paridventa = ProcAlmacenado.asignarParametros("@idventa", SqlDbType.Int, Detalle_Venta.idventa);
                sqlcmd.Parameters.Add(paridventa);

                SqlParameter parcantidad = ProcAlmacenado.asignarParametros("@cantidad", SqlDbType.Int, Detalle_Venta.cantidad);
                sqlcmd.Parameters.Add(parcantidad);

                SqlParameter parsubtotal = ProcAlmacenado.asignarParametros("@subtotal", SqlDbType.Decimal, Detalle_Venta.subtotal);
                sqlcmd.Parameters.Add(parsubtotal);

                SqlParameter pardescuento = ProcAlmacenado.asignarParametros("@descuento", SqlDbType.Decimal, Detalle_Venta.descuento);
                sqlcmd.Parameters.Add(pardescuento);

                SqlParameter paridarticulo = ProcAlmacenado.asignarParametros("@id_articulo", SqlDbType.Int, Detalle_Venta.idarticulo);
                sqlcmd.Parameters.Add(pardescuento);

                SqlParameter parPrecio = ProcAlmacenado.asignarParametros("@precio", SqlDbType.Int, Detalle_Venta.precio_venta);
                sqlcmd.Parameters.Add(parPrecio);


                rpta = sqlcmd.ExecuteNonQuery() == 1 ? "OK" : "NO se ingreso el registro";

            }
            catch (Exception ex)
            {
                rpta = ex.Message;
            }

            return rpta;
        }


    }
}
