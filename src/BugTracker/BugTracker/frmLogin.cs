﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

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
            //creamos una variable bool usuarioValido, inicialmente con el valor false, la cual se retornara como true si el usuario ingresado es valido
            bool usuarioValido = false;

            //se crea una nueva conexion a base de dato
            //SqlConnection conexion = new SqlConnection();

            //se define la cadena de conexion a la base de datos
            //conexion.ConnectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=PAVI-TP-2021;Integrated Security=true;";


            //utilizamos la funcion try catch para controlar el error si es que lo hay
            try {

                //abrimos la cadena de conexion 
                //conexion.Open();

                //definimos la consulta sql para buscar el usuario ingresado en la bd
                string consultaSql = string.Concat(" SELECT * ",
                                                   "   FROM Usuarios ",
                                                   "  WHERE usuario =  '", pUsuario, "'");

                //Usando el método GetDataManager obtenemos la instancia unica de DataManager (Patrón Singleton) y ejecutamos el método ConsultaSQL()
                DataTable result = DataManager.GetInstance().ConsultaSQL(consultaSql);

                //Validamos que el resultado tenga al menos una fila.
                if (result.Rows.Count >= 1)
                {
                    //En caso de que exista el usuario, validamos que password corresponda al usuario
                    if (result.Rows[0]["password"].ToString() == pPassword)
                    {
                        usuarioValido = true;
                    }
                } 

                //creamos un objeto command para luego ejecutar la consulta sobre la base de datos
                //SqlCommand command = new SqlCommand(consultaSql, conexion);

                // El metodo ExecuteReader retorna un objeto SqlDataReader con la respuesta de la base de datos. 
                // Con SqlDataReader los datos se leen fila por fila, cambiando de fila cada vez que se ejecuta el metodo Read()
                //SqlDataReader reader = command.ExecuteReader();

                // El metodo Read() lee la primera fila disponible, si NO existe una fila retorna false (la consulta no devolvio resultados).
                /*if (reader.Read()){

                    //En caso de que exista el usuario, validamos que password corresponda al usuario
                    if (reader["password"].ToString() == pPassword)
                    {
                        usuarioValido = true;
                    }
                }*/

            }
            catch(SqlException ex)
            {
                //Mostramos un mensaje de error indicando que hubo un error en la base de datos.
                MessageBox.Show(string.Concat("Error de base de datos: ", ex.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            /*finally
            {
                //Preguntamos si el estado de la conexion es abierto antes de cerrar la conexion.
                if (conexion.State == ConnectionState.Open)
                {
                    //Cerramos la conexion
                    conexion.Close();
                }
            }*/

           //Retornamos el valor de usuarioValido.
            return usuarioValido;
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            this.CenterToParent();
        }
    }

}
