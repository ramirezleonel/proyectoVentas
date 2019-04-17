﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos;
using System.Data;
using System.Data.SqlClient;
namespace Capa_negocio
{
    public class NegocioArticulo
    {
        //campos
        private int idArticulo;
        private string nombre;
        private string codigo;
        private string descripcion;
        private int idCategoria;
        private string buscarArticulo;
        private decimal precio;
        private decimal precioCompra;

       
        private int stockActual;
        private Boolean sindatos;

        public static string insertar(string nombre, string codigo, string descripcion, int idCategoria, decimal precio,int cantInicial,int pesable)
        {
            DatosArticulo dArticulo= new DatosArticulo(nombre,codigo,descripcion,idCategoria,precio,cantInicial,pesable);
            return dArticulo.agregar(dArticulo);

        }
        public static string eliminar(int idArticulo)
        {
            
            DatosArticulo dArticulo = new DatosArticulo();
            dArticulo.IdArticulo = idArticulo;
            return dArticulo.eliminar(dArticulo);
        }
        public static string editar(int idArticulo,string nombre, string codigo, string descripcion, int idCategoria,decimal precio,int cantInicial,int pesable)
        {
            DatosArticulo dArticulo = new DatosArticulo(nombre, codigo, descripcion,idCategoria,precio,cantInicial,pesable);
            dArticulo.IdArticulo= idArticulo;
            return dArticulo.editar(dArticulo);
        }
        public static string editarPrecio(int idArticulo, decimal precio)
        {
            DatosArticulo dArticulo = new DatosArticulo(idArticulo, precio);
            return dArticulo.editarPrecio(dArticulo);
        }
        public static string editarPrecioMasivo(DataTable Grillaproductos)
        {
             List<DatosArticulo> listaArticulo= new List<DatosArticulo>();
            foreach (DataRow fila in Grillaproductos.Rows)
	        {
		         DatosArticulo dArticulo = new DatosArticulo();
               dArticulo.IdArticulo = Convert.ToInt32(fila["Codigo"].ToString());
               dArticulo.Precio = Convert.ToDecimal(fila["PrecioVenta"].ToString());
               dArticulo.PrecioCompra = Convert.ToDecimal(fila["PrecioCompra"].ToString());
               dArticulo.Utilidad= Convert.ToInt32(fila["Utilidad"].ToString());
               listaArticulo.Add(dArticulo);
	            }
            DatosArticulo datosArticulo = new DatosArticulo();
            return datosArticulo.editarPrecioMasivo(listaArticulo);
        }
        public static string editarPrecio(int idArticulo, decimal precio,decimal precioCompra,decimal utilidad)
        {
            DatosArticulo dArticulo = new DatosArticulo(idArticulo, precio,precioCompra,utilidad);
            return dArticulo.editarPrecio(dArticulo);
        }
        public static DataTable buscarNombre(string texto)
        {
            DatosArticulo dArticulo = new DatosArticulo();
            dArticulo.BuscarArticulo= texto;
            int buscarNombre=0;
            //si el booleano que le paso es verdadero busca por nombre o sino por codigo de barra
            return dArticulo.buscarTexto(dArticulo,buscarNombre);
        }
        public static DataTable buscarCodigoBarra(string texto)
        {
            DatosArticulo dArticulo = new DatosArticulo();
            dArticulo.BuscarArticulo = texto;
            int buscarCodigoBarra = 1;
            //si el booleano buscarNombre que le paso es verdadero busca por nombre o sino por codigo de barra
            return dArticulo.buscarTexto(dArticulo,buscarCodigoBarra);
        }
       
        public static DataTable buscarCategoria(string texto)
        {
            DatosArticulo dArticulo = new DatosArticulo();
            dArticulo.BuscarArticulo = texto;
            int buscarCategoria = 2;
            //si el booleano buscarNombre que le paso es verdadero busca por nombre o sino por codigo de barra
            return dArticulo.buscarTexto(dArticulo, buscarCategoria);
        }
        public static DataTable buscarIdProducto(string texto)
        {
            DatosArticulo dArticulo = new DatosArticulo();
            dArticulo.BuscarArticulo = texto;
            int buscaridProducto = 3;
            //si el booleano buscarNombre que le paso es verdadero busca por nombre o sino por codigo de barra
            return dArticulo.buscarTexto(dArticulo, buscaridProducto);
        }
        public static DataTable mostrar()
        {
            return new DatosArticulo().mostrar();
        }

      //devuelve el valor de idArticulo
        public static int obtenerIdArticulo()
        {
            int idArticuloActual=0;
            DatosArticulo dArticulo = new DatosArticulo();
            idArticuloActual= dArticulo.obtenerIdArticulo();
            if(idArticuloActual==0||idArticuloActual==null){

                throw new FormatException();
            }
            return idArticuloActual;
        }
        //obtengo el producto correspondiente a un idArticulo
        public static DataTable obtenerProductoXIdArticulo(int idArticulo)
        {
  
            DatosArticulo dArticulo = new DatosArticulo();
            dArticulo.IdArticulo = idArticulo;
            return dArticulo.obtenerProductoXIdProducto(dArticulo);
        }
        public static int calcDigControl(String codigoBarra)
        {
            int resultado = 0;
            int pares = 0, impares = 0;

            for (int i = 0; i < 12; i++)
            {
                if (i % 2 == 0 || i == 0)
                {
                    pares += int.Parse(codigoBarra[i].ToString());

                    
                }
                else
                {
                    impares += int.Parse(codigoBarra[i].ToString()) * 3;

                }

            }
            resultado = pares + impares;
            //obtengo el ultimo digito de la derecha y lo resto con 10 para saber el digito de control
            if (resultado % 10 == 0)
            {
                return resultado = 0;

            }
            //restamos el numero diez para saber cuanto falta para llegar al numero 10 menos el resto del numero dividiendo por 10
            resultado = 10 - (resultado % 10);

            return resultado;



        }

        //extrae los datos de la base por el articulo buscado del id 
        // si el tipo es poridarticulo te lo trae por el codigo si no porbarra

        public void extraerdatos(long codArticulo, string tipo)
        {
            DatosArticulo ObjArticulo = new DatosArticulo();


            ObjArticulo.ExtraerDatos(codArticulo, tipo);

            this.idArticulo = ObjArticulo.IdArticulo;
            this.nombre = ObjArticulo.Nombre;
            this.codigo = ObjArticulo.Codigo;
            this.descripcion = ObjArticulo.Descripcion;
            this.idCategoria = ObjArticulo.IdCategoria;
            this.precio = ObjArticulo.Precio;
            this.sindatos = ObjArticulo.Sindatos; 

        }




        public Boolean Sindatos
        {
            get { return sindatos; }
            set { sindatos = value ; }
        
        }
        public int IdArticulo
        {
            get { return idArticulo; }
            set { idArticulo = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        public string Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        public int StockActual
        {
            get { return stockActual; }
            set { stockActual = value; }
        }

        public int IdCategoria
        {
            get { return idCategoria; }
            set { idCategoria = value; }
        }

        public string BuscarArticulo
        {
            get { return buscarArticulo; }
            set { buscarArticulo = value; }
        }
        public decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }
        public decimal PrecioCompra
        {
            get { return precioCompra; }
            set { precioCompra = value; }
        }
    }
}
