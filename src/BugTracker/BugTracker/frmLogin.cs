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

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            if (txtUsuario.Text == "")
            {
                MessageBox.Show("Se debe ingresar un usuario.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }

            if (txtPassword.Text == "")
            {
                MessageBox.Show("Se debe ingresar una contraseña.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }


            if (ValidarCredenciales(txtUsuario.Text, txtPassword.Text))
            {

                MessageBox.Show("Usted a ingresado al sistema.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Close();

            }
            else
            {
                txtUsuario.Text = "";
                txtPassword.Text = "";
                MessageBox.Show("Debe ingresar usuario y/o contraseña válidos", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


        //Sin la CLASE "DataManager"
        public bool ValidarCredencialesSinClase(string pUsuario, string pPassword)
        {

            //Inicializamos la variable usuarioValido en false, para que solo el usuario es valido, retorne

            bool usuarioValido = false;

            //La doble barra "//" o "*/" nos permite escribir comentarios sobre nuestro codigo sin afectar su funcionamiento

            //Creamos una coneccion a la base de datos nueva.

            SqlConnection cnn = new SqlConnection();

            //Definimos la cadena de coneccion a la base de datos.

            cnn.ConnectionString = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=BugTracker;Integrated Security=True";

            //La sentencia try .... catch nos permite "Atrapar" expeciones(Errores) y dar al usuario un mensaje mas amigable

            try
            {

                //Abrimos la conexion a la base de datos

                cnn.Open();

                //Construimos la consulta SQL para buscar el usuario en la base de datos.
                //Usamos el "pUsuario" y no el "txtUsuario.Text", ya que se lo pasa como parametro previamente en la linea 41 del codigo

                string comandoSQL = "Select * From Usuarios Where usuario ='" + pUsuario + "'";

                //Creamos un objeto Command para luego realizar la consulta sobre la Base de datos

                SqlCommand cmd = new SqlCommand(comandoSQL, cnn);

                //El metodo ExecuteReader retorna un objeto SqlDataReader con la respuesta de la base de datos.
                //Con SqlDataReader los datos se leen fila por fila, cambiando de fila cada vez que se ejecuta el metodo Read()

                SqlDataReader reader = cmd.ExecuteReader();

                //El metodo Read() lee la primera fila disponible, sino existe una fila retorna false (la consulta no devolvio resultados).

                if (reader.Read())
                {

                    //En caso de que exista el usuario, validamos que password corresponda al usuario
                    if (reader["password"].ToString() == pPassword)
                    {

                        usuarioValido = true;

                    }

                }



            }

            catch (SqlException slqEx)
            {

                //Mostramos un mensaje de error, indicando que hubo un error en la base de datos
                MessageBox.Show(String.Concat("Error de base de datos", slqEx), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }

            finally
            {
                //Preguntamos si el estado de la conexion es abierto antes de cerrar la conexion.

                if(cnn.State == ConnectionState.Open)
                {

                    //Cerramos la conexion
                    cnn.Close();

                }
            }

            // Retornamos el valor de usuarioValido.
            return usuarioValido;

        }

        public bool ValidarCredenciales(string pUsuario, string pPassword)
        {

            //Inicializamos la variable usuarioValido en false, para que solo si el usuario es valido retorne true 
            bool usuarioValido = false;

            //La doble barra o */ nos permite escribir comentarios sobre nuestro codigo sin afectar su funcionamiento.

            //La sentencia try...catch nos permite "atrapar" excepciones (Errores) y dar al usuario un mensaje más amigable.

            try
            {

                //Construimos la consulta SQL para buscar el usuario en la base de datos.
                string consultaSQL = "Select * From Usuarios Where usuario='" + pUsuario + "'";


                //Usando el método GetDataManager obtenemos la instancia unica de DataManager (Patrón Singleton) y ejecutamos el método ConsultaSQL()
                DataTable resultado = DataManager.GetInstance().ConsultaSQL(consultaSQL);


                //Validamos que el resultado tenga al menos una fila.

                if(resultado.Rows.Count >= 1)
                {

                    //En caso de que exista el usuario, validamos que password corresponda al usuario
                    if (resultado.Rows[0]["password"].ToString() == pPassword)
                    {

                        usuarioValido = true;

                    }

                }

            }
            catch (SqlException sqlEx)
            {

                //Mostramos un mensaje de error indicando que hubo un error en la base de datos.
                MessageBox.Show("Error de Base de Datos: " + sqlEx, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }

            // Retornamos el valor de usuarioValido.
            return usuarioValido;

        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            this.CenterToParent();
        }
    }

}
