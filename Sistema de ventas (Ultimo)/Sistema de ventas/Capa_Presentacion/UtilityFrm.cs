using System;
using System.Collections.Generic;
using System.Linq;
using System.Media;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace Capa_Presentacion
{
    public class UtilityFrm
    {
        //sobreCargas para limpiar textbox
        public static void limpiarTextbox(TextBox txt1)
        {
            txt1.Text = "";
            
        }
         public static void limpiarTextbox(TextBox txt1,TextBox txt2)
        {
            txt1.Text = "";
            txt2.Text = "";
           
            
        }
         public static void limpiarTextbox(TextBox txt1, TextBox txt2, TextBox txt3)
         {
             txt1.Text = "";
             txt2.Text = "";
             txt3.Text = "";
         }
         public static void limpiarTextbox(TextBox txt1, TextBox txt2, TextBox txt3, TextBox txt4)
         {
             txt1.Text = "";
             txt2.Text = "";
             txt3.Text = "";
             txt4.Text = "";
         }   
         public static void limpiarTextbox(TextBox txt1, TextBox txt2, TextBox txt3, TextBox txt4, TextBox txt5)
        {
            txt1.Text = "";
            txt2.Text = "";
            txt3.Text = "";
            txt4.Text = "";
            txt5.Text = "";
        }
         public static void limpiarTextbox(TextBox txt1, TextBox txt2, TextBox txt3, TextBox txt4, TextBox txt5,TextBox txt6)
         {
             txt1.Text = "";
             txt2.Text = "";
             txt3.Text = "";
             txt4.Text = "";
             txt5.Text = "";
             txt6.Text = "";
         }

        //limpiar errores Provider
        /// <summary>
        /// Limpia una caja de texto que esté afectado por algun icono de error
        /// </summary>
        /// <param name="txt1"></param>
        /// <param name="e"></param>
         public static void limpiarErrorProvider(TextBox txt1,ErrorProvider e)
         {
            
           
             e.SetError(txt1,"");
           
         }
        /// <summary>
         ///   Limpia una caja de texto que esté afectado por algun icono de error
        /// </summary>
        /// <param name="txt1"></param>
        /// <param name="txt2"></param>
        /// <param name="e"></param>
         public static void limpiarErrorProvider(TextBox txt1, TextBox txt2, ErrorProvider e)
         {

            
             e.SetError(txt1, ""); 
             e.SetError(txt2, "");

         }
        /// <summary>
         ///   Limpia una caja de texto que esté afectado por algun icono de error
        /// </summary>
        /// <param name="txt1"></param>
        /// <param name="txt2"></param>
        /// <param name="txt3"></param>
        /// <param name="e"></param>
         public static void limpiarErrorProvider(TextBox txt1, TextBox txt2,TextBox txt3 ,ErrorProvider e)
         {

        
             e.SetError(txt1, "");
             e.SetError(txt2, "");
             e.SetError(txt3, "");
         }
         //mensaje de confirmacion
         public static void mensajeConfirm(string mensaje)
         {
             MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Information);
         }
         //mensaje de error
         public static void mensajeError(string mensaje)
         {
             MessageBox.Show(mensaje, "Sistema de Ventas", MessageBoxButtons.OK, MessageBoxIcon.Error);
         
         }
        
        /// <summary>
         /// Sirve para permitir solo valores numericos y decimales en textbox,el punto convierte en coma
        /// </summary>
        /// <param name="keyPressEventArgs"></param>
        /// <param name="textbox"></param>
         public static void NumDecTeclado(KeyPressEventArgs e,TextBox txt)
         { 
         //solo valores numericos

            if (Char.IsDigit(e.KeyChar))
            {
                
                e.Handled = false;
                
               
            }else if(e.KeyChar == ',' && !txt.Text.Contains(',')){
                e.Handled = false;
                //solo una coma decimal
               
            

            }
            else if (e.KeyChar == '.' && !txt.Text.Contains(','))
            {

                e.Handled = true;
                txt.Text += ",";
                //se mueve hasta la ultima posicion
                txt.Select(txt.Text.Length, 0);
            }


            else if (Char.IsControl(e.KeyChar))
            {

                e.Handled = false;
            }

            else
            {
                e.Handled = true;
                SystemSounds.Beep.Play();
            }
        
    
         }
        /// <summary>
        /// Permite solo valores numerico en textbox
        /// </summary>
        /// <param name="e"></param>
        /// <param name="txt"></param>
         public static void NumTeclado(KeyPressEventArgs e, TextBox txt)
         {
             if (Char.IsDigit(e.KeyChar))
             {

                 e.Handled = false;

             }
            
             else if (Char.IsControl(e.KeyChar))
             {

                 e.Handled = false;
             }

             else
             {
                 e.Handled = true;
                 SystemSounds.Beep.Play();
             }
         }
    }
}
