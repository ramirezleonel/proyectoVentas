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

   public class Negociocaja
       
    {
        private long codmov;

        public long Codmov
        {
            get { return codmov; }
            set { codmov = value; }
        }
        private float ingreso;

        public float Ingreso
        {
            get { return ingreso; }
            set { ingreso = value; }
        }
        private float egreso;

        public float Egreso
        {
            get { return egreso; }
            set { egreso = value; }
        }

        private string fecha;

        public string Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }

        private long idcierre;

        public long Idcierre
        {
            get { return idcierre; }
            set { idcierre = value; }
        }

        private long   codcuenta;

        public long Codcuenta
        {
            get { return codcuenta; }
            set { codcuenta = value; }
        }

        public static DataTable mostrartipomov(int modo, int tipomodo, string ingegr)
        {

            return new DatosCaja().mostrartipomov(modo, tipomodo,ingegr );
        }

        public static DataTable buscarmovimiento(string   fecha)
        {
            DatosCaja  caja = new DatosCaja ();

            caja.Fecha  = fecha;

            //seguir de aca
            return caja.metbuscarfecha( caja.Fecha  );
          
        }

        public static string insertarmovcaja(long codcuenta , float ingreso, float egreso, string Fecha , string usuario, int  idusuario , string turno , string concepto, long comprobante , bool estado)
        {
            DatosCaja objcaja = new DatosCaja();
            
            objcaja.Codcuenta  = codcuenta;
            objcaja.Ingreso  = ingreso;
            objcaja.Egreso = egreso;
            objcaja.Fecha = Fecha;
            objcaja.Usuario = usuario;
            objcaja.Idusuario = idusuario;
            objcaja.Turno = turno;
            objcaja.Concepto = concepto;
            objcaja.Comprobante = comprobante;
            objcaja.Estado = estado;

            
            return objcaja.agregar(objcaja);
        }
        public  void extrestadocaja(int modo, string fecha)
        {
            DatosCaja  ObjCaja= new DatosCaja ();

            ObjCaja.Extestadocaja(modo,fecha );

            if (modo == 1)
            {

                 this.codcuenta = ObjCaja.Codcuenta;
                 this.fecha = ObjCaja.Fecha;
                 this.codmov = ObjCaja.Codmov;
          
            
            }

            if (modo == 2)
            {
                this.ingreso = ObjCaja.Ingreso;
                this.egreso = ObjCaja.Egreso;
              
            }
            

        }
      
       public static string eliminar(long codmov)
        {

            DatosCaja objcaja = new DatosCaja();
            objcaja.Codmov  = codmov;
            return objcaja.eliminarcaja (objcaja);
        }


                
    }
}
