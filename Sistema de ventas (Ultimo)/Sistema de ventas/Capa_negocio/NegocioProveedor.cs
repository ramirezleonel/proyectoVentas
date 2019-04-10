using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos;
using System.Data;
using System.Data.SqlClient ;
namespace Capa_negocio
{
    public class NegocioProveedor
    {
        public static string insertar(string razonSocial, string direccion, int cuit, int tel, int numDocumento, string email)
        {
            
            DatosProveedor proveedor = new DatosProveedor();
            proveedor.RazonSocial= razonSocial;
            proveedor.Direccion = direccion;
            proveedor.Cuit= cuit;
            proveedor.Tel= tel;
            proveedor.NumDocumento = numDocumento;
            proveedor.Email = email;

            return proveedor.agregar(proveedor);
        }
        public static string eliminar(int idProveedor)
        {
            DatosProveedor proveedor = new DatosProveedor();
            proveedor.IdProveedor=idProveedor;
            return proveedor.eliminar(proveedor);
}
        public static string editar(int idProveedor,string razonSocial, string direccion, int cuit, int tel, int numDocumento, string email)
        {
            DatosProveedor proveedor = new DatosProveedor();
            proveedor.RazonSocial=razonSocial;
            proveedor.Direccion = direccion;
            proveedor.Cuit = cuit;
            proveedor.Tel = tel;
            proveedor.NumDocumento = numDocumento;
            proveedor.Email = email;
            proveedor.IdProveedor = idProveedor;
            return proveedor.editar(proveedor);
        }
        public static DataTable buscar(string texto)
        {
            DatosProveedor proveedor = new DatosProveedor();
           
                proveedor.BuscarProveedor= texto;
                return proveedor.buscarTexto(proveedor);
        }
        public static DataTable mostrar()  {
            
                return new DatosProveedor().mostrar();
            }
    



    }
}
