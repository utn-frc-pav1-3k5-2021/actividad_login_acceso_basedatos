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

        public bool ValidarCredenciales(string pUsuario, string pPassword)
        {
            //Inicializar usuarioValido en false
            bool usuarioValido = false;

            //nueva conexion a base de datos
            SqlConnection conexion = new SqlConnection();
            //nos conectamos a la base de datos
            conexion.ConnectionString = "Data Source =.\\SQLEXPRESS; Initial Catalog = BugTracker78755; Integrated Security = true; ";

            try
            {
                //Abrimos conexion a BD
                conexion.Open();

                //Consulta sql
                string consultaSql = string.Concat("SELECT * ",
                                                   "FROM Usuarios ",
                                                   "WHERE usuario = '", pUsuario, "'");
                //Comando de SQL
                SqlCommand comando = new SqlCommand(consultaSql, conexion);

                SqlDataReader reader = comando.ExecuteReader();

                //Lee si existe el usuario
                if(reader.Read())
                {
                    //Valida que sea la contraseña correcta
                    if(reader["password"].ToString() == pPassword)
                    {
                        usuarioValido = true;
                    }
                }

            }
            catch (SqlException excepcion)
            {
                //Mensaje error en base de datos
                MessageBox.Show(string.Concat("Error en la base de datos: ", excepcion.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                //Validar si sigue la conexion abierta, y si sigue abierta la cierra
                if (conexion.State == ConnectionState.Open)
                {
                    conexion.Close();
                }
            }

            //retornamos si el usuario es valido
            return usuarioValido;
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            this.CenterToParent();
        }
    }

}
