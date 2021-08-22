using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace BugTracker
{
    public partial class frmLogin : Form
    {
        public frmLogin()
        {
            InitializeComponent();
        }

        #region Eventos de Botones
        private void btnIngresar_Click(object sender, EventArgs e)
        {
            /*//Validacion de ingreso de un usuario
            if (this.txtUsuario.Text == "")
            {
                MessageBox.Show("Se debe ingresar un usuario", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            //Validacion de ingreso de una clave
            if (this.txtContraseña.Text == "")
            {
                MessageBox.Show("Se debe ingresar una constraseña", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }*/

            string mensaje = "Corrija los siguientes errores: ";

            if (this.txtUsuario.Text == "")
            {
                mensaje += "\n\tIngrese un usuario";
                this.txtUsuario.Focus();
            }

            if (this.txtContraseña.Text == "")
            {
                mensaje += "\n\tIngrese una contraseña";
                if (this.txtUsuario.Text == "")
                {
                    this.txtUsuario.Focus();
                }
                else
                {
                    this.txtContraseña.Focus();
                }
            }

            if (mensaje != "Corrija los siguientes errores: ")
            {
                MessageBox.Show(mensaje, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            Clases.Usuario usuario = new Clases.Usuario();
            usuario.NombreUsuario = this.txtUsuario.Text;
            usuario.Contraseña = this.txtContraseña.Text;

            if (this.ValidarCredenciales(usuario))
                MessageBox.Show("Usted ha ingresado al sistema", "Información", MessageBoxButtons.OK, MessageBoxIcon.Information);
            else
            {
                MessageBox.Show("Acceso denegado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                this.txtContraseña.Text = "";
                this.txtUsuario.Text = "";
                this.txtUsuario.Focus();
            }
                

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }
        #endregion

        #region Eventos de presion de teclas
        private void txtUsuario_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                this.btnIngresar_Click(sender, e);
            if (e.KeyChar == Convert.ToChar(Keys.Escape))
                this.btnSalir_Click(sender, e);
        }

        private void txtContraseña_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == Convert.ToChar(Keys.Enter))
                this.btnIngresar_Click(sender, e);
            if (e.KeyChar == Convert.ToChar(Keys.Escape))
                this.btnSalir_Click(sender, e);
        }
        #endregion

        #region Validaciones
        private bool ValidarCredenciales(Clases.Usuario usuario)
        {
            /*if (usuario.NombreUsuario == "Christian" && usuario.Contraseña == "123")
                return true;
            return false;*/
            //Inicializamos la variable usuarioValido en false, para que solo si el usuario es valido retorne true
            bool usuarioValido = false;

            //La doble barra o */ nos permite escribir comentarios sobre nuestro codigo sin afectar su funcionamiento.

            //Creamos una conexion a base de datos nueva.
            SqlConnection conexion = new SqlConnection();

            //Definimos la cadena de conexion a la base de datos.
            conexion.ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=BugTracker;Integrated Security=true;";

            //La sentencia try...catch nos permite "atrapar" excepciones (Errores) y dar al usuario un mensaje más amigable.
            try
            {
                //Abrimos la conexion a la base de datos.
                conexion.Open();

                //Construimos la consulta sql para buscar el usuario en la base de datos.
                String consultaSql = string.Concat(" SELECT * ",
                                                   "   FROM Usuarios ",
                                                   "  WHERE usuario =  '", usuario.NombreUsuario, "'");

                //Creamos un objeto command para luego ejecutar la consulta sobre la base de datos
                SqlCommand command = new SqlCommand(consultaSql, conexion);

                // El metodo ExecuteReader retorna un objeto SqlDataReader con la respuesta de la base de datos. 
                // Con SqlDataReader los datos se leen fila por fila, cambiando de fila cada vez que se ejecuta el metodo Read()
                SqlDataReader reader = command.ExecuteReader();

                // El metodo Read() lee la primera fila disponible, si NO existe una fila retorna false (la consulta no devolvio resultados).
                if (reader.Read())
                {
                    //En caso de que exista el usuario, validamos que password corresponda al usuario
                    if (reader["password"].ToString() == usuario.Contraseña)
                    {
                        usuarioValido = true;
                    }
                }

            }
            catch (SqlException ex)
            {
                //Mostramos un mensaje de error indicando que hubo un error en la base de datos.
                MessageBox.Show(string.Concat("Error de base de datos: ", ex.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //Preguntamos si el estado de la conexion es abierto antes de cerrar la conexion.
                if (conexion.State == ConnectionState.Open)
                {
                    //Cerramos la conexion
                    conexion.Close();
                }
            }

            // Retornamos el valor de usuarioValido. 
            return usuarioValido;
    }
        #endregion

    }
}
