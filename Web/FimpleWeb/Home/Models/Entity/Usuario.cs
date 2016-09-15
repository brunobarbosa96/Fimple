using System;
using System.Collections.Generic;

namespace Home.Models.Entity
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Senha { get; set; }
        public int Rgm { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public string Apelido { get; set; }
        public string Email { get; set; }
        public string Curso { get; set; }
        public DateTime DataNascimento { get; set; }
        public IEnumerable<Usuario> UsuariosBloqueados { get; set; }
    }
}