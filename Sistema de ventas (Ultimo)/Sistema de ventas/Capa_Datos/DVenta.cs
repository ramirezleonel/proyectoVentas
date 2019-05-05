using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Capa_Datos;


    public class Dventa
    {
        private int idventa;

        public int Idventa
        {
            get { return idventa; }
            set { idventa = value; }
        }
        private char estado;

        public char Estado
        {
            get { return estado; }
            set { estado = value; }
        }
        private int idcliente;

        public int Idcliente
        {
            get { return idcliente; }
            set { idcliente = value; }
        }
        private DateTime fecha;

        public DateTime Fecha
        {
            get { return fecha; }
            set { fecha = value; }
        }
        private string tipo_comprobante;

        public string Tipo_comprobante
        {
            get { return tipo_comprobante; }
            set { tipo_comprobante = value; }
        }
        private string serie;

        public string Serie
        {
            get { return serie; }
            set { serie = value; }
        }
        private string correlativo;

        public string Correlativo
        {
            get { return correlativo; }
            set { correlativo = value; }
        }
        private decimal  iva;

        public decimal  Iva
        {
            get { return iva; }
            set { iva = value; }
        }
        private int trabajador;

        public int Trabajador
        {
            get { return trabajador; }
            set { trabajador = value; }
        }

        public Dventa()
        { }
        public Dventa(int trabajador, int idventa, int idcliente, DateTime fecha, string tipo_comprobante, string serie,string correlativo, decimal iva)
        {
            this.idventa = idventa;
            this.idcliente = idcliente;
            this.trabajador = trabajador;
            this.fecha = fecha;
            this.tipo_comprobante = tipo_comprobante;
            this.correlativo = correlativo;
            this.serie = serie;
            this.iva = iva; 

        }

        //Metodo

        public string DisminuirStock(int idarticulo, decimal cantidad)
        {
            string rpta = "";
            SqlConnection sqlcon = new SqlConnection();
            try
            {
                sqlcon.ConnectionString = Conexion.conexion;
                sqlcon.Open();

                //Creo un procedimiento almacenado y se pasa al sqlCommand
                SqlCommand sqlcmd = ProcAlmacenado.CrearProc(sqlcon, "SP_DETALLEMOVSTOCK");

                SqlParameter paridarticulo = ProcAlmacenado.asignarParametros("@idarticulo", SqlDbType.Int,idarticulo );
                sqlcmd.Parameters.Add(paridarticulo );

                SqlParameter paridDetalleMovStock = ProcAlmacenado.asignarParametros("@iddetalle_movStock", SqlDbType.Int);
                sqlcmd.Parameters.Add(paridDetalleMovStock);

                SqlParameter parcantidad = ProcAlmacenado.asignarParametros("@cantidad", SqlDbType.Decimal, cantidad );
                sqlcmd.Parameters.Add(parcantidad);

                SqlParameter parModo = ProcAlmacenado.asignarParametros("@modo", SqlDbType.Int, 3);
                sqlcmd.Parameters.Add(parModo);

                rpta = sqlcmd.ExecuteNonQuery() == 1 ? "OK" : "No se actualizo el stock";

            }
            catch (Exception ex)
            {
                rpta = ex.Message;
            }
            return rpta;
        }

        public string Insertar(Dventa Venta, List <DDetalle_Venta> Detalle)
        {
            string rpta = "";
            SqlConnection sqlcon = new SqlConnection();

            try
            {
                sqlcon.ConnectionString = Conexion.conexion;
                sqlcon.Open();

                SqlTransaction sqltra = sqlcon.BeginTransaction();

                SqlCommand sqlcmd = ProcAlmacenado.CrearProc(sqlcon, "SP_VENTA",sqltra);
       
                SqlParameter paridventa = ProcAlmacenado.asignarParametros("@idventa", SqlDbType.Int);
                sqlcmd.Parameters.Add(paridventa);
                
                SqlParameter paridcliente = ProcAlmacenado.asignarParametros("@idcliente", SqlDbType.Int, Venta.idcliente);
                sqlcmd.Parameters.Add(paridcliente);

                SqlParameter parfecha = ProcAlmacenado.asignarParametros("@fecha", SqlDbType.DateTime, Venta.fecha);
                sqlcmd.Parameters.Add(parfecha);

                SqlParameter partipocomprobante = ProcAlmacenado.asignarParametros("@tipo_comprobante", SqlDbType.VarChar, Venta.tipo_comprobante);
                sqlcmd.Parameters.Add(partipocomprobante);

                SqlParameter pariva = ProcAlmacenado.asignarParametros("@iva", SqlDbType.Decimal, Venta.iva);
                sqlcmd.Parameters.Add(pariva);

                SqlParameter parModo = ProcAlmacenado.asignarParametros("@modo", SqlDbType.Int, 1);
                sqlcmd.Parameters.Add(parModo);

                rpta = sqlcmd.ExecuteNonQuery() == 1 ? "OK" : "No se ingreso el registro";

                if (rpta.Equals("OK"))
                {
                    Venta.idventa  = Convert.ToInt32(sqlcmd.Parameters["@idventa"].Value);
                    
                    
                    foreach (DDetalle_Venta det in Detalle)
                    {
                        det.Idventa = Venta.idventa;
                        rpta = det.Insertar(det, ref sqlcon, ref sqltra);
                        if (!rpta.Equals("OK"))
                        {
                            break;
                        }
                        else
                        {
                            //actualizamos el stock
                            rpta = DisminuirStock(det.Idarticulo, det.Cantidad);
                            if (!rpta.Equals("OK"))
                            {
                                break;

                            }
                        }

                    }
                }

                if (rpta.Equals("OK"))
                {
                    sqltra.Commit();
                }
                else
                {
                    sqltra.Rollback();
                }

            }
            catch (Exception e)
            {
                rpta = e.Message;
            }
            finally
            {
                if (sqlcon.State == ConnectionState.Open) sqlcon.Close();
            }
            return rpta;
        }

        public string Eliminar(Dventa venta)
        {
            string rpta = "";
            SqlConnection sqlcon = new SqlConnection();
            try
            {
                sqlcon.ConnectionString = Conexion.conexion;
                sqlcon.Open();

                SqlCommand sqlcmd = new SqlCommand();
                sqlcmd.Connection = sqlcon;
                sqlcmd.CommandText = "speliminar_venta";
                sqlcmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paridventa = ProcAlmacenado.asignarParametros("@idventa", SqlDbType.Int, venta.idventa);
                sqlcmd.Parameters.Add(paridventa);

                rpta = sqlcmd.ExecuteNonQuery() == 1 ? "OK" : "No se anulo registro";
            
            }
            catch
            {
                
            }
            return rpta;
        }

        public DataTable Mostrar()
        {
            DataTable DtResultado = new DataTable("venta");
            SqlConnection cn = new SqlConnection(Conexion.conexion);

            try
            {
                cn.Open();

                SqlCommand sqlcmd = ProcAlmacenado.CrearProc(cn, "SP_VENTA");
                //Modo 4 Mostrar
                SqlParameter parModo = ProcAlmacenado.asignarParametros("modo", SqlDbType.Int, 4);
                sqlcmd.Parameters.Add(parModo);


                SqlDataAdapter sqldat = new SqlDataAdapter(sqlcmd);
                sqldat.Fill(DtResultado );
            }
            catch (Exception ex)
            {
                DtResultado = null;
                throw ex;
            }
            return DtResultado;
        }

        public DataTable mostrarRanking5Productos()
        {
            DataTable DtResultado = new DataTable("venta");
            SqlConnection cn = new SqlConnection(Conexion.conexion);

            try
            {
                cn.Open();

                SqlCommand sqlcmd = ProcAlmacenado.CrearProc(cn, "SP_VENTA");
                //Modo 7 Mostrar
                SqlParameter parModo = ProcAlmacenado.asignarParametros("modo", SqlDbType.Int, 7);
                sqlcmd.Parameters.Add(parModo);


                SqlDataAdapter sqldat = new SqlDataAdapter(sqlcmd);
                sqldat.Fill(DtResultado);
            }
            catch (Exception ex)
            {
                DtResultado = null;
                throw ex;
            }
            return DtResultado;
        }

        public DataTable  BuscarFechas(string TextoBuscar, string TextoBuscar2)
        {
            DataTable DtResultado = new DataTable("venta");
            SqlConnection sqlcon = new SqlConnection(Conexion.conexion);
            try
            {


                SqlCommand sqlcmd = ProcAlmacenado.CrearProc(sqlcon, "SP_VENTA");

                //modo 2 para la busqueda
                SqlParameter parModo = ProcAlmacenado.asignarParametros("modo", SqlDbType.Int,2);
                sqlcmd.Parameters.Add( parModo);

                SqlParameter partextobuscar = ProcAlmacenado.asignarParametros("textobuscar", SqlDbType.VarChar, TextoBuscar );
                sqlcmd.Parameters.Add(partextobuscar);

                SqlParameter partextobuscar2 = ProcAlmacenado.asignarParametros("textobuscar2", SqlDbType.VarChar, TextoBuscar2 );
                sqlcmd.Parameters.Add(partextobuscar2);

                SqlDataAdapter sqldat = new SqlDataAdapter(sqlcmd);
                sqldat.Fill(DtResultado);

            }
            catch (Exception ex)
            { 
               DtResultado = null ;
               sqlcon.Close();
               //lanzo una excepcion en el caso de problemas con bd
               throw ex;
            }

            return DtResultado;
        }
        public DataTable MostrarDetalle(string TextoBuscar)
        {
            DataTable DtResultado = new DataTable("detalle_venta");
            SqlConnection sqlcon = new SqlConnection(Conexion.conexion);
            try
            {


                SqlCommand sqlcmd = ProcAlmacenado.CrearProc(sqlcon, "SP_DETALLEVENTA");

                SqlParameter partextobuscar = ProcAlmacenado.asignarParametros("@textobuscar", SqlDbType.VarChar, TextoBuscar );
                sqlcmd.Parameters.Add(partextobuscar);

 
                //modo 2 mostrar
                SqlParameter parModo = ProcAlmacenado.asignarParametros("@modo", SqlDbType.Int, 2);
                sqlcmd.Parameters.Add(parModo);

                SqlDataAdapter sqldat = new SqlDataAdapter(sqlcmd);
                sqldat.Fill(DtResultado);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return DtResultado; 
        }

        //extrae todos los datos de la ultima venta realizada
        public DataTable notaDeVenta()
        {
            DataTable dtResultado = new DataTable("venta");

              SqlConnection cn = new SqlConnection(Conexion.conexion);
            try
            {
                cn.Open();
              
               SqlCommand comando= ProcAlmacenado.CrearProc(cn, "SP_VENTA");
                //Modo 5 nota de venta
                SqlParameter parModo =ProcAlmacenado.asignarParametros("modo", SqlDbType.Int,2);
                comando.Parameters.Add(parModo);

                SqlParameter paridVenta = ProcAlmacenado.asignarParametros("idventa", SqlDbType.Int);
                comando.Parameters.Add(paridVenta);

                SqlDataAdapter datosResult = new SqlDataAdapter(comando);
                //los resultados los actualizo en el datatable dtResult
                datosResult.Fill(dtResultado);
                cn.Close();
            }
            catch (Exception ex)
            {
                dtResultado = null;
                cn.Close();
                //lanzo una excepcion en el caso de problemas con bd
                throw ex;
            }
            return dtResultado;
        }

        public string CambiarEstadoFacturacion(Dventa venta)
        {
            string resultado="";
           

            try
            {
                SqlConnection cn = new SqlConnection(Conexion.conexion);
                cn.Open();
                SqlCommand comando = ProcAlmacenado.CrearProc(cn, "SP_VENTA");

                //modo 6
                SqlParameter parModo= ProcAlmacenado.asignarParametros("modo",SqlDbType.Int,6);
                comando.Parameters.Add(parModo);

                SqlParameter parIdVenta = ProcAlmacenado.asignarParametros("idventa", SqlDbType.Int,venta.Idventa);
                comando.Parameters.Add(parIdVenta);


                SqlParameter parEstado = ProcAlmacenado.asignarParametros("estado", SqlDbType.VarChar, venta.Estado);
                comando.Parameters.Add(parEstado);

                resultado = comando.ExecuteNonQuery() == 1 ? "ok" : "Error";

            }
            catch (Exception ex)
            {
               
                resultado = "Error: " + ex.Message;
            }

            return resultado;
        }
    }   



