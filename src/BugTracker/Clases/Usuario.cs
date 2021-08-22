using System;
using System.Collections.Generic;
using System.Text;

namespace BugTracker.Clases
{
    class Usuario
    {
        public string NombreUsuario { get; set; }
        public string Contraseña { get; set; }

        public Usuario()
        {

        }

        public Usuario(string contraseña, string nombreUsuario)
        {
            this.NombreUsuario = nombreUsuario;
            this.Contraseña = contraseña;
        }
    }
}
