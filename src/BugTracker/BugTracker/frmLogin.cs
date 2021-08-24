using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
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

        public bool ValidarCredenciales(string pUsuario, string pPassword)
        {
            //Inicializamos la variable usuarioValido en false, para que solo si el usuario es valido retorne true
            bool usuarioValido = false;

            //La doble barra o */ nos permite escribir comentarios sobre nuestro codigo sin afectar su funcionamiento.

            //La sentencia try...catch nos permite "atrapar" excepciones (Errores) y dar al usuario un mensaje más amigable.
            try
            {

                //Construimos la consulta sql para buscar el usuario en la base de datos.
                String consultaSql = string.Concat(" SELECT * ",
                                                   "   FROM Usuarios ",
                                                   "  WHERE usuario =  '", pUsuario, "'");

                //Usando el método GetDataManager obtenemos la instancia unica de DataManager (Patrón Singleton) y ejecutamos el método ConsultaSQL()
                DataTable resultado = DataManager.GetInstance().ConsultaSQL(consultaSql);

                //Validamos que el resultado tenga al menos una fila.
                if (resultado.Rows.Count >= 1)
                {
                    //En caso de que exista el usuario, validamos que password corresponda al usuario
                    if (resultado.Rows[0]["password"].ToString() == pPassword)
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

            // Retornamos el valor de usuarioValido. 
            return usuarioValido;
        }


        private void frmLogin_Load(object sender, EventArgs e)
        {
            this.CenterToParent();
        }
    }

}
