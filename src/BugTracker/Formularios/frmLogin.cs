using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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

        #region Evento de Botones
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
        #endregion

        #region Validaciones
        private bool ValidarCredenciales(Clases.Usuario usuario)
        {
            if (usuario.NombreUsuario == "Christian" && usuario.Contraseña == "123")
                return true;
            return false;
        }
        #endregion

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
    }
}
