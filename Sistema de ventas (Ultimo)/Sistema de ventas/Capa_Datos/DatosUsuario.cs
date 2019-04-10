using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Capa_Datos
{
   public class DatosUsuario
    {
        private string usuario;

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }
        private string clave;

        public string Clave
        {
            get { return clave; }
            set { clave = value; }
        }
        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private string turno;

        public string Turno
        {
            get { return turno; }
            set { turno = value; }
        }
        private bool sadmin;

        public bool Sadmin
        {
            get { return sadmin; }
            set { sadmin = value; }
        }

        public DataTable mostrarusuario()
        {
            
            string rpta = "";
            string maquina = System.Environment.MachineName;
           
            SqlConnection cn = new SqlConnection(Conexion.conexion);
            //le asigno en el constructor el nombre de la tabla
            DataTable dtResult = new DataTable("cuentas");
            try
            {
                cn.Open();

                SqlCommand comando = ProcAlmacenado.CrearProc(cn, "SP_USUARIO");

                SqlParameter parModo = ProcAlmacenado.asignarParametros("@modo", SqlDbType.Int, 4);
                comando.Parameters.Add(parModo);

                //SqlParameter parCodigo = ProcAlmacenado.asignarParametros("id", SqlDbType.Int);
                //comando.Parameters.Add(parCodigo);

               

                //creo el objeto adapter del data provider le paso el sqlcommand
                SqlDataAdapter datosResult = new SqlDataAdapter(comando);
                //los resultados los actualizo en el datatable dtResult
                datosResult.Fill(dtResult);

            }
            catch (Exception ex)
            {
                dtResult = null;
                rpta = ex.Message;
                //throw ex;
            }
            return dtResult;
        }

       

    }
}
