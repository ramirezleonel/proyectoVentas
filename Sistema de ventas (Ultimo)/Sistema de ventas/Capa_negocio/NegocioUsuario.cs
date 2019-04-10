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
    public class NegocioUsuario
    {
        public static DataTable mostrarusuario()
        {

            return new DatosUsuario().mostrarusuario();
        }


    }
}
