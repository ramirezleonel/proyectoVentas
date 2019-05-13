using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos;
using System.Data;
namespace Capa_negocio
{
    public class NegocioConfigEmpresa
    {

        public static DataTable mostrar() {

            return new DatosConfigEmpresa().mostrar();
        }

        public static string agregar(string razonSocial,string condicionFrenteIVA,long cuit,Byte[] logo )
        {
                

            DatosConfigEmpresa empresa = new DatosConfigEmpresa();
            empresa.Cuit = cuit;
            empresa.CondicionFrenteIVA = condicionFrenteIVA;
            empresa.RazonSocial = razonSocial;
            empresa.Logo = logo;
            return empresa.agregarEmpresa(empresa);


        }


        public static string modificar(string razonSocial, string condicionFrenteIVA, Int64 cuit, Byte[] logo)
        {


            DatosConfigEmpresa empresa = new DatosConfigEmpresa();
            empresa.Cuit = cuit;
            empresa.CondicionFrenteIVA = condicionFrenteIVA;
            empresa.RazonSocial = razonSocial;
            empresa.Logo = logo;
            return empresa.ModificarEmpresa(empresa);


        }
    }
}
