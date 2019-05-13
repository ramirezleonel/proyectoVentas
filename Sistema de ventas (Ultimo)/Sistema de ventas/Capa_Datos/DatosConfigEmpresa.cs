using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Datos
{
   public class DatosConfigEmpresa
    {
        private string condicionFrenteIVA;
        private string razonSocial;
        private long cuit;
        private Byte[] logo;
        private int cod_empresa=1;

       
       //getters and setters
        public int Cod_empresa
        {
            get { return cod_empresa; }
            set { cod_empresa = value; }
        }
       public string CondicionFrenteIVA
        {
            get { return condicionFrenteIVA; }
            set { condicionFrenteIVA = value; }
        }
        public string RazonSocial
        {
            get { return razonSocial; }
            set { razonSocial = value; }
        }
        public Byte[] Logo
        {
            get { return logo; }
            set { logo = value; }
        }
        public Int64 Cuit
        {
            get { return cuit; }
            set { cuit = value; }
        }
        

       
        public DataTable mostrar()
       {

           //Modo 1 para DB
           SqlConnection cn = new SqlConnection(Conexion.conexion);
           //le asigno en el constructor el nombre de la tabla
           DataTable dtResult = new DataTable("config_empresa");
           try
           {
               cn.Open();

               SqlCommand comando = ProcAlmacenado.CrearProc(cn, "SP_CONFIG_EMPRESA");
               //Modo 1 MOSTRAR
               SqlParameter parModo = ProcAlmacenado.asignarParametros("@modo", SqlDbType.Int, 1);
               comando.Parameters.Add(parModo);
               SqlParameter parCodEmpresa = ProcAlmacenado.asignarParametros("@cod_empresa", SqlDbType.Int);
               comando.Parameters.Add(parCodEmpresa);

               //creo el objeto adapter del data provider le paso el sqlcommand
               SqlDataAdapter datosResult = new SqlDataAdapter(comando);
               //los resultados los actualizo en el datatable dtResult
               datosResult.Fill(dtResult);

           }
           catch (Exception ex)
           {
               dtResult = null;
               throw ex;
           }
           return dtResult;
       }


       public string agregarEmpresa(DatosConfigEmpresa configEmpresa)
       {
           string respuesta = "";
           //Modo 3 para DB
           SqlConnection cn = new SqlConnection(Conexion.conexion);
           //le asigno en el constructor el nombre de la tabla
           DataTable dtResult = new DataTable("config_empresa");
           try
           {
               cn.Open();

               SqlCommand comando = ProcAlmacenado.CrearProc(cn, "SP_CONFIG_EMPRESA");
               //Modo 3 agregar
               SqlParameter parModo = ProcAlmacenado.asignarParametros("@modo", SqlDbType.Int, 3);
               comando.Parameters.Add(parModo);
              
               SqlParameter parCodEmpresa = ProcAlmacenado.asignarParametros("@cod_empresa", SqlDbType.Int);
               comando.Parameters.Add(parCodEmpresa);

               SqlParameter parRazonSocial = ProcAlmacenado.asignarParametros("@razon_social", SqlDbType.VarChar,configEmpresa.RazonSocial);
               comando.Parameters.Add(parRazonSocial);

               SqlParameter parCuit = ProcAlmacenado.asignarParametros("@cuit", SqlDbType.BigInt, configEmpresa.Cuit);
               comando.Parameters.Add(parCuit);

               SqlParameter parCondicion = ProcAlmacenado.asignarParametros("@condicion_frente_iva", SqlDbType.VarChar, configEmpresa.CondicionFrenteIVA);
               comando.Parameters.Add(parCondicion);

               SqlParameter parLogo = ProcAlmacenado.asignarParametros("@logo", SqlDbType.Image, configEmpresa.Logo);
               comando.Parameters.Add(parLogo);

            
               if (comando.ExecuteNonQuery() == 1)
               {
                   respuesta = "ok";
               }
               else
               {

                   respuesta = "error";
               }
               cn.Close();
           }
           catch (Exception ex)
           {
               throw ex;

           }
           return respuesta;
       }


       public string ModificarEmpresa(DatosConfigEmpresa configEmpresa)
       {
           string respuesta = "";
           //Modo 1 para DB
           SqlConnection cn = new SqlConnection(Conexion.conexion);
           //le asigno en el constructor el nombre de la tabla
           DataTable dtResult = new DataTable("config_empresa");
           try
           {
               cn.Open();

               SqlCommand comando = ProcAlmacenado.CrearProc(cn, "SP_CONFIG_EMPRESA");
               //Modo 2 modificar
               SqlParameter parModo = ProcAlmacenado.asignarParametros("@modo", SqlDbType.Int, 2);
               comando.Parameters.Add(parModo);

               SqlParameter parCodEmpresa = ProcAlmacenado.asignarParametros("@cod_empresa", SqlDbType.Int);
               comando.Parameters.Add(parCodEmpresa);

               SqlParameter parRazonSocial = ProcAlmacenado.asignarParametros("@razon_social", SqlDbType.VarChar, configEmpresa.RazonSocial);
               comando.Parameters.Add(parRazonSocial);

               SqlParameter parCuit = ProcAlmacenado.asignarParametros("@cuit", SqlDbType.Int, configEmpresa.Cuit);
               comando.Parameters.Add(parCuit);

               SqlParameter parCondicion = ProcAlmacenado.asignarParametros("@condicion_frente_iva", SqlDbType.VarChar, configEmpresa.CondicionFrenteIVA);
               comando.Parameters.Add(parCondicion);

               SqlParameter parLogo = ProcAlmacenado.asignarParametros("@logo", SqlDbType.Image, configEmpresa.Logo);
               comando.Parameters.Add(parLogo);
               //creo el objeto adapter del data provider le paso el sqlcommand
               SqlDataAdapter datosResult = new SqlDataAdapter(comando);
               //los resultados los actualizo en el datatable dtResult
               datosResult.Fill(dtResult);


               if (comando.ExecuteNonQuery() == 1)
               {
                   respuesta = "ok";
               }
               else
               {

                   respuesta = "error";
               }
               cn.Close();

           }
           catch (Exception ex)
           {
               dtResult = null;
               throw ex;
           }
           return respuesta;
       }




    }
}
